#!/bin/sh
# 判断某个提交是否还没包含 upstream/main。
# 已包含输出 no，否则输出 yes。调用前需要已经 fetch 过 upstream main。
set -eu
ref="${1:?需要一个提交}"
if git merge-base --is-ancestor upstream/main "$ref"; then
  echo no
else
  echo yes
fi
