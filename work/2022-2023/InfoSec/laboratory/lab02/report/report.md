---
# Front matter
title: "Отчет по лабораторной работе №2"
subtitle: "Дискреционные разграничения прав в Linux. Основные атрибуты"
author: "Евсеева Дарья Олеговна"
group: "НФИбд-01-19"
institute: "Российский Университет Дружбы Народов, Москва, Россия"
teacher: "Дмитрий Сергеевич Кулябов"
date: "17 сентября, 2022"

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

Целью данной работы является получение практических навыков работы в консоли с атрибутами файлов, закрепление теоретических основ дискреционного разграничения доступа в современных системах с открытым кодом на базе ОС Linux.

# Задание

1. Создать гостевого пользователя.
2. Провести работу с директориями от имени гостевого пользователя.
3. Заполнить таблицы прав доступа.

# Теоретическое введение

Дискреционное разграничение доступа --- подход к разграничению доступа, предполагающий назначение владельцев объектов, которые по собственному усмотрению определяют права доступа субъектов (других пользователей) к объектам (файлам), которыми владеют.

Дискреционные механизмы разграничения доступа используются для разграничения прав доступа процессов как обычных пользователей, так и для ограничения прав системных программ (например, служб операционной системы), которые работают от лица псевдопользовательских учетных записей.

# Выполнение лабораторной работы

Выполнять работу будем в операционной системе, установленной при выполнении предыдущей лабораторной работы.

## 1. Создание пользователя

Для начала, используя учетную запись администратора, создадим пользователя guest с помощью команды `useradd`.

![Создание пользователя guest](../screenshots/1.png){ #fig:001 width=70% }

Дале установим пароль для созданного пользователя.

![Установка пароля для пользователя guest](../screenshots/2.png){ #fig:002 width=70% }

Войдем в систему от имени созданного пользователя guest.

![Вход в систему через пользователя guest](../screenshots/3.png){ #fig:003 width=70% }

Выполним команду `pwd`, чтобы определить текущую директорию.

![Определение текущей директории](../screenshots/4.png){ #fig:004 width=70% }

Мы видим, что директория является домашней директорией для пользователя guest и совпадает с приглашением командной строки.

Выполним команду `whoami` для уточнения имени пользователя.

![Уточнение имени пользователя](../screenshots/5.png){ #fig:005 width=70% }

Далее выполним команду `id` для просмотра информации о пользователе. Также проверим вывод команды `groups`.

![Просмотр информации о пользователе](../screenshots/6.png){ #fig:006 width=70% }

Здесь мы видим, что имя пользователя --- guest, значение uid равняется 1001(guest), значение gid равняется 1001(guest), также пользователь входит в единственную группу --- 1001(guest). Выводы обеих команд соотносятся друг с другом.

Полученные данные также соответствуют данным в приглашении командной строки.

Посмотрим содержимое файла `/etc/passwd`.

![Просмотр файла /etc/passwd (1)](../screenshots/7.png){ #fig:007 width=70% }

![Просмотр файла /etc/passwd (2)](../screenshots/8.png){ #fig:008 width=70% }

Мы видим, что в последней строке вывода содержится информация о текущем пользователе guest. Значение uid равняется 1001 и значение gid равняется 1001, что совпадает с данными , полученными ранее.

## 2. Работа с директориями

Определим существующие в системе директории.

![Просмотр директорий в системе](../screenshots/9.png){ #fig:009 width=70% }

Нам удалось получить список поддиректорий директории `/home`, и мы видим, что в системе есть домашние директории пользователей doevseeva и guest. У обеих директорий установлены права на чтение, запись и исполнение для пользователя.

Проверим, какие расширенные атрибуты установлены на поддиректориях, находящихся в директории `/home`.

![Просмотр расширенных атрибутов](../screenshots/10.png){ #fig:010 width=70% }

Нам удалось получить только данные о домашней директории текущего пользователя guest, и можно видеть, что установленных расширенных атрибутов нет. Данные о домашней директории пользователя doevseeva не были получены.

Создадим в домашней директории поддиректорию dir1.

![Создание поддиректории dir1](../screenshots/11.png){ #fig:011 width=70% }

Далее определим, какие права доступа и расширенные атрибуты были выставлены на созданную директорию.

![Проверка прав доступа и расширенных атрибутов dir1](../screenshots/12.png){ #fig:012 width=70% }

Снимем с созданной директории все атрибуты.

![Снятие атрибутов с директории](../screenshots/13.png){ #fig:013 width=70% }

Далее попытаемся создать внутри директории файл.

![Проверка возможности создания файла](../screenshots/14.png){ #fig:014 width=70% }

Как мы видим, в доступе было отказано, так как мы сняли все атрибуты с директории, также из-за этого мы не можем увидеть, действительно ли не создался файл.

Добавим к директории право на чтение и проверим список файлов в ней.

![Проверка наличия файла в директории](../screenshots/15.png){ #fig:015 width=70% }

Мы видим, что директория действительно пуста.

## 3. Заполнение таблиц прав доступа.

Заполним таблицу "Установленные права и разрешенные действия", выполняя действия от имени владельца директории (файлов), определив опытным путем, какие операции разрешены, а какие нет.

Для начала вернем директории все права доступа для пользователя и создадим в ней файл для дальнейшей проверки действий. Затем приступим к заполнению таблицы.

![Создание файла и проверка прав и действий](../screenshots/16.png){ #fig:016 width=70% }

![Проверка прав и действий (1)](../screenshots/17.png){ #fig:017 width=70% }

![Проверка прав и действий (2)](../screenshots/18.png){ #fig:018 width=70% }

![Проверка прав и действий (3)](../screenshots/19.png){ #fig:019 width=70% }

![Проверка прав и действий (4)](../screenshots/20.png){ #fig:020 width=70% }

Итак, закончим заполнение таблицы "Установленные права и действия".

![Установленные права и действия (1)](../screenshots/21.png){ #fig:021 width=70% }

![Установленные права и действия (2)](../screenshots/22.png){ #fig:022 width=70% }

![Установленные права и действия (3)](../screenshots/23.png){ #fig:023 width=70% }

![Установленные права и действия (4)](../screenshots/24.png){ #fig:024 width=70% }

Теперь, на основании заполненной таблицы определим те или иные минимально необходимые права для выполнения операций внутри директории и заполним таблицу "Минимальные права для совершения операций".

![Минимальные права для совершения операций](../screenshots/25.png){ #fig:025 width=70% }

# Выводы

В результате проделанной работы мы приобрели практические навыки работы в консоли с атрибутами файлов и закрепили теоретические основы дискреционного разграничения доступа в современных системах с открытым кодом на базе ОС Linux.

# Список литературы{.unnumbered}

- Методические материалы к лабораторной работе, представленные на сайте "ТУИС РУДН" https://esystem.rudn.ru/

::: {#refs}
:::
