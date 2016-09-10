# Регулярные выражения в 1С

Регулярные выражания в 1С без использования внешних компонент (через XDTO фасеты)

* `Функция РегВыр_Компилировать(Фасет) Экспорт`

    Компилирует регулярное выражение и возвращает мутабельную структуру

    <blockquote>
    <p>
    СтрукВозвр = Новый Структура; <br>
  	СтрукВозвр.Вставить("Тип", "КомпилированныйФасет");
    // Для определения, что структура явлается фасетом<br>
  	СтрукВозвр.Вставить("Фасет", Фасет);
    // Текст регулярки<br>
  	СтрукВозвр.Вставить("Тест", Тест);
    // компилированный фасет <br>
    </p>
    </blockquote>

* `Функция РегВыр_Проверить(Строка, Регул) Экспорт`

  Проверяет строку на соответствие выражению. <br>
  Принимает в качестве второго параметра: выражение в виде текста
  либо в виде скомпилированной структуры

* Лицензия
    [LGPLv3](./LICENSE.TXT)

------------

![shot00.png](./screenshots/shot00.png)

![shot01.png](./screenshots/shot01.png)

![shot02.png](./screenshots/shot02.png)
