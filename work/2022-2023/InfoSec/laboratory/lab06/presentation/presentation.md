---
# Front matter
title: "Презентация о выполнении лабораторной работы №6"
subtitle: "Мандатное разграничение прав в Linux"
author: "Евсеева Дарья Олеговна"
group: "НФИбд-01-19"
institute: "Российский Университет Дружбы Народов, Москва, Россия"
teacher: "Дмитрий Сергеевич Кулябов"
date: "15 октября, 2022"

# Formatting
lang: ru-RU
toc: false
slide_level: 2
theme: metropolis
header-includes:
 - \metroset{sectionpage=none,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
aspectratio: 43
section-titles: true
---

# Цель работы

Целью работы является развитие навыков администрирования ОС Linux, ознакомление с технологией SELinux, а также проверка работы SELinux на практике совместно с веб-сервером Apache.

# Задачи выполнения

Необходимо провести работу с SELinux и веб-сервером Apache.

# Результаты выполнения

В ходе работы были выполнены поставленные задачи:

- Проведена работа с SELinux и веб-сервером Apache

![Проверка работы веб-сервера](../screenshots/2.png){ #fig:001 width=70% }

## Результаты выполнения

![Просмотр содержимого директории /var/www](../screenshots/6.png){ #fig:002 width=70% }

![Просмотр содержимого директории /var/www/html](../screenshots/7.png){ #fig:003 width=70% }

## Результаты выполнения

![Определение контекста файла](../screenshots/10.png){ #fig:004 width=70% }

![Обращение к файлу через веб-сервер](../screenshots/11.png){ #fig:005 width=70% }

## Результаты выполнения

![Изменение контекста](../screenshots/14.png){ #fig:006 width=70% }

![Попытка получения доступа к файлу](../screenshots/15.png){ #fig:007 width=70% }

## Результаты выполнения

![Открытие файла /etc/httpd/conf/httpd.conf](../screenshots/21.png){ #fig:008 width=70% }

![Внесение изменений в файл](../screenshots/22.png){ #fig:009 width=70% }

## Результаты выполнения

![Выполнение привязки и просмотр списка портов](../screenshots/28.png){ #fig:010 width=70% }

![Возвращение изначального контекста](../screenshots/30.png){ #fig:011 width=70% }

## Результаты выполнения

![Получение доступа к файлу через веб-сервер](../screenshots/31.png){ #fig:012 width=70% }

# Выводы

В результате проделанной работы мы развили навыки администрирования ОС Linux, ознакомились с технологией SELinux, а также проверили работу SELinux на практике совместно с веб-сервером Apache.
