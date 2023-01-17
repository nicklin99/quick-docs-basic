---
title: 模板语法(上)
description: 常用模板语法 string, 条件判断
date: 2023-01-16T00:36:49+08:00
weight: 10
---

通过将模板应用于数据结构来执行模板。模板语法引用数据结构的元素（通常是结构的字段或映射中的键），以控制执行并派生要显示的值。模板的执行遍历结构并设置光标，用`.`点表示当前结构位置中的值

## 注释

```go
{{/* 注释 */}}
```

## 变量

显示输出、打印都一个意思

```go
{{ .Title }}
{{ print .Title }}
```

这里的`.`表示`Page`变量

## 条件判断 if

```go
{{ if condition }} T1 {{ end }}

{{ if condition }} T1 {{ else }} T0 {{ end }}

{{ if condition }} T1 {{ else if condition }} T0 {{ end }}
```

## 循环迭代

```go
{{range Variable}} T1 {{end}}

{{range Variable}} T1 {{else}} T0 {{end}}

{{break}}

{{continue}}

```

## 模板

`name`命名的模板渲染，数据nil

```go
{{template "name"}}
```

`name`命名的模板渲染，数据 data

```go
{{template "name" data}}
```

## block（块）

```go
{{block "name" data}} T1 {{end}}
```

定义的块为占位符，使用时使用 {{define "name"}} T1 {{end}}，覆盖block内T1

## with

data空不会执行，with 会切换数据的的作用域，`.` 的值会被设置为 data

```go
{{with data}} T1 {{end}}

{{with data}} T1 {{else}} T0 {{end}}
```
