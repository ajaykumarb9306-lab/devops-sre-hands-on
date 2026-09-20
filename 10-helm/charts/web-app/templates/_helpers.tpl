{{- define "web-app.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "web-app.fullname" -}}
{{ .Release.Name }}-{{ include "web-app.name" . }}
{{- end }}
