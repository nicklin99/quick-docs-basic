#!/usr/bin/env sh

# 部署github

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd website/public

echo 'quickdocs.wfell.top' > CNAME

git init
git add -A
git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:nicklin99/quick-docs-basic.git master:gh-pages

cd -