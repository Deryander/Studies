---
# Front matter
title: "Презентация о выполнении лабораторной работы №4"
subtitle: "Построение моделей гармонических колебаний"
author: "Евсеева Дарья Олеговна"
group: "НФИбд-01-19"
institute: "Российский Университет Дружбы Народов, Москва, Россия"
teacher: "Дмитрий Сергеевич Кулябов"
date: "4 марта, 2022"

# Generic options
lang: ru-RU
toc-title: "Содержание"

# Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

# Pdf output format
toc: true # Table of contents
toc_depth: 2
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
### Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Misc options
indent: true
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Прагматика выполнения

Задачи математического моделирования являются широко распространенными, и навыки их решения могут быть очень полезны в нашей будущей профессии. Также, среда OpenModelica является одним из самых подходящих по функциональным возможностям средств для решения подобных задач, и опыт работы в ней также будет полезен.

# Цель работы

Целью данной работы является построение моделей гармонических колебаний в среде OpenModelica.

# Задачи выполнения

Вариант №21.

В ходе лабораторной работы было необходимо построить фазовый портрет гармонического осциллятора и решение уравнения гармонического осциллятора для трех случаев:

1. Колебания гармонического осциллятора без затуханий и без действий внешней силы
$$\ddot{x} + 0.6x = 0$$
2. Колебания гармонического осциллятора c затуханием и без действий внешней силы
$$\ddot{x} + 0.4\dot{x} + 0.4x = 0$$
3. Колебания гармонического осциллятора c затуханием и под действием внешней силы
$$\ddot{x} + 0.2\dot{x} + 10x = 0.5cos(2t)$$

На интервале $t \in[0;51]$ (шаг 0.05) с начальными условиями $x_0 = 0.4, y_0 = 2.1$.

# Результаты выполнения

В ходе работы мы выполнили все поставленные задачи, а именно получили фазовые портреты гармонического осциллятора и решения уравнения гармонического осциллятора для трех случаев:

1. Колебания гармонического осциллятора без затуханий и без действий внешней силы

![График с отображением x и y в первом случае](../screenshots/3.png){ #fig:001 width=70% }

![Фазовый портрет для первого случая](../screenshots/4.png){ #fig:002 width=70% }

2. Колебания гармонического осциллятора c затуханием и без действий внешней силы

![График с отображением x и y во втором случае](../screenshots/6.png){ #fig:003 width=70% }

![Фазовый портрет для второго случая](../screenshots/7.png){ #fig:004 width=70% }

3. Колебания гармонического осциллятора c затуханием и под действием внешней силы

![График с отображением x и y в третьем случае](../screenshots/9.png){ #fig:005 width=70% }

![Фазовый портрет для третьего случая](../screenshots/10.png){ #fig:006 width=70% }

# Выводы

В результате проделанной работы мы научились строить модели гармонических колебаний в среде OpenModelica.
