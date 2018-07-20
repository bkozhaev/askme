### Спроси меня!

Учебная, упрощенная копия приложения [askme.fm](http://askme.fm/)

Предназначено для освоения работы с Ruby on Rails с аутентификацией, авторизацией, фреймворком bootstrap.

В качестве защиты от спама использована [reCaptcha](https://www.google.com/recaptcha/intro/v3beta.html) от Google

### Установка

    bundle install
    rake db:migrate

Для корректной работы reCaptcha необходимо настроить следующие переменные окружения:

    RECAPTCHA_SITE_KEY
    RECAPTCHA_SECRET_KEY
#### [Демонстрационная версия приложения](https://askinganswer.herokuapp.com/)
#### Автор 
[Бауржан Кожаев](https://www.linkedin.com/in/baur-kozhaev-80a277162/)
* Приложение разработано в учебных целях, и может быть взято за основу серьезного проекта
