/datum/computer_file/report/recipient/exp
	logo = "\[logo\]"

/datum/computer_file/report/recipient/exp/New()
	..()
	set_access(access_pathfinder, access_pathfinder)
	set_access(access_heads, override = 0)

/datum/computer_file/report/recipient/exp/fauna
	form_name = "NT-EXP-19f"
	title = "Отчет по Инопланетной Фауне"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/exp/fauna/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИСНТ Синяя Сойка - Отдел Экспедиций")
	add_field(/datum/report_field/text_label/instruction, "Нижеследующее заполняется членами экспедиционного отряда после обнаружения и изучения новых инопланетных форм жизни.")

	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/people/list_from_manifest, "Участники экспедиции")
	add_field(/datum/report_field/pencode_text, "Анатомия/Внешний вид")
	add_field(/datum/report_field/pencode_text, "Локомоция")
	add_field(/datum/report_field/pencode_text, "Рацион питания")
	add_field(/datum/report_field/pencode_text, "Среда обитания")
	add_field(/datum/report_field/simple_text, "Планета происхождения")
	add_field(/datum/report_field/pencode_text, "Поведение")
	add_field(/datum/report_field/pencode_text, "Способности к защите/нападению")
	add_field(/datum/report_field/pencode_text, "Особые характеристики")
	add_field(/datum/report_field/pencode_text, "Класс")

	add_field(/datum/report_field/text_label/instruction, "После заполнения этого отчета и утверждения отчета Директором Исследовательского Отдела, Директор должен отправить его по факсу как Центральному Командованию, так и Капитану, а также хранить копию в своем офисе вместе с другими отчетами о миссиях.")

/datum/computer_file/report/recipient/exp/planet
	form_name = "NT-EXP-17"
	title = "Отчет по Экзопланете"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/exp/planet/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИСНТ Синяя Сойка - Отдел Экспедиций")
	add_field(/datum/report_field/text_label/instruction, "Нижеследующее заполняется членами экспедиционного отряда после экспедиции на неизведанную экзопланету.")

	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/simple_text, "Название экзопланеты")
	add_field(/datum/report_field/people/list_from_manifest, "Участники экспедиции")
	add_field(/datum/report_field/pencode_text, "Информация о местности")
	add_field(/datum/report_field/simple_text, "Обитаемость")
	add_field(/datum/report_field/pencode_text, "Резюме по фауне")
	add_field(/datum/report_field/pencode_text, "Резюме по флоре")
	add_field(/datum/report_field/pencode_text, "Точки интереса")
	add_field(/datum/report_field/pencode_text, "Наблюдения")

	add_field(/datum/report_field/text_label/instruction, "После заполнения этого отчета и утверждения отчета Директором Исследовательского Отдела, Директор должен отправить его по факсу как Центральному Командованию, так и Капитану, а также хранить копию в своем офисе вместе с другими отчетами о миссиях.")
/*
/datum/computer_file/report/recipient/shuttle/post_flight
	logo = "\[logo\]"
	form_name = "NT-EXP-3"
*/
/datum/computer_file/report/recipient/exp/manifest
	form_name = "NT-EXP-10"
	title = "Манифест Миссии"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/exp/manifest/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "ИСНТ Синяя Сойка - Отдел Экспедиций")
	add_field(/datum/report_field/text_label/instruction, "Нижеследующее заполняется членами экспедиционного отряда до начала экспедиции.")

	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Время")
	add_field(/datum/report_field/people/list_from_manifest, "Командир отряда")
	add_field(/datum/report_field/people/list_from_manifest, "Заместитель командира")
	add_field(/datum/report_field/people/list_from_manifest, "Пилот")
	add_field(/datum/report_field/people/list_from_manifest, "Член отряда")
	add_field(/datum/report_field/people/list_from_manifest, "Член отряда")
	add_field(/datum/report_field/people/list_from_manifest, "Член отряда")
	add_field(/datum/report_field/people/list_from_manifest, "Сотрудник охраны")
	add_field(/datum/report_field/people/list_from_manifest, "Сотрудник охраны")
	add_field(/datum/report_field/people/list_from_manifest, "Сотрудник по защите активов")

	add_field(/datum/report_field/text_label/instruction, "Минимальный состав экспедиционного отряда должен включать в себя сотрудника в должности Первопроходца. Без выполнения этого условия Манифест считается недействительным.")
