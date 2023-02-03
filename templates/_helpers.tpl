{{/*
创建一个默认的应用名称，截取63个字符是因为 Kubernetes 的 name 属性的限制（DNS 命名规范）。
*/}}
{{- define "mychart.fullname" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "mychart.app" -}}
"{{ .Chart.Version }}"
{{- end -}}

{{/*
Generate default labels
*/}}
{{- define "mychart.labels" }}
app: {{ .Chart.Name }}
{{- end }}

{{- /* PVC */}}
{{- define "mychart-pvc.fullname" -}}
    pvc.{{- include "mychart.fullname" . }}.{{ .Release.Namespace }}.{{ .Values.env }}
{{- end }}

{{- /*
  mychart-version-to-git-ref:
    Renders a valid git reference from a chartpress generated version string.
    In practice, either a git tag or a git commit hash will be returned.
*/}}
{{- define "mychart-version-to-git-ref" -}}
{{- regexReplaceAll ".*[.-]n\\d+[.]h(.*)" . "${1}" }}
{{- end }}