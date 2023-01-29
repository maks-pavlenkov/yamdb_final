# YaMDb API
### Описание
YaMDb — всемирно известный сервис, который собирает рецензии пользователей на произведения в самом широком смысле: книги, фильмы, песни, картины и даже резиновые уточки, как отдельный вид искусства. Пользователи ставят произведениям оценки от 1 до 10, формируя тем самым рейтинг, и могут комментировать рецензии друг друга.

### Технологии
Python 3.7
Django 2.2.16
Django Rest Framework 3.12.4

### Установка
- Клонировать репозиторий и перейти в него в командной строке
- Cоздать и активировать виртуальное окружение
- Установить зависимости из файла requirements.txt
```
pip install -r requirements.txt
```
- Выполнить миграции
- Запустить проект и наслаждаться результатом


# Ресурсы API YaMDb

**AUTH**: аутентификация.
**USERS**: пользователи.
**TITLES**: произведения, к которым пишут отзывы (только названия произведений, сами произведения в проекте не предусмотрены).
**CATEGORIES**: категории (типы) произведений ("Фильмы", "Книги", "Музыка").
**GENRES**: жанры произведений. Одно произведение может быть привязано к нескольким жанрам.
**REVIEWS**: отзывы на произведения. Отзыв привязан к определённому произведению.
**COMMENTS**: комментарии к отзывам. Комментарий привязан к определённому отзыву.

# Алгоритм регистрации пользователей
1. Пользователь (или администратор, регистрирующий пользователя) отправляет POST-запрос с параметрами email и username на `/api/v1/auth/signup/`.
2. YaMDB отправляет письмо с кодом подтверждения (confirmation_code) на указанный email.
3. Пользователь отправляет POST-запрос с параметрами email и confirmation_code на `/api/v1/auth/token/`, и получает JWT-токен в ответ на этот запрос.

Эти операции выполняются один раз, при регистрации пользователя. В дальнейшем пользователь может работать с API, отправляя этот токен с каждым запросом.


# Пользовательские роли

**Аноним** — может просматривать описания произведений, читать отзывы и комментарии.



**Аутентифицированный пользователь (user)** — может читать всё, как и Аноним, дополнительно может публиковать отзывы и ставить рейтинг произведениям (фильмам/книгам/песенкам), может комментировать чужие отзывы и ставить им оценки; может редактировать и удалять свои отзывы и комментарии.



**Модератор** — те же права, что и у Аутентифицированного пользователя плюс право удалять и редактировать любые отзывы и комментарии.



**Администратор и Superuser** — полные права на управление проектом и всем его содержимым. Может создавать и удалять произведения, категории и жанры. Может назначать роли пользователям.
### Примеры API-запросов
Получить все имеющиеся произведения (GET-запрос) или создать новое (POST-запрос):
 ```
api/v1/titles/

{
  "name": "Анна Каренина",
  "year": 1877,
  "description": "Роман Льва Николеваича Толстого",
  "genre": [
    "Роман"
  ],
  "category": "Книга"
}
```
Получить все имеющиеся категории (GET-запрос) или добавить новую (POST-запрос):
```
api/v1/categories/

{
  "name": "Картина",
  "slug": "painting"
}
```
 Добавить новую рецензию на произведение (POST-запрос):
```
api/v1/titles/{title_id}/reviews/

{
    "text": "it was a good movie",
    "score": 5
}
```
Получить все отзывы на рецензию определенного произведения (GET-запрос):
```
api/v1/titles/{title_id}/reviews/{review_id}/comments/

{
    "text": "hello"
}
```
![yamdb_workflow.yml](https://github.com/maks-pavlenkov/yamdb_final/blob/master/.github/workflows/yamdb_workflow.yml/badge.svg?)