{{/* Expand the name of the chart. */}}
{{- define "component.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Helm standard labels */}}
{{- define "component.helm_std_labels" }}
chart: {{ .Chart.Name }}-{{ .Chart.Version }}
heritage: {{ .Release.Service }}
release: {{ .Release.Name }}
name: {{ template "component.name" . }}
{{- end }}

{{/* Specific labels */}}
{{- define "component.inherent_labels" }}
app: {{ template "component.name" . }}
{{- end }}

{{/* Choose the image tag */}}
{{- define "component.image.tag" -}}
{{- if .Values.global.image.tag -}}
  {{- printf "%s" .Values.global.image.tag -}}
{{- else -}}
  {{- printf "%s" .Values.image.tag -}}
{{- end -}}
{{- end -}}
