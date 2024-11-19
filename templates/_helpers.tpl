{{/*
Selector labels
*/}}
{{- define "selectorLabels" -}}
name: {{ .Values.name }}
{{- end }}

{{/*
Admin Selector labels
*/}}
{{- define "adminSelectorLabels" -}}
name: {{ .Values.name }}-admin
{{- end }}