#  Проверка, изменение и построение рисунков PencilKit

        Ссылка на оригинальный проект:
        https://developer.apple.com/documentation/pencilkit/inspecting-modifying-and-constructing-pencilkit-drawings

### Приложение генерирует рисунок текста и пользователь должен обводить рисунок как можно ближе к оригиналу и тогда приложение засчитывает пользователю выполнение задания и показывает процент выпонения задания. Если пользователь будет значительно отклоняться от нарисованных изображений, приложение не засчитает это задание как выполненное.

Это разбор приложения представленного Apple на WWDC20 session: 10148. Приложение должно запускаться только на iPad, поэтому надо подключить iPad к Xcode для тестирования.

    Запустим приложение на iPad и посмотрим его функционал. 
    Чтобы оригинальное приложение запустилось после запуска приложения на iPad делаем следующие шаги : Settings -> General -> VPN & Device Managment -> Включам trust аккаунту с которого ставите приложение на iPad
    На первом экране пользователь может написать текст в строке ввода и такой же текст отображается для обводки Apple Pencil. По рисунку бежит точка, показывая как надо обводить и в правом верхнем углу есть Настройки где можно указать рамер рисунка для обводки, сокорость анимации, и сложность(видимо она же точность, которая требуется при обводке)

## Section 1: Подключение iPad к Xcode для тестирования

1. Подключаем iPad по кабелю к Mac 
2. Проходим авторизацию -> trust this computer
3. Далее Xcode попросит включить на iPad Developer mode: Settings -> Pryvacy and Security -> Developer mode -> On -> Restart iPad
4. После завершения всех процедур заходим в Xcode и в выборе устройств manage run destionations выбираем iPad -> Дожидаемся пока Xcode завершит pairing

## Section 2: Что есть в проекте?
    1. Проект сделан с использованием StoryBoard iOS 14.
    
    2. По мимо AppDelegate и SceneDelegate есть еще 6 файлов:
    PracticeViewController
    TextGenerator
    SettingsViewController
    ScoreViewController
    PKStrokeMatching
    PKStrikePathAdditions

    3. Первым экраном идет PracticeViewController и при помощи segue идет перенаправление на экран SettingsViewController(нажатие кнопки с иконкой шестерни на первом экране present as popover) и преход на экран ScoreViewController (present modally), если пользователь завершил задание, где отображается Смайлик и процент точности выполнения задания.
    4. Какие используются фреймворки: UIKit, PencilKit.
    
## Section 3: Воссоздадим Main.storyboard - Practice View Controller - главный экран
        Напоминание))
    При работе со StoryBoard потребуются испекторы(Inspectors) правый верхний угол в Xcode и для каждой view проверяем Attribute inspector, Size inspector. Для каждого контроллера проверяем Connections inspector и подключение класса(класс с которым будет связан контроллер в storyboard)
    
    Обратите внимание, что все view имеют привязку к superview и нет вложенности в друг в друга
    1. Для построения используется устройство iPad 11 pro M4 в альбомном раположении. Создадим из шаблона Swift файл PracticeViewController.swift c одноименным классом и подпишем его на UIViewController или создадим файл из CocoaTouchClass файл и сразу выберем нужный нам класс. Так же нам понадобится UIKit и PencilKit.
    2. На первом экране на главный View добавляем Background Canvas View - это просто view с таким названием
    3. Выставляем размеры в Size inspector
    4. Выставляем constraints - в этом случае края view привязаны к краям superview. Стандартным образом будет предложено выставить constrains to safe area, но потом нужно зайти в каждый constraint и поменять safe area на superview
    5. Далее идёт Canvas View с такими же характеристиками как и BackgroundCanvasView
    6. Создадим переменные для этих view в классе PracticeViewController и соединим их со storyboard в разделе connections inspector или второй вариант: выбираем Main.storyboard -> выбираем нужный нам контроллер -> на клавиатуре option + click on file (откроется дополнительное окно с выбранным фалом) -> в файле Main.storyboard кликаем на нужный view -> control + drag в файл с кодом и делаем нужное название переменной и задаём нужный тип переменной. В этом варианте соединение переменной в файле и в storybord произойдёт автоматически
    
    Добавим 3 view: textfield, label, button и затем создадим для них constraints. Переменные в классе будут создаваться только для textField и для label
    7. Следующий элемент Practice textField
    8. Добавим Label 
    9. Добавим Button - поскольку Button view не будет добавляться в файл, свойства этого элемента надо будет проставить в Main.Storyboard в разделе Attribute inspector
    Если не получилось стразу проставить нужные параметры для constraints, то редактируем их каждый отдельно выбирая в панели Document outline
    10. Добавили все необходимые view, проставили все constraints, и прописали все необходимые attributes. CMD+B и если нет ошибок, то commit 

## Section 4: Main.storyboard - Settings View Controller - настройки в приложении
    1. Создадим файл Settings View Controller 
    2. В этом файле будет три IBOutlet с типом данных UISegmentedControl
    В Main.storyboard создадим требуемые элементы
    3. Добавляем еще один ViewController
    4. Добавляем Segue от кнопки на PracticeViewController  и при создании segue выбираем опцию: present as popover
    5. Добавляем три Label и три Segmented Control
    6. По скольку у нас не будет IBOutlet для label все свойства необходимо указать в Attribute и Size inspector
    7. Сделаем IBOutlet для SegmentedControl
    8. Зададим значения для segmented control
    !9. Так же в этом фале вверху сделан extension для Collection. Назначение этого расширения на момент написания не понятно(10.05.25 15:35)
    10. Добавим constraints для созданных элементов
