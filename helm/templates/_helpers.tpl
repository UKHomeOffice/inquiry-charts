{{/*
Selector labels
*/}}
{{- define "selectorLabels" -}}
name: {{ .Values.name }}
{{- end }}

{{/*
Maintenance Selector labels
*/}}
{{- define "maintenanceSelectorLabels" -}}
name: {{ .Values.name }}-maintenance
{{- end }}

{{/*
Admin Selector labels
*/}}
{{- define "adminSelectorLabels" -}}
name: {{ .Values.name }}-admin
{{- end }}