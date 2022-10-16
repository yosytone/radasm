import requests
import os
import json
from datetime import datetime

test_path = os.getcwd()
os.mkdir("tasks")# Создание директории tasks'
check_file = print(os.path.exists(test_path + '/tasks'))
todos = requests.get('https://json.medrocket.ru/todos')  # Получение списков юзеров
users = requests.get('https://json.medrocket.ru/users')

with open('todos.txt', 'wb') as f:  # Запись содержимого в txt файл
    f.write(todos.content)

with open('users.txt', 'wb') as f:
    f.write(users.content)

with open("todos.txt") as file:
    dict_todos = file.read()

with open("users.txt") as file:
    dict_users = file.read()

data_todos = json.loads(dict_todos)
data_users = json.loads(dict_users)
now = datetime.now()


def Count_task(key):
    sum = 0
    for i in range(0, len(data_todos)):
        if data_todos[i].get('userId') == key:
            sum = sum + 1
    return sum


def Count_resolved_task(key_1):
    sum = 0
    sum2 = 0
    l = str()
    l1 = str()

    def Cut(line):
        if len(line) > 46:
            line = line[0:47] + '...'
        return line

    for i in range(0, len(data_todos)):
        if data_todos[i].get('userId') == key_1:
            if data_todos[i].get('completed') == True:
                sum = sum + 1
                l1 = l1 + '-' + Cut(data_todos[i].get('title')) + '\n'
            else:
                sum2 = sum2 + 1
                l = l + '-' + Cut(data_todos[i].get('title')) + '\n'
    return sum, sum2, l, l1


for i in range(0, len(data_users)):
    j = i + 1
    name_txt = data_users[i].get('name')
    if os.path.exists(str(test_path) + '/tasks/' + str(name_txt) ) == True:
        name_txt = 'old_'+data_users[i].get('name')+'_'+str(now.strftime(
            "%Y-%m-%dT%H%M"))
        print(name_txt)
        with open(str(test_path) + '/tasks/' + str(name_txt), 'w', encoding='utf-8') as f:
            f.write('# Отчёт для' + ' ' + data_users[i].get('company')['name'] + '.' + '\n')
            f.write(data_users[i].get('name') + ' <' + data_users[i].get('email') + '> ' + now.strftime(
                "%d-%m-%Y %H:%M") + '\n')
            f.write('Всего задач: ' + str(Count_task(j)) + '\n' + '\n')
            f.write('## Актуальные задачи (' + str(Count_resolved_task(j)[0]) + ')' + '\n')
            f.write((Count_resolved_task(j)[2] + '\n'))
            f.write('## Завершённые задачи (' + str(Count_resolved_task(j)[1]) + ')' + '\n')
            f.write((Count_resolved_task(j)[3]))
    else:
        with open(str(test_path) + '/tasks/' + str(name_txt), 'w', encoding='utf-8') as f:
            f.write('# Отчёт для' + ' ' + data_users[i].get('company')['name'] + '.' + '\n')
            f.write(data_users[i].get('name') + ' <' + data_users[i].get('email') + '> ' + now.strftime(
                "%d-%m-%Y %H:%M") + '\n')
            f.write('Всего задач: ' + str(Count_task(j)) + '\n' + '\n')
            f.write('## Актуальные задачи (' + str(Count_resolved_task(j)[0]) + ')' + '\n')
            f.write((Count_resolved_task(j)[2] + '\n'))
            f.write('## Завершённые задачи (' + str(Count_resolved_task(j)[1]) + ')' + '\n')
            f.write((Count_resolved_task(j)[3]))
