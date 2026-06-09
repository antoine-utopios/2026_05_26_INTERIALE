{{- define "app-name" -}}
{{- printf "%s-%s" .Chart.Name .Release.Name  -}}
{{- end }}


{{- define "common-labels" -}}
tier: {{ .Values.appTier }}
app: {{ include "app-name" . }}
{{- end }}