---
# Front matter
title: "Отчет по лабораторной работе №4"
subtitle: "Дискреционное разграничение прав в Linux. Расширенные атрибуты"
author: "Евсеева Дарья Олеговна"
group: "НФИбд-01-19"
institute: "Российский Университет Дружбы Народов, Москва, Россия"
teacher: "Дмитрий Сергеевич Кулябов"
date: "30 сентября, 2022"

# Generic options
lang: ru-RU
toc-title: "Содержание"

# Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

# Pdf output format
toc: true # Table of contents
toc_depth: 2
lof: true # List of figures
lot: false # List of tables
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

# Цель работы

Целью данной работы является получение практических навыков работы в консоли с расширенными атрибутами файлов.

# Задание

Провести работу с двумя расширенными атрибутами от имени пользователя guest и администратора.

# Теоретическое введение

Дискреционное разграничение доступа --- подход к разграничению доступа, предполагающий назначение владельцев объектов, которые по собственному усмотрению определяют права доступа субъектов (других пользователей) к объектам (файлам), которыми владеют.

Дискреционные механизмы разграничения доступа используются для разграничения прав доступа процессов как обычных пользователей, так и для ограничения прав системных программ (например, служб операционной системы), которые работают от лица псевдопользовательских учетных записей.

# Выполнение лабораторной работы

Выполнять работу будем в операционной системе, установленной при выполнении первой лабораторной работы.

## 1. Работа с расширенным атрибутом `a`

Для начала войдем в систему от имени пользователя guest и определим расширенные атрибуты файла file1.

![Определение расширенных атрибутов](../screenshots/1.png){ #fig:001 width=70% }

Как мы можем видеть, изначально у файла нет никаких расширенных атрибутов.

Далее установим на файл права, разрешающие чтение и запись для владельца файла.

![Установка прав на чтение и запись](../screenshots/2.png){ #fig:002 width=70% }

Попробуем установить на файл расширенный атрибут `a` от имени пользователя guest.

![Попытка установки атрибута a](../screenshots/3.png){ #fig:003 width=70% }

Мы видим, что в выполнении операции было отказано.

Далее, открыв новую консоль, зайдем в систему с правами администратора и снова попробуем установить на файл расширенный атрибут `a`.

![Установка атрибута a](../screenshots/4.png){ #fig:004 width=70% }

Здесь мы видим, что отказа в выполнении не последовало.

Проверим правильность установки атрибута от имени пользователя guest.

![Проверка атрибутов](../screenshots/5.png){ #fig:005 width=70% }

Мы видим, что атрибут действительно был успешно установлен.

Выполним дозапись в файл слова 'test' и проверим успешность выполнения операции.

![Дозапись в файл и его чтение](../screenshots/6.png){ #fig:006 width=70% }

Как мы видим, слово было успешно записано в файл.

Далее попробуем перезаписать имеющуюся в файле информацию, а также попробуем переименовать файл.

![Попытка перезаписи и переименования файла](../screenshots/7.png){ #fig:007 width=70% }

Для обеих операций было отказано в доступе.

Также попробуем установить на файл права, запрещающие чтение и запись для владельца файла.

![Попытка изменения прав на файл](../screenshots/8.png){ #fig:008 width=70% }

В доступе снова было отказано.

Снимем с файла расширенный атрибут `a` от имени администратора.

![Снятие атрибута a](../screenshots/9.png){ #fig:009 width=70% }

Далее повторим операции, которые ранее не смогли выполнить.

![Повторное выполнение операций](../screenshots/10.png){ #fig:010 width=70% }

Как мы видим, теперь все операции были успешно выполнены.

## 2. Работа с расширенным атрибутом `i`

Теперь проделаем те же действия для расширенного атрибута `i`.

Попробуем добавить атрибут от имени пользователя guest.

![Попытка установки атрибута i](../screenshots/11.png){ #fig:011 width=70% }

Добавим атрибут от имени администратора и проверим его наличие от имени пользователя guest.

![Установка атрибута i](../screenshots/12.png){ #fig:012 width=70% }

![Проверка атрибутов](../screenshots/13.png){ #fig:013 width=70% }

Попробуем повторить выполнение различных команд.

![Попытка выполнения различных команд](../screenshots/14.png){ #fig:014 width=70% }

Как мы видим, в данном случае в доступе было отказано для всех операций, кроме чтения файла, и, в отличие от расширенного атрибута `a`, дозапись в файл осуществить уже не удалось.

Снимем с файла расширенный атрибут `i` и повторим операции, которые не удалось выполнить.

![Снятие атрибута i](../screenshots/15.png){ #fig:015 width=70% }

![Повторное выполнение операций](../screenshots/16.png){ #fig:016 width=70% }

Как мы видим, теперь все операции были успешно выполнены.

# Выводы

В результате проделанной работы мы приобрели практические навыки работы в консоли с расширенными атрибутами файлов.

# Список литературы{.unnumbered}

- Методические материалы к лабораторной работе, представленные на сайте "ТУИС РУДН" https://esystem.rudn.ru/

::: {#refs}
:::
