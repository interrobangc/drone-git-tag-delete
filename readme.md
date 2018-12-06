# Deletes a tag from git if it exists.

This plugin requires drone oauth user to have write access to your git repo. Obviously, you should put a lot of thought into the security implications before giving drone more access than it needs.

```yaml
---
kind: pipeline
name: default

steps:
  - name: delete tag
    image: interrobangc/drone-git-tag-delete
    settings:
      tag: some-tag-name
      fail_on_missing: true
```