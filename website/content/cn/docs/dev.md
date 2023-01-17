---
title: 开发
description: 开发极速文档的一些过程和笔记，以及当时对hugo的理解
date: 2023-01-15T11:50:44+08:00
weight: 100
---

在hugo中，页面由对应的模板渲染，默认的模板文件是html,位于 themes/`<theme-name>`/layouts/_default目录下，
主要由 baseof.html, list.html, single.html组成

theme位置也可以通过启动命令参数 `--themesDir`指定，查看根目录`package.json`文件

hugo页面类型

默认的页面模板存放在 _default 目录下

- homepage 首页  layouts/index.html
- list 列表页 对应 layouts/_default/list.html
- single 详情页 layouts/_default/single.html
- 404 layout/404.html

```bash
├── _default
│   ├── baseof.html
│   ├── list.html
│   └── single.html
└── index.html
```

## 文档中心首页

新建 docs/_index.md,默认一级目录为 section.html 作为文档栏目页

## 侧边栏菜单配置

新建 partials/docs/sidebar.html 用于显示侧边

1. 通过 Site.Menus 变量读取
2. 读取数据通过md文件配置
3. 菜单排列顺序由 weight 字段控制，越大显示在靠后

文档 <https://gohugo.io/variables/menus/>

```html
<div class="docs-sidebar pt-6 pt-lg-7">
  {{ $currentPage := . }}
  {{ range .Site.Menus.docs }}
    {{ if .HasChildren }}
      <h6 class="mt-4">{{.Name}}</h6>
      <ul class="nav flex-column">
        {{ range .Children }}
        <li class="nav-item">
          <a class="nav-link {{ if $currentPage.IsMenuCurrent "docs" . }}active{{ end }}" href="{{ .URL }}">{{ .Name }}</a>
        </li>
        {{ end }}
      </ul>
    {{ else }}
      <h6 class="mt-4">{{.Name}}</h6>
    {{ end }}
  {{ end }}
</div>
```

- menu 表示配置菜单
  - docs 表示所属菜单名称 docs
    - parent 上级key名称
    - weight 排序

```md
---
menu: 
  docs:
    parent: 'Components'
    weight: 1
---
```

## 详情页 single.html

模板使用 lyaouts/docs/single.html

- .Title 标题
- .Content md文件内容
- .TableOfContents toc

查看Page变量 <https://gohugo.io/variables/page/> 了解更多变量名称

## vue代码片段

计划使用 hugo shortcode完成

```vue
<template>
  <div>{{msg}}</div>
</template>

<script>
export default {
  data() {
    return {
      msg: 'Hello World, render by vuejs'
    }
  }
}
</script>
```
