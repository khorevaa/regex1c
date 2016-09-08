Функция РегВыр_Компилировать(Фасет) Экспорт

	Чтение = Новый ЧтениеXML;
    Чтение.УстановитьСтроку(
    "<Model xmlns=""http://v8.1c.ru/8.1/xdto"" xmlns:xs=""http://www.w3.org/2001/XMLSchema"" xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xsi:type=""Model"">
    |	<package targetNamespace=""sample-my-package"">
	|		<valueType name=""testtypes"" base=""xs:string"">
	|			<pattern>" + Фасет + "</pattern>
	|		</valueType>
	|		<objectType name=""TestObj"">
	|			<property xmlns:d4p1=""sample-my-package"" name=""TestItem"" type=""d4p1:testtypes""/>
	|		</objectType>
	|	</package>
	|</Model>");

    Модель = ФабрикаXDTO.ПрочитатьXML(Чтение);
    МояФабрикаXDTO = Новый ФабрикаXDTO(Модель);
    Пакет = МояФабрикаXDTO.Пакеты.Получить("sample-my-package");
    Тест = МояФабрикаXDTO.Создать(Пакет.Получить("TestObj"));

	СтрукВозвр = Новый Структура;
	СтрукВозвр.Вставить("Тип", "КомпилированныйФасет");
	СтрукВозвр.Вставить("Фасет", Фасет);
	СтрукВозвр.Вставить("Тест", Тест);

	Возврат СтрукВозвр;

КонецФункции

Функция РегВыр_Проверить(Строка, Регул) Экспорт

	Тест = Неопределено;
	Если ТипЗнч(Регул) = Тип("ОбъектXDTO") Тогда
		Тест = Регул;
	ИначеЕсли ТипЗнч(Регул) = Тип("Структура") Тогда
		Если Регул.Тип = "КомпилированныйФасет" Тогда
			Тест = Регул.Тест;
		Иначе
			ВызватьИсключение "Структура не является компилированным регулярным выражением";
		КонецЕсли;
	ИначеЕсли ТипЗнч(Регул) = Тип("Строка") Тогда
		Тест = РегВыр_Компилировать(Регул);
	Иначе
		ВызватьИсключение "Аргумент не является регулярным выражением";
	КонецЕсли;

	Попытка
        Тест.TestItem = Строка;
        Возврат Истина
    Исключение
        Возврат Ложь
    КонецПопытки;

КонецФункции
