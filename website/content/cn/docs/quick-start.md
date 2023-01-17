---
title: "快速上手"
description:  快速上手使用极速文档
date: 2023-01-14T23:25:55+08:00
draft: true
weight: 1
---

## 安装Hugo

直接去github 最近发布页面 <https://github.com/gohugoio/hugo/releases/latest>,下载扩展版

- 0.109.0是最新版本号
- hugo_extended表示扩展版

根据系统选择下载对应的包

- macos下载 `hugo_extended_0.109.0_darwin-universal.tar.gz`
- windows下载 `hugo_extended_0.109.0_windows-amd64.zip`
- linux下载使用包管理安装

下载后解压放到系统路径下，

- macos 可以将 hugo 放到 `/usr/local/bin`
- windows 直接安装msi文件
- linux由包管理自动安装

终端查看版本号

```bash
hugo version
# 返回
hugo v0.109.0-47b12b83e636224e5e601813ff3e6790c191e371+extended darwin/amd64 BuildDate=2022-12-23T10:38:11Z VendorInfo=gohugoio
```

返回说明hugo安装成功

## 创建站点

终端 cd 到项目目录

```bash
hugo new site quick-docs-start -f yaml
```

- 生成项目根目录`quick-docs-start`
- -f yaml 使用yaml格式配置文件，默认toml不常用，或者 -f json, 推荐用yaml

## 添加主题模块

1. 将网站初始化模块

此操作类似`npm init`生成package.json

`nicklin99` 换成自己的 username
`quick-docs-start` 换成自己的site名称

```bash
hugo mod init github.com/nicklin99/quick-docs-start
```

2. 配置依赖包

此操作类似`npm install bootstrap`, 只是`npm 将安装和配置一步到位了`

go module，还是分开操作的，config.yaml 配置所需要的依赖包

```yaml config.yaml
module:
  proxy: https://proxy.golang.com.cn,direct
  imports:
  - path: github.com/nicklin99/quick-docs-basic
```

3. 安装依赖模块`quick-docs-basic`

此操作类似`npm install`下载安装依赖

```bash
hugo mod get github.com/nicklin99/quick-docs-basic
```

安装后就可以启动了

4. 启动

```bash
hugo server -D
```

成功后，启动后会发现除了首页，进入文档页面都是空的,接下来就是编写内容

## 编写文档

```bash
hugo new content/hello.md
```

## 配置文件

建议参考`quick-docs-basic`website中的`config.yaml`配置

## 生产部署

一切就绪后就可以运行下面命令生成html，默认在`public`目录下

```bash
hugo -D 
```

将public里内容部署到服务器即可

**注意**

如果部署到非根目录，修改`baseURL`后，重新运行`hugo -D`生成

```yaml
# 比如`dist`目录下
baseURL: /dist
```

## 多语言

默认是一个config.yaml,如果多语言建议拆分配置文件

```
├── config
│   ├── _default
│   │   ├── config.yaml
│   │   ├── languages.yaml
│   │   └── params.yaml
│   ├── production
│   │   ├── config.yaml
│   │   └── params.yaml
│   └── staging
│       ├── config.yaml
│       └── params.yaml
```

- `hugo server`本地使用的_default目录下配置文件,
- `hugo`使用的production和_default的合并配置
- staging不是很常用

更多了解[hugo配置文档](https://gohugo.io/getting-started/configuration/)

继续多语言，创建`config/_default/languages.yaml`

- cn 简体中文
- en 英文

```yaml
cn:
  params:
    linkedin: 
  title: 极速文档
  languageName: 中文
  contentDir: content/cn
  weight: 2
en:
  params:
    linkedin: 
  title: QuickPress
  languageName: English
  # 目录方式
  contentDir: content/en
  weight: 1
```

设置默认内容语言，不设默认en

```yaml config.yaml
# config.yaml
defaultContentLanguage: cn
```

### 翻译md文件

hugo支持2种方式

- 同目录，比如 content/about.md, content/about.en.md
- 不同目录，比如 content/about.md, content/en/about.md

不同目录需要在 languages.yaml 配置对应的`content: content/en`

### 翻译模板

新建 i18n/cn.yaml 中文， i18n/en.yaml 英文

```yaml cn.yaml
- id: lastmod
  translation: "更新时间"
```

```yaml en.yaml
- id: lastmod
  translation: "Last Mod"
```

模板读取

```html
{{ T "lastmod" }}
```
