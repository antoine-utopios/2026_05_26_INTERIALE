# Cheatsheet - Helm

## Les 3 idées clés

1. **Un chart = un package paramétrable** — Chart.yaml + values.yaml + templates/ + helpers
2. **Les values sont fusionnées en cascade** — defaults < values-env.yaml < `--set` (le plus à droite gagne)
3. **`helm template` avant tout install** — équivalent du `terraform plan`, indispensable en CI

## Vocabulaire essentiel

| Terme | Définition |
|-------|------------|
| Chart | Package : Chart.yaml + values.yaml + templates/ |
| Release | Installation d'un chart dans un namespace |
| Repository | Dépôt de charts (HTTP ou OCI) |
| Values | Paramètres passés au chart |
| Helper | Fonction template définie dans `_helpers.tpl` |
| Hook | Code exécuté à un moment du cycle (pre-install, post-install, test) |
| Umbrella chart | Chart qui embarque des sous-charts comme dépendances |

## Commandes à retenir

```bash
# Découverte
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm search repo postgres
helm show chart bitnami/postgresql
helm show values bitnami/postgresql > defaults.yaml

# Cycle de vie
helm install pg bitnami/postgresql -n data --create-namespace -f values.yaml --atomic --timeout 5m
helm upgrade pg bitnami/postgresql -n data -f values.yaml --reuse-values --set replicaCount=3
helm rollback pg 2 -n data
helm uninstall pg -n data

# Inspection
helm list -A
helm status pg -n data
helm history pg -n data
helm get values pg -n data
helm get manifest pg -n data

# Création
helm create mychart
helm lint mychart
helm template mychart > /tmp/rendered.yaml
helm install mychart ./mychart --dry-run --debug

# Packaging / OCI
helm package ./mychart -d ./dist
helm push ./dist/mychart-0.1.0.tgz oci://localhost:5000/m2i/charts
helm install demo oci://localhost:5000/m2i/charts/mychart --version 0.1.0
```

## Pattern de référence (chart minimal)

```
mychart/
  Chart.yaml             # apiVersion, name, version, appVersion
  values.yaml            # defaults
  values-dev.yaml        # overrides dev
  values-prod.yaml       # overrides prod
  templates/
    _helpers.tpl         # define mychart.fullname, mychart.labels
    deployment.yaml      # include helpers, range env, if conditions
    service.yaml
    configmap.yaml       (optionnel)
    secret.yaml          (optionnel)
    ingress.yaml         (optionnel)
    hpa.yaml             (optionnel)
    NOTES.txt
```

## Templating

```yaml
# Variables
{{ .Values.image.repository }}      # values.yaml
{{ .Release.Name }}                 # nom de la release
{{ .Chart.AppVersion }}             # Chart.yaml
{{ include "mychart.fullname" . }}  # helper

# Fonctions
{{ .Values.x | default "y" }}
{{ .Values.x | quote }}
{{ .Values.x | nindent 4 }}
{{ required "x is required" .Values.x }}
{{ toYaml .Values.resources | nindent 4 }}

# Contrôle de flux
{{- if .Values.ingress.enabled }} ... {{- end }}
{{- range $k, $v := .Values.env }} - name: {{ $k }} {{- end }}
{{- with .Values.affinity }} ... {{- end }}
```

## Pièges à éviter

- Ne JAMAIS committer une value sensible (mot de passe, token) dans Git
- `--reuse-values` avec `--set` peut surprendre : préférer `--reset-values --set ...` quand on veut tout repartir
- `latest` comme tag d'image dans `values.yaml` = source de bugs
- `helm install` sans `--atomic` = risque de half-deploy
- `helm.sh/hook: test` ne s'exécute pas à `helm install`, il faut `helm test`

## Pour approfondir

- [Documentation officielle Helm](https://helm.sh/docs/)
- [Bonnes pratiques chart](https://helm.sh/docs/chart_best_practices/)
- [Artifact Hub](https://artifacthub.io)
