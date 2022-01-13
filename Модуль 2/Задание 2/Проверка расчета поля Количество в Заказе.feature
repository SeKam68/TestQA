﻿#language: ru

@tree

Функционал: Проверка расчета суммы документа Заказ 

Как Менеджер по продажам я хочу
что бы в документе Заказ
при изменении цены или количества 
пересчитывалась сумма документа
чтобы оформлять заказы товаров

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Изменение реквизита Цена документа Заказ

* Открытие формы документа
	И я закрываю все окна клиентского приложения

	// Создание документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'

	И Заполнить шапку документа Заказ

* Заполнение товарной части		
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'

	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000017' | 'Bosch1234'     |
	И в таблице "Список" я выбираю текущую строку


* Изменение значения реквизита Количество			
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'
	И в таблице "Товары" я завершаю редактирование строки

	// Циклы же мы еще не проходили
* Заполнение товарной части 2 строка		
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'

	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000034' | 'Veko876N'     |
	И в таблице "Список" я выбираю текущую строку

* Изменение значения реквизита Количество			
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '25'
	И в таблице "Товары" я завершаю редактирование строки


* Проверка заполнения табличной части
	Тогда таблица "Товары" содержит строки:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'      |
		| 'Bosch1234' | '3 000,00' | '10'         | '30 000,00'  |
		| 'Veko876N'  | '5 500,00' | '25'         | '137 500,00' |

* Проверка расчета суммы документа
		И элемент формы с именем "ТоварыИтогКоличество" стал равен '35'
