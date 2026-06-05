// ==================== 变量定义 ====================
#let report-title = "这是实验报告标题"
#let logo-path = "tyut.png"
#let course-name = "这是课程名称"
#let experiment-name = "这是实验、实践名称"
#let experiment-location = "这是实验、实践地点"
#let class-name = "这是班级"
#let student-id = "这是学号"
#let student-name = "这是姓名"
#let teacher-name = "这是指导老师"
#let report-year = "2025"
#let report-month = "2"
#let report-day = "32"

// ==================== 文档基本设置 ====================
#set document(title: report-title)

#set page(
  paper: "a4",
  header: align(right)[
    #report-title
  ],
  numbering: "(1/1)",
)

// 正文中文/英文字体与字号
// 配置可能字体进行兜底
#set text(
	font: (
    "Times New Roman",
    "SimSun", "Songti SC", "STSong",
    "Noto Serif SC", "song", "serif",
    "Source Han Serif SC"
  ),
	size: 12pt,
	lang: "zh",
)

// 代码块字体
#show raw: set text(font: ("JetBrains Mono", "Source Han Serif SC"), size: 10.5pt)

// 段落首行缩进
#set par(first-line-indent: 2em)

// 强制标题、代码块等之后的段落也缩进
#show heading: it => {
  it
  par()[#box()]
}

// ==================== 标题编号格式 ====================
#set heading(numbering: (..nums) => {
  let level = nums.pos().len()
  if level == 1 {
    numbering("一、", ..nums)
  } else if level == 2 {
    numbering("1.", nums.pos().last())
  } else if level == 3 {
    numbering("(1)", nums.pos().last())
  }
})

// 一级标题样式
#show heading.where(level: 1): it => {
  set text(size: 14pt, weight: "bold")
  v(1.5em, weak: true)
  align(center, it)
  v(1em, weak: true)
}

// 二级标题样式
#show heading.where(level: 2): it => {
  set text(size: 12pt, weight: "bold")
  v(1em, weak: true)
  it
  v(0.5em, weak: true)
}

// 三级标题样式
#show heading.where(level: 3): it => {
  set text(size: 12pt, weight: "bold")
  v(0.8em, weak: true)
  it
  v(0.8em, weak: true)
}

// ==================== 封面页 ====================
#set page(header: none, numbering: none)

// 校徽图片
#align(center)[
  #image(logo-path, width: 80%)
]

#v(3em)

// 报告类型选择框
#align(center)[
  #text(size: 20pt)[
    实验报告 #box(width: 1em, height: 1em, stroke: 0.5pt + black)[
      #align(center + horizon)[#text(size: 16pt)[✓]]
    ] #h(2em)
    实践报告 #box(width: 1em, height: 1em, stroke: 0.5pt + black)
  ]
]

#v(3em)

// 信息表格
//    Notes: 此 #set text(size: 15pt) 必须在 #pad[...] 块作用域内。
//    若移到块外，15pt 会跨过 #pagebreak() 污染正文
#pad(left: 3em, right: 3em)[
  #set text(size: 15pt)
  #table(
    columns: (auto, 1fr),
    stroke: none,
    row-gutter: 2em,
    align: (left, center),
    
    [课程名称：], [#underline[#course-name]],
    [实验、实践名称：], [#underline[#experiment-name]],
    [实验、实践地点：], [#underline[#experiment-location]],
  )
  
  #v(1em)
  
  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    stroke: none,
    row-gutter: 2em,
    align: (left, center, center, center),
    
    [专业班级：], [#underline[#class-name]], [学号：], [#underline[#student-id]]
  )

  #v(1em)

  #table(
    columns: (6em, 1fr),
    stroke: none,
    row-gutter: 2em,
    align: (left, center),
    [学生姓名：], [#underline[#student-name]],
    [指导教师：], [#underline[#teacher-name]]
  )
]
#v(5em)

// 日期
#align(center)[
  #text(size: 15pt)[
    #report-year 年#h(1em)#report-month 月#h(1em)#report-day 日
  ]
]

// 封面页结束，开始新页
#pagebreak()

// ==================== 恢复正文页面设置 ====================
#set page(
  header: align(right)[
    #report-title
  ],
  numbering: "(1/1)",
)

// ==================== 标题信息 ====================
#align(center)[
  #text(size: 22pt, weight: "bold")[#report-title]
  #v(1em)
	#text(size: 14pt, font: ("Times New Roman", "KaiTi", "STKaiti"))[
    #class-name #student-name #student-id
  ]
]

#v(2em)

// ==================== 正文内容 ====================

= 章节标题

== 子章节标题

道可道，非常道。名可名，非常名。无名，天地之始；有名，万物之母。故常无欲，以观其妙；常有欲，以观其徼。此两者同出而异名，同谓之玄。玄之又玄，众妙之门。

== 子章节标题

道可道，非常道。名可名，非常名。无名，天地之始；有名，万物之母。故常无欲，以观其妙；常有欲，以观其徼。此两者同出而异名，同谓之玄。玄之又玄，众妙之门。

- *列表项一*：道可道，非常道。名可名，非常名。
- *列表项二*：无名，天地之始；有名，万物之母。
- *列表项三*：故常无欲，以观其妙；常有欲，以观其徼。
- *列表项四*：此两者同出而异名，同谓之玄。玄之又玄，众妙之门。

= 章节标题

1. 道可道，非常道。名可名，非常名。
2. 无名，天地之始；有名，万物之母。
3. 故常无欲，以观其妙；常有欲，以观其徼。
4. 此两者同出而异名，同谓之玄。玄之又玄，众妙之门。

= 章节标题

== 子章节标题

道可道，非常道。名可名，非常名。无名，天地之始；有名，万物之母。故常无欲，以观其妙；常有欲，以观其徼。此两者同出而异名，同谓之玄。玄之又玄，众妙之门。

== 子章节标题

道可道，非常道。名可名，非常名。无名，天地之始；有名，万物之母。

```
The quick brown fox jumps over the lazy dog
```

== 子章节标题

道可道，非常道。名可名，非常名。无名，天地之始；有名，万物之母。故常无欲，以观其妙；常有欲，以观其徼。

= 章节标题

== 子章节标题

道可道，非常道。名可名，非常名。无名，天地之始；有名，万物之母。

- 列表项一：道可道，非常道。
- 列表项二：名可名，非常名。
- 列表项三：无名，天地之始。

== 子章节标题

道可道，非常道。名可名，非常名。无名，天地之始；有名，万物之母。故常无欲，以观其妙；常有欲，以观其徼。


= 章节标题

1. 道可道，非常道。名可名，非常名。
2. 无名，天地之始；有名，万物之母。
3. 故常无欲，以观其妙；常有欲，以观其徼。
4. 此两者同出而异名，同谓之玄。玄之又玄，众妙之门。

= 章节标题

道可道，非常道。名可名，非常名。无名，天地之始；有名，万物之母。故常无欲，以观其妙；常有欲，以观其徼。此两者同出而异名，同谓之玄。玄之又玄，众妙之门。
