---
title: template
description: Hugo 使用 go `html/template` and `text/template` libraries 
date: 2023-01-16T00:36:49+08:00
weight: 1
---

Hogo template其实就是Go template，后面就以Go Template称呼，主要用法分3个部分介绍,深入请查看 [Go Docs](https://pkg.go.dev/text/template)

## 语法

Go Template由`变量`和`函数`组成的HTML文件，变量和函数都放到`{{ }}`里
