
![GitHub last commit](https://img.shields.io/github/last-commit/trash-max/classic_snake_4)

# "Змейка" для Android
Реализация варианта классической игры "Змейка" для Android, на игровом движке [Godot](https://github.com/godotengine/godot)



Девлог о создании:
[Playlist YouTube](https://youtube.com/playlist?list=PLJn3nbk2RjwTy6ARA4ZfKOphTGhD8gwHb)






### Список серий


#### 00 Часть. Обзорная.
Минимальный функционал игры готов, змейка движется, собирает генерированную еду, отращивает хвост и сталкивается со стенами.
Но самое главное, игра уже компилируется в AAB (Android App Bundle) и опубликована в Google Play Market
 
[Смотреть на YouTube](https://youtu.be/_y_LxHTPBRQ)



#### 01 Часть. Змейка для Android.
 - Создание нового проекта Godot
 - Основа игровой сцены
 - Основа (голова) нашей змеи
 - Установка основных таймеров и сегментов
 - Первое движение нашей змеи
 
[Смотреть на YouTube](https://youtu.be/De6qGwkY7Eo)



#### 02 Часть. Змейка для Android.
 - Закладываем основы движения змеи
 - Метод Relative для обработки выбора направления движения


#### 03 Часть. Змейка для Android.
Скрипт в шестьдесят срок :) Все серьезно!
Создаем функцию, которая генерирует блоки стены и расставляет их по границам игрового поля.


#### 04 Часть. Змейка для Android.
Учим змейку сталкиваться со стенами.
Добавляем в каждый элемент стены поле для регистрации столкновения, настраиваем слои, передаем согнал о столкновении в управляющий процессом скрипт.


#### 05 Часть. Змейка для Android. Еда.
Вероятно это яблоки, по крайнем мере мне всегда так думалось :)
Создадим еду для нашей змеи и основы функции для размещения ее на игровом поле случайным образом.


#### 06 Часть. Сигналы.
Новый способ регистрации сигналов Godot 4 (Alfa, правда). Способы из 3 ветки точно не работают.
В общем, генерируем сигналы нашему управляющему скрипту о том, что змея врезалась в препятствие или подобрала яблоко. (Это же яблоко?)


#### 07 Часть. Call Deffered.
Работа над ошибками из предыдущей серии. Использование метода call_deffered() для корректного помещения еды (яблок?) на игровое поле.


#### 08 Часть. Хвост.
Делаем хвост для нашей змеи. Учим змею отращивать его при съедании яблок, и регистрировать столкновения с ним. Хвост, же, просто движется за змеей.


#### 09 Часть. GUI.
Делаем графическое меню для нашей игры.
Стартовый экран, три основные кнопки:
- Старт
- Настройки
- Выход

Ну и несколько полей для отображения игровой информации.
Добавляем в основой теме шрифт на другой.


#### 10 Часть. GUI Функционал
Добавляем функционала в графическое меню.  Пишем функции запуска игры и выхода при нажатии соответствующих кнопок.

Eng:
Adding functionality to the graphical menu. We write the functions of starting the game and exiting when the corresponding buttons are pressed.

[Смотреть на YouTube](https://youtu.be/sFXFtuPjUfc)


#### 11 Часть. Установка Android Studio и Java
Установка в Ubuntu необходимых компонентов для сборки игры на движке Godot 4 в apk и aab:

- Android Studio 
- Android SDK
- Android SDK CLI
- CMake
- NDK
- JAVA 11 (jre и jdk)
- Godot Export templates (Шаблоны экспорта)

Eng: 
Installing the required components in Ubuntu to build a game on the Godot 4 engine in APK or AAB

[Смотреть на YouTube](https://youtu.be/v9bVNiKF63U)


#### 12 Часть. Экспорт игры в APK
Экспортирование игры в APK файл.
- Создание пары отлажочных ключей в java keystore
- Экспорт в режиме отладки подписанной версии игры в APK файл
- Запуск приложения в эмуляторе Android Studio
- Запуск приложения на реальном телефоне. (Nokia, вроде бы...)

Eng:
Export game to APK from Godot 4

[Смотреть на YouTube](https://youtu.be/pnonAjVaV94)


#### 13 Часть. Экспорт приложения в AAB
Экспорт в Android App Bundle (AAB)
- Генерация пары ключей для подписи AAB файла для загрузки в Play Market
- Краткие настройки экспорта игры из Godot 4 (alfa 6)
- Обзор графических инструментов для работы с Java Keytool в Windows и Linux

[Создание ключей для подписи Anroid приложений в Godot](https://trash-max.github.io/howto/keystore/)

Eng:
Export to Android App Bundle (AAB)
- Generation of a key pair for signing an AAB file for uploading to the Play Market
- Brief settings for exporting the game from Godot 4
- Overview of graphical tools for working with Java Keytool on Windows and Linux

[Смотреть на YouTube](https://youtu.be/id9Qrt_izYg)


#### 14 Часть. Git и GitHub.
Делаем новый Git для нашего проекта и заливаем его на GitHub.
(Ну и все такое, инициализация там, ветки всякие, опенсорс, коммиты, пушы и т.д.)

Eng:
Initialize a new Git for the project and upload it to GitHub.
(And all that, initialization there, different branches, open source, commits, push, etc.)

[Смотреть на YouTube](https://youtu.be/uavbHZyAGcI)


#### 15 Часть. Заливаем в Play Market
Загружаем первый выпуск игры в Play Market для внутреннего тестирования.

Eng:
Uploading the first release of the game to the Play Market for internal testing.



