# Change Log

All notable changes to this project will be documented in this file.

{{ range .Versions }}
<a name="{{ .Tag.Name }}"></a>
## {{ if .Tag.Previous }}[{{ .Tag.Name }}]{{ else }}{{ .Tag.Name }}{{ end }} - {{ datetime "2006-01-02" .Tag.Date }}
{{ if .CommitGroups -}}
{{ range .CommitGroups -}}
### {{ .Title }}
{{ range .Commits -}}
{{/* SKIPPING RULES - START */ -}}
{{- if not (hasPrefix .Subject "Updated CHANGELOG") -}}
{{- if not (contains .Subject "[ci skip]") -}}
{{- if not (contains .Subject "[skip ci]") -}}
{{- if not (contains .Subject "[wip]") -}}
{{- if not (hasPrefix .Subject "Merge pull request ") -}}
{{- if not (hasPrefix .Subject "Added CHANGELOG") -}}
{{- /* SKIPPING RULES - END */ -}}
- {{ if .Scope }}**{{ .Scope }}:** {{ end }}{{ .Subject }}
{{/* SKIPPING RULES - START */ -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{/* SKIPPING RULES - END */ -}}
{{ end }}
{{ end -}}
{{ else }}
{{ range .Commits -}}
{{/* SKIPPING RULES - START */ -}}
{{- if not (hasPrefix .Subject "Updated CHANGELOG") -}}
{{- if not (contains .Subject "[ci skip]") -}}
{{- if not (contains .Subject "[skip ci]") -}}
{{- if not (contains .Subject "[wip]") -}}
{{- if not (hasPrefix .Subject "Merge pull request ") -}}
{{- if not (hasPrefix .Subject "Added CHANGELOG") -}}
{{- /* SKIPPING RULES - END */ -}}
- {{ if .Scope }}**{{ .Scope }}:** {{ end }}{{ .Subject }}
{{/* SKIPPING RULES - START */ -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{ end -}}
{{/* SKIPPING RULES - END */ -}}
{{ end }}
{{ end -}}

{{- if .NoteGroups -}}
{{ range .NoteGroups -}}
### {{ .Title }}
{{ range .Notes }}
{{ .Body }}
{{ end }}
{{ end -}}
{{ end -}}
{{ end -}}

{{- if .Versions }}
[Unreleased]: {{ .Info.RepositoryURL }}/compare/diff?{{ $latest := index .Versions 0 }}sourceBranch=refs%2Ftags%2F{{ $latest.Tag.Name }}

{{ range .Versions -}}
{{ if .Tag.Previous -}}
[{{ .Tag.Name }}]: {{ $.Info.RepositoryURL }}/compare/diff?targetBranch=refs%2Ftags%2F{{ .Tag.Name }}&sourceBranch=refs%2Ftags%2F{{ .Tag.Previous.Name }}
{{ end -}}
{{ end -}}
{{ end -}}
