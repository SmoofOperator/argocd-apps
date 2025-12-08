{{- define "nginx.fullname" -}}
{{ .Release.Name }}-{{ .Values.name }}
{{- end }}
