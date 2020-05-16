
/datum/computer_file/report/recipient/sol
	logo = "\[solcrest\]"
	form_name = "SCG-REP-00"

/datum/computer_file/report/recipient/sol/audit
	form_name = "SCG-REP-12"
	title = "Аудит Департамента"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sol/audit/generate_fields()
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Время")
	add_field(/datum/report_field/simple_text, "Департамент")
	add_field(/datum/report_field/pencode_text, "Позитивные наблюдения")
	add_field(/datum/report_field/pencode_text, "Негативные наблюдения")
	add_field(/datum/report_field/pencode_text, "Другие заметки")
	add_field(/datum/report_field/signature, "Подпись")
	add_field(/datum/report_field/options/yes_no, "Одобрено?")
	set_access(access_edit = access_representative, override = 0)
	set_access(access_edit = access_nanotrasen, override = 0)
	..()

/datum/computer_file/report/recipient/sol/crewman_incident
	form_name = "SCG-REP-4"
	title = "Отчет об Инциденте с Членом Экипажа"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sol/crewman_incident/generate_fields()
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Время")
	add_field(/datum/report_field/people/from_manifest, "Член экипажа, вовлеченный в инцидент")
	add_field(/datum/report_field/simple_text, "Характер инцидента")
	add_field(/datum/report_field/pencode_text, "Описание инцидента")
	add_field(/datum/report_field/signature, "Подпись")
	add_field(/datum/report_field/options/yes_no, "Одобрено?")
	set_access(access_edit = list(access_heads, access_solgov_crew))
	..()

/datum/computer_file/report/recipient/sol/work_visa
	form_name = "SCG-REP-03b"
	title = "Форма Выдачи Рабочей Визы"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sol/work_visa/generate_fields()
	var/datum/report_field/temp_field
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Время")
	add_field(/datum/report_field/people/from_manifest, "Получатель Рабочей Визы")
	add_field(/datum/report_field/simple_text, "Биологичекий вид Получателя")
	temp_field = add_field(/datum/report_field/signature, "Подпись Выдающего")
	add_field(/datum/report_field/signature, "Подпись Получателя")
	add_field(/datum/report_field/options/yes_no, "Одобрено?")
	temp_field.set_access(access_edit = access_representative)
	..()
