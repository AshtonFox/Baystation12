
/datum/computer_file/report/recipient/medical
	logo = "\[bluelogo\]"
	form_name = "NT-MED-00"

/datum/computer_file/report/recipient/medical/checkup
	form_name = "NT-MED-013b"
	title = "Контрольный Список Медицинского Осмотра"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/medical/checkup/generate_fields()
	..()
	add_field(/datum/report_field/text_label/instruction, "Для проведения регулярного медицинского осмотра вам понадобится следующее оборудование: стетоскоп, анализатор здоровья, фонарик.")
	add_field(/datum/report_field/people/from_manifest, "Пациент")
	add_field(/datum/report_field/date, "Дата")
	add_field(/datum/report_field/time, "Время")
	add_field(/datum/report_field/simple_text, "Проверить пульс", "НЕ ПРОВЕРЕНО")
	add_field(/datum/report_field/simple_text, "Проверить кровяное давление", "НЕ ПРОВЕРЕНО")
	add_field(/datum/report_field/simple_text, "Проверить наличие шумов в сердце", "НЕ ПРОВЕРЕНО")
	add_field(/datum/report_field/simple_text, "Проверить наличие шумов в легких", "НЕ ПРОВЕРЕНО")
	add_field(/datum/report_field/simple_text, "Спросить пациента, занимается ли пациент спортом", "НЕ ПРОВЕРЕНО")
	add_field(/datum/report_field/simple_text, "Спросить пациента, курит ли пациент; если да, как часто", "НЕ ПРОВЕРЕНО")
	add_field(/datum/report_field/simple_text, "Проверить реакцию зрачков на свет", "НЕ ПРОВЕРЕНО")
	add_field(/datum/report_field/simple_text, "Спросить пациента, не подвергался ли пациент недавно радиационному облучению", "НЕ ПРОВЕРЕНО")
	add_field(/datum/report_field/simple_text, "Спросить пациента о недавно перенесенных болезнях", "НЕ ПРОВЕРЕНО")
	add_field(/datum/report_field/pencode_text, "Другие заметки")
	add_field(/datum/report_field/signature, "Подпись врача")
	set_access(access_edit = access_medical_equip)

/datum/computer_file/report/recipient/medical/autopsy
	form_name = "NT-MED-015"
	title = "Отчет о Вскрытии"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/medical/autopsy/generate_fields()
	..()
	add_field(/datum/report_field/simple_text, "Судно", GLOB.using_map.station_name)
	add_field(/datum/report_field/simple_text, "Полное имя пациента")
	add_field(/datum/report_field/text_label/header, "Сведения о смерти")
	add_field(/datum/report_field/date, "Дата смерти")
	add_field(/datum/report_field/time, "Время смерти")
	add_field(/datum/report_field/text_label/instruction, "Отметьте, является ли время смерти приблизительным.")
	add_field(/datum/report_field/options/yes_no, "Приблизительное?")
	add_field(/datum/report_field/simple_text, "Причина(-ы) смерти")
	add_field(/datum/report_field/text_label/instruction, "Опишите, как умер пациент.")
	add_field(/datum/report_field/pencode_text, "Описание смерти")
	add_field(/datum/report_field/text_label/instruction, "Опишите посмертное обращение с телом. Обратитесь к мед.записям.")
	add_field(/datum/report_field/pencode_text, "Посмертные инструкции")
	add_field(/datum/report_field/text_label/header, "Сведения о враче")
	add_field(/datum/report_field/text_label/instruction, "Подписываясь ниже, я подтверждаю, что все вышесказанное соответствует фактам, известным мне.")
	add_field(/datum/report_field/people/from_manifest, "Врач")
	add_field(/datum/report_field/signature, "Подпись врача")
	set_access(access_morgue, access_surgery)

	add_field(/datum/report_field/text_label/instruction, "Подписываясь ниже, я подтверждаю, что я рассмотрел все вышеизложенное и могу сказать, что это соответствует фактам, известным мне. Если Главный Врач отсутствует, то эта подпись может быть пропущена.")
	var/datum/report_field/cmofield = add_field(/datum/report_field/people/from_manifest, "Chief Medical Officer")
	cmofield.set_access(access_morgue, access_cmo)
	cmofield = add_field(/datum/report_field/signature, "Подпись Главного Врача")
	cmofield.set_access(access_morgue, access_cmo)
