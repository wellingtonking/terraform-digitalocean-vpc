.PHONY: CHANGELOG.md tag-final-minor tag-candidate-minor common_opensearch_iam_user

README.md: common_opensearch_iam_user
	terraform-docs markdown --hide providers  --hide resources . > README.md

common_opensearch_iam_user:
	$(MAKE) -C $@

CHANGELOG.md:
	git-chglog -o CHANGELOG.md --next-tag `semtag final -s minor -o -f 2> /dev/null`

tag-final-minor:
	# Tagging a major, minor or patch level version only works for the default (main/master) branch, if you
	# want to tag a different branch, you can either use the `git tag` command manually, use `semtag -f ...` or
	# use the `semtag` with a non final tag, for example `semtag alpha -s minor` (or `beta` or `candidate`).
	semtag final -s minor

tag-candidate-minor:
	# This target can be used to tag a branch other than the main/master branch. It's more of a reminder
	# about semtag syntax than anything else really.
	semtag candidate -s minor
