//These are modified by Donnarex to avoid comprehensive map book-picking changes

/obj/item/weapon/book/manual/solgov_law
	name = "Space Law"
	desc = "An overview of so-called \"Space Law\" applicible to NanoTrasen facilities."
	icon_state = "bookSolGovLaw"
	author = "NanoTrasen"
	title = "Space Law"

/obj/item/weapon/book/manual/solgov_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]index.php?title=Корпоративные_законы&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}


/obj/item/weapon/book/manual/military_law //No need touching this
	name = "The Sol Code of Military Justice"
	desc = "A brief overview of military law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "The Sol Code of Military Justice"

/obj/item/weapon/book/manual/military_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]Sol_Gov_Military_Justice&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/weapon/book/manual/sol_sop
	name = "Standard Operating Procedure"
	desc = "SOP aboard the NTEV Blue Jay."
	icon_state = "booksolregs"
	author = "NanoTrasen"
	title = "Standard Operating Procedure"

/obj/item/weapon/book/manual/sol_sop/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]index.php?title=Стандартные_протоколы&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/weapon/folder/nt/rd

/obj/item/weapon/paper/liason_note
	name = "note"
	info = {"
	<i>Here's your back-out plan.<br>
	H.B.</i>
	"}

/obj/item/weapon/folder/envelope/captain
	desc = "A thick envelope. The NT crest is stamped in the corner, along with 'TOP SECRET - BLUE JAY UMBRA'."

/obj/item/weapon/folder/envelope/captain/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/item/weapon/folder/envelope/captain/LateInitialize()
	..()
	var/obj/effect/overmap/visitable/torch = map_sectors["[1]"]
	var/memo = {"
	<tt><center><b><font color='red'>СЕКРЕТНО - КОДОВЫЕ СЛОВА: СИНЯЯ СОЙКА</font></b>
	<h3>ЦЕНТРАЛЬНОЕ КОМАНДОВАНИЕ НАНОТРЕЙЗЕН</h3>
	<img src = ntlogo.png>
	</center>
	<b>ОТ:</b> Адмирал Уильям Лау<br>
	<b>КОМУ:</b> Капитану ИСНТ Синяя Сойка<br>
	<b>ТЕМА:</b> Регламент<br>
	<hr>
	Капитан.<br>
	Вам приказано посетить следующие звездные системы. Имейте в виду, что ваши ресурсы ограничены; расходуйте время надлежащим образом.
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[GLOB.using_map.system_name]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<br>
	Приоритетными целями являются артефакты неизвестных ранее чужеродных видов и источники сигналов неизвестного происхождения.<br>
	Ни на одну из этих систем не претендует ни одна организация, признанная ПСС, поэтому вы имеете полное право на утилизацию любых обнаруженных обломков.<br>
	Исследуйте и отмечайте любые пригодные для колонизации миры в соответствии с обычными процедурами.<br>
	В перечисленных системах не присутствуют корабли ПСС или флота НТ. В случае получения сигналов бедствия, вы, вероятно, будете единственным судном, которое сможет отреагировать; не игнорируйте их. Мы не должны ставить под сомнение Корпоративную репутацию.<br>
	Текущие коды стыковки: [torch.docking_codes]<br>
	Перед совершением межсистемных прыжков, докладывайте Центральному Командованию обо всех находках.<br>

	<i>Адмирал Лау.</i></tt>
	<i>This paper has been stamped with the stamp of Central Command.</i>
	"}
	new/obj/item/weapon/paper(src, memo, "Standing Orders")
	new/obj/item/weapon/paper/umbra(src)

/obj/item/weapon/folder/envelope/rep
	desc = "A thick envelope. The SCG crest is stamped in the corner, along with 'TOP SECRET - SILENCE'."

/obj/item/weapon/folder/envelope/rep/Initialize()
	. = ..()
	new/obj/item/weapon/paper/umbra/scg(src)

/obj/item/weapon/folder/envelope/iaa
	desc = "A thick envelope. The NT crest is stamped in the corner, along with 'TOP SECRET - SILENCE'."

/obj/item/weapon/folder/envelope/iaa/Initialize()
	. = ..()
	new/obj/item/weapon/paper/umbra(src)

/obj/item/weapon/paper/umbra
	name = "SILENCE Protocol"
	info = {"
	<tt><center><b><font color='red'>СОВЕРШЕННО СЕКРЕТНО - КЛЮЧЕВЫЕ СЛОВА: СИНЯЯ СОЙКА, SILENCE</font></b>
	<h3>АДМИНИСТРАТИВНАЯ СТАНЦИЯ НАНОТРЕЙЗЕН ВИКТОР</h3>
	<img src = ntlogo.png>
	</center>
	<b>ОТ:</b> Марк Уотни, Исполнительный директор АСНТ Виктор<br>
	<b>КОМУ:</b> Капитану ИСНТ Синяя Сойка<br>
	<b>ПОЛУЧАТЕЛЬ КОПИИ:</b> Агент Внутренних Дел на борту ИСНТ Синяя Сойка<br>
	<b>ТЕМА:</b> Протокол SILENCE<br>
	<hr>
	Это небольшое дополнение к процедурам. В отличии от прочих частей СП, эта не носит рекомендательный характер и обязательна к исполнению Капитаном. Данное дополнение является необходимым для успешной и бесперебойной работы миссии.<br>
	Процедура может быть инициирована ислючительно передачей команды с АСНТ "Виктор" по защищённому каналу. Отправитель, возможно, не будет указан, но у вас не должно возникнуть проблем с определением источника передачи.<br>
	Сигналом для инициирования протокола является кодовая фраза 'GOOD NIGHT WORLD', используемая в таком порядке слов и не раздельно. Вам не нужно отправлять подтверждение получения.
	<li>Информация о результатах текущей экспедиции должна рассматриваться как секретная и жизненно важная для безопасности НаноТрейзен. Данные должны быть помечены грифом 'Секретно - SILENСЕ'. Экипажу на борту ИСНТ Синяя Сойка разрешён доступ к этой информации по мере необходимости.</li>
	<li>Секретность этой информации имеет обратную силу. Любые неавторизованные лица, или неавторизованный персонал, получивший доступ к секретной информации, должен быть заключён под стражу и передан департаменту защиты активов на АСНТ Виктор по прибитии.</li>
	<li>Любые устройства способные передавать или получать информацию между звёздными системами, должны быть конфискованы из личного пользования.</li>
	<li>При инициировании протокола следует: установить курс на Административную Станцию НаноТрейзен 'Виктор', расположенную в системе Звезда Виктора; следовать установленным курсом к АСНТ Виктор, планом полёта пренебречь; не совершать остановок в портах, помимо случаев крайней необходимости.</li>
	<br>
	Хотя это и радикальная мера, я уверяю вас, что это мера предосторожности во избежание проблем. Продолжайте выполнять свои должостные обязанности, оставляя возможность для подобного исхода событий.
	<i>С уважением, Марк.</i></tt>
	<i>This paper has been stamped with the stamp of Central Command.</i>
	"}

/obj/item/weapon/paper/umbra/scg
	name = "SILENCE Protocol"
	info = {"
	<tt><center><b><font color='red'>СОВЕРШЕННО СЕКРЕТНО - КЛЮЧЕВЫЕ СЛОВА: СИНЯЯ СОЙКА, SILENCE</font></b>
	<h3>КАНЦЕЛЯРИЯ ГЕНЕРАЛЬНОГО СЕКРЕТАРЯ ПРАВИТЕЛЬСТВА СОЛНЕЧНОЙ СИСТЕМЫ</h3>
	<img src = sollogo.png>
	</center>
	<b>ОТ:</b> Джонатан Смитерсон, Специальный Помощник Генерального Секретаря<br>
	<b>КОМУ:</b> Представителю ПСС на борту ИСНТ Синяя Сойка<br>
	<b>ТЕМА:</b> Протокол SILENCE<br>
	<hr>
	Информируем вас о наличии секретного протокола, предназначенного для обязательного исполнения Капитаном ИСНТ Синяя Сойка, как только таковой протокол будет инициирован. Протокол SILENCE является дополнением к набору Стандартных Процедур.<br>
	Процедура может быть инициирована ислючительно передачей команды с АСНТ "Виктор" по защищённому каналу. Отправитель, возможно, не будет указан.<br>
	Сигналом для инициирования протокола является кодовая фраза 'GOOD NIGHT WORLD', используемая в таком порядке слов и не раздельно. Капитану не нужно отправлять подтверждение получения.
	<li>Информация о результатах текущей экспедиции должна рассматриваться как секретная и жизненно важная для безопасности НаноТрейзен. Данные должны быть помечены грифом 'Секретно - SILENСЕ'. Экипажу на борту ИСНТ Синяя Сойка разрешён доступ к этой информации по мере необходимости.</li>
	<li>Секретность этой информации имеет обратную силу. Любые неавторизованные лица, или неавторизованный персонал, получивший доступ к секретной информации, должен быть заключён под стражу и передан департаменту защиты активов на АСНТ Виктор по прибитии.</li>
	<li>Любые устройства способные передавать или получать информацию между звёздными системами, должны быть конфискованы из личного пользования.</li>
	<li>При инициировании протокола Капитану судна следует: установить курс на Административную Станцию НаноТрейзен 'Виктор', расположенную в системе Звезда Виктора; следовать установленным курсом к АСНТ Виктор, планом полёта пренебречь; не совершать остановок в портах, помимо случаев крайней необходимости.</li>
	<br>
	Корпоративные представители уверяют нас, что, хотя это и радикальная мера, но она введена в качестве предосторожности. Продолжайте выполнять свои должостные обязанности, следите за законностью действий Капитана, особенно после инициирования протокола.
	<i>С уважением, Дж.Смиттерсон.</i></tt>
	<i>This paper has been stamped with the stamp of Office of the General Secretary of SCG.</i>
	"}
