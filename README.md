### Спроси меня!

Учебная, упрощенная копия приложения [askme.fm](http://askme.fm/)

Предназначено для освоения работы с Ruby on Rails с аутентификацией, авторизацией, фреймворком bootstrap.

В качестве защиты от спама использована [reCaptcha](https://www.google.com/recaptcha/intro/v3beta.html) от Google

### Установка

Перед запуском приложения необходимо выполнить установку всех необходимых гемов и прогнать миграции базы данных. Для этого в консоли необходимо выполнить команды:

    bundle install
    rake db:migrate

Также необходимо настроить переменные окружения для корректной работы reCaptcha:

    RECAPTCHA_SITE_KEY
    RECAPTCHA_SECRET_KEY
    
 Рабочий проект расположен на хероку по адресу: [Askinganswer](https://askinganswer.herokuapp.com/)
### Автор
 [Бауржан Кожаев](https://www.linkedin.com/in/baur-kozhaev-80a277162/)
