#!/bin/bash
# Usage: ./release.sh [patch|minor|major] [-m "tag message"]
#
# Bumps the next version after the latest vX.Y.Z git tag (default: patch),
# writes it to fu.meta.yaml, commits that file, and creates an annotated tag
# vX.Y.Z on the commit.  Never pushes.
set -euo pipefail
cd "$(dirname "$0")"

level=patch
msg=
while [ $# -gt 0 ]; do
    case "$1" in
        patch|minor|major) level=$1 ;;
        -m) shift; msg=${1:?-m needs a message} ;;
        *) echo "usage: $0 [patch|minor|major] [-m message]" >&2; exit 2 ;;
    esac
    shift
done

meta=fu.meta.yaml

latest=$(git tag --list 'v[0-9]*.[0-9]*.[0-9]*' --sort=-v:refname | head -1)
latest=${latest#v}
[ -n "$latest" ] || { echo "no vX.Y.Z tags found" >&2; exit 1; }

IFS=. read -r maj min pat <<<"$latest"
case $level in
    major) maj=$((maj + 1)); min=0; pat=0 ;;
    minor) min=$((min + 1)); pat=0 ;;
    patch) pat=$((pat + 1)) ;;
esac
new=$maj.$min.$pat

# only fu.meta.yaml may have uncommitted changes (we commit just that file)
if [ -n "$(git diff --cached --name-only | grep -vx "$meta" || true)" ]; then
    echo "other files are staged; unstage them first" >&2; exit 1
fi

sed -i -E "s/^version:.*/version: $new/" "$meta"
grep -qx "version: $new" "$meta" || { echo "failed to update $meta" >&2; exit 1; }

git add "$meta"
if git diff --cached --quiet -- "$meta"; then
    echo "$meta already at $new; tagging HEAD"
else
    git commit -m "release v$new" -- "$meta"
fi
git tag -a "v$new" -m "${msg:-v$new}"

echo "released v$new (latest tag was v$latest); not pushed"
echo "push with: git push && git push origin v$new"
