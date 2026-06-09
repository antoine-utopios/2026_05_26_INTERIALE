# Cheatsheet - GitOps avec ArgoCD

## Les 3 idées clés

1. **Git = source unique de vérité** — état désiré versionné, signé, audité
2. **Réconciliation continue par pull** — un agent in-cluster détecte les drifts et corrige
3. **Rollback = git revert** — pas un bouton magique, un commit explicite et tracé

## Vocabulaire essentiel

| Terme | Définition |
|-------|------------|
| Application | Objet ArgoCD qui décrit ce qu'on déploie |
| ApplicationSet | Générateur d'Applications |
| AppProject | Groupe logique d'Applications avec RBAC |
| Sync | Application des manifestes Git vers le cluster |
| OutOfSync | État Git ≠ état cluster |
| Drift | Modification manuelle dans le cluster |
| Self-heal | Réconciliation auto qui écrase les drifts |
| Sync wave | Annotation pour ordonner les déploiements |
| Hook | Action déclenchée à PreSync, Sync, PostSync |
| Generator | Source de génération d'ApplicationSet (List, Git, Cluster, Matrix) |

## Commandes à retenir

```bash
# Installation
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.13.0/manifests/install.yaml
kubectl wait --namespace argocd --for=condition=available deployment --all --timeout=300s

# Accès UI
kubectl -n argocd port-forward svc/argocd-server 8080:443
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# CLI
argocd login localhost:8080 --username admin --password "$PWD" --insecure
argocd cluster list
argocd repo add <URL> [--username ... --password ...]
argocd repo list
argocd proj list
argocd proj get m2i

# Applications
argocd app list
argocd app get demo-api-dev
argocd app sync demo-api-dev --timeout 180
argocd app sync demo-api-dev --force
argocd app wait demo-api-dev --health --timeout 180
argocd app diff demo-api-dev
argocd app history demo-api-dev
argocd app rollback demo-api-dev <revision>
argocd app delete demo-api-dev --cascade

# Refresh sans attendre le poll
argocd app get demo-api-dev --refresh
argocd app get demo-api-dev --refresh --hard-refresh
```

## Pattern de référence

### Application Helm

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: demo-api-dev
  namespace: argocd
  finalizers: [resources-finalizer.argocd.argoproj.io]
spec:
  project: m2i
  source:
    repoURL: <REPO_URL>
    targetRevision: main
    path: apps/demo-api-chart
    helm:
      releaseName: demo-api
      valueFiles:
        - values.yaml
        - ../../gitops/environments/dev/values.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: demo-api-dev
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true
      - ServerSideApply=true
```

### ApplicationSet (générateur Git)

```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: demo-api-set
  namespace: argocd
spec:
  generators:
    - git:
        repoURL: <REPO_URL>
        revision: main
        directories:
          - path: gitops/environments/*
  template:
    metadata:
      name: 'demo-api-{{path.basename}}'
    spec:
      project: m2i
      source:
        repoURL: <REPO_URL>
        targetRevision: main
        path: apps/demo-api-chart
        helm:
          valueFiles:
            - ../../{{path}}/values.yaml
      destination:
        server: https://kubernetes.default.svc
        namespace: 'demo-api-{{path.basename}}'
      syncPolicy:
        automated: {prune: true, selfHeal: true}
        syncOptions: [CreateNamespace=true]
```

## Status d'une Application

| Status | Signification |
|--------|---------------|
| **Synced** | Cluster = Git |
| **OutOfSync** | Drift détecté |
| **Healthy** | Toutes les ressources OK |
| **Degraded** | Au moins une ressource KO |
| **Progressing** | Sync en cours |
| **Missing** | Application non encore appliquée |
| **Unknown** | Repo inaccessible, etc. |

## Pièges à éviter

- Ne jamais `kubectl apply -f` directement sur une ressource gérée par ArgoCD (drift garanti)
- `git push --force` sur main interdit (réécriture d'historique → ArgoCD perd la trace)
- `selfHeal: true` + `prune: true` en prod sans canary = risque de "scorched earth"
- `argocd app rollback` = hotfix seulement, suivre d'un `git revert`
- Secrets en clair dans Git interdit

## Pour approfondir

- [Documentation ArgoCD](https://argo-cd.readthedocs.io/)
- [OpenGitOps principles](https://opengitops.dev)
- [Argo Image Updater](https://argocd-image-updater.readthedocs.io/)
