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
hugo new site document-hello -f yaml
```

- 生成项目根目录`document-hello`
- -f yaml 使用yaml格式配置文件，默认toml不常用，或者 -f json

### 添加主题

必须要添加主题

## 启动本地开发

```
hugo server -D
```

- D 表示包含草稿文件

## 生产部署

```bash
hugo -D 
```

## 多语言

创建`config/_default/languages.yaml`

- zh-CN 简体中文
- en 英文

```yaml
zh-CN:
  params:
    linkedin: 
  title: 极速文档
  languageName: 中文
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
defaultContentLanguage: zh-CN
```

### 翻译md文件

hugo支持2种方式

- 同目录，比如 content/about.md, content/about.en.md
- 不同目录，比如 content/about.md, content/en/about.md

不同目录需要在 languages.yaml 配置对应的`content: content/en`

### 翻译模板
