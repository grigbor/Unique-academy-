#!/bin/bash

# Переключаемся на ветку main и обновляем её
git checkout main
git pull origin main

# Сливаем все ветки в main
for branch in $(git branch --list | grep -v "main"); do
    git checkout $branch
    git pull origin $branch
    git checkout main
    git merge $branch
done

# Отправляем обновленную ветку main на удалённый репозиторий
git push origin main