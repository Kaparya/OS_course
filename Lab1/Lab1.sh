#!/bin/bash


# Сценарий получает на стандартный ввод префикс логина пользователя. В качестве первого параметра сценарий получает количество создаваемых пользователей. Результатом работы сценария должен быть текстовый файл users.csv, каждая строчка которого должна иметь формат <префикс логина>_<порядковый номер пользователя>,<префикс логина>_<пароль>_<порядковый номер пользователя>. Для автоматического формирования пароля необходимо задействовать утилиту pwgen. Порядковый номер пользователя должен начинаться с нуля.


number_of_users="$1"
read prefix


if test -f "/home/kaparya/Desktop/OS/Lab1/users.csv"; then
	rm "/home/kaparya/Desktop/OS/Lab1/users.csv"
fi
touch "/home/kaparya/Desktop/OS/Lab1/users.csv"


for ((i = 0; i < $number_of_users; ++i))
do
	curpassword=$(pwgen 10 1)
	
	echo $prefix"_"$i","$prefix"_"$curpassword"_"$i >> "/home/kaparya/Desktop/OS/Lab1/users.csv"
done
