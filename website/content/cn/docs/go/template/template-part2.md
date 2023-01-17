---
title: 模板语法(中)
description: 常用模板语法 string, 条件判断
date: 2023-01-16T00:36:49+08:00
weight: 10
---

模板应用变量与函数，代码示例中变量和函数都来自于Hugo引入的数据结构

## 字符串

> 开始包含`/en/`

```go
{{if not (hasPrefix .URL "/en/") }}

{{ end }}
```

> 是否存在语言前缀，默认语言没有前缀

```go
{{ if not $currentPage.Site.LanguagePrefix }}
{{ end }}
```

> 菜单是否当前

- .IsMenuCurrent 上下文是 Page
- "docs" . 后面的点表示当前的 MenuEntry

```go
// 引用.Page变量
{{ $page = .}}
{{ if $page.IsMenuCurrent "docs" . }} active{{ end }}
```

## 内置函数

### 比较 `x` `y`

- eq 等于 {{if eq x y}}
- ne 不等于 {{if ne x y}}
- lt 小于 {{if lt x y}}
- le 小于等于 {{if le x y}}
- gt 大于 {{if gt x y}}
- ge 大于等于 {{if ge x y}}

### 逻辑判断

- and 和（一个假则假，真返回最后一个真值）
- or 或（一个真则真，真返回第一个真值）
- not 非

```go
{{and x y }}
{{or x y}}
{{not x}}
```

### 其他

- print 打印
- printf 格式输出
- println 换行输出
- len 字串/数组长度
- index 指向索引
- call 调用函数

```go
{{- print "liuBei"}}
{{- printf "%d" $i}}
{{- println $i}}
{{ $l := len "liuBei" }}
{{ $i := index 数组 索引 }}
```

## 布尔值

```go

not 
```

## 集合

range 支持 map、array、slice 3种集合类型

> key, value格式循环菜单

```go
{{ range $key, $value := .Site.Menus.main }}
  {{ $key }} - {{ $value }}
{{ end }}
```

> 空执行else

```go
{{ range .Site.Menus.main }}
  {{ .Name }}
{{ else }}
// 数组空
{{ end }}
```
