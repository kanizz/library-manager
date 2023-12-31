﻿&НаКлиенте
Процедура ВыполнитьЗагрузку(ПомещФайл, ДополнительныеПараметры) Экспорт
	Если ПомещФайл = неопределено тогда возврат; конецЕсли;
	
	// Получаем основные данные файла 
	ИмяФайла = ПомещФайл.СсылкаНаФайл.Имя; // Имя файла у клиента
	АдресФайла = ПомещФайл.Адрес; // Временный адрес файла
	
	ЭтотОбъект.Изображение = АдресФайла;
	Объект.Наименование = ИмяФайла;
КонецПроцедуры

&НаКлиенте
Процедура ВыбратьФайл(Команда)
	// Создаём описание обратного вызова.
	Оповещение = новый ОписаниеОповещения(
		"ВыполнитьЗагрузку",
		ЭтаФорма,
		неопределено
	);
	ФильтрФайлов = новый ПараметрыДиалогаПомещенияФайлов("Выберите изображение", Ложь);
	
	НачатьПомещениеФайлаНаСервер(
		Оповещение,
		неопределено,
		неопределено,
		неопределено,
		ФильтрФайлов,
		УникальныйИдентификатор
	);
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	АдресФайла = ЭтотОбъект.Изображение;
	ДвоичныеДанные = ПолучитьИзВременногоХранилища(АдресФайла);
	ТекущийОбъект.Данные = новый ХранилищеЗначения(ДвоичныеДанные, Новый СжатиеДанных());
	УдалитьИзВременногоХранилища(АдресФайла);
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Изображение = ПолучитьНавигационнуюСсылку(Объект.Ссылка, "Данные"); 
КонецПроцедуры
