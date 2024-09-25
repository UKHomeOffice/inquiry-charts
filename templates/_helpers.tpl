{{/*
Selector labels
*/}}
{{- define "selectorLabels" -}}
{{- if .Values.static.enabled -}}
name: {{ .Values.name }}-nginx
{{- else -}}
name: {{ .Values.name }}
{{- end -}}
{{- end }}

{{/*
Admin Selector labels
*/}}
{{- define "adminSelectorLabels" -}}
name: {{ .Values.name }}-admin
{{- end }}