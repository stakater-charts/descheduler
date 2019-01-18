{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "descheduler.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "descheduler.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "descheduler.labels.selector" -}}
app: {{ template "descheduler.name" . }}
group: {{ .Values.descheduler.labels.group }}
provider: {{ .Values.descheduler.labels.provider }}
{{- end -}}

{{- define "descheduler.labels.stakater" -}}
{{ template "descheduler.labels.selector" . }}
version: "{{ .Values.descheduler.labels.version }}"
{{- end -}}

{{- define "descheduler.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
