/**********************************************************
*******Interactions code by HONKERTRON feat TestUnit*******
***********Edits by AshtonFox & RenardQueenston************
***********Last Edits by PatapoIIIka************
*******Contains a lot ammount of ERP and MEHANOYEBLYA******
***********************************************************/

//INTERACTIONS
/mob/living/carbon/human
	var/mob/living/carbon/human/partner
	var/mob/living/carbon/human/lastfucked
	var/lfhole
	var/potenzia = 10
	var/resistenza = 200
	var/lust = 0
	var/erpcooldown = 0
	var/interactcooldown = 0
	var/multiorgasms = 0
	var/lastmoan
	var/arousal = 0
	var/low_arousal = 0
	var/med_arousal = 0

/*
Запилить rub для рас, чтобы таяране тёрлись _пушистыми/волосатыми_ пёздами, чтобы тераши тёрлись перьями и прочее, а не обычными как сейчас. А шо, каво?
Запилитть dickrub, чтобы каждый настоящий мужчина мог посоревноваться с другим настоящим мужчиной в своём мужыцком фехтовании.
Запилить унатхам возможность трахаться сексом в эти, как их.. Хуйные отверстия "slit".
*/

/mob/living/carbon/human/MouseDrop_T(mob/M as mob, mob/user as mob)
	if(M == src || src == usr || M != usr)		return
	if(usr.restrained())		return

	var/mob/living/carbon/human/H = usr
	H.partner = src
	make_interaction(machine)

/mob/living/carbon/human/proc/is_nude()
	return (!wear_suit && !w_uniform) ? 1 : 0 //TODO: Nudity check for underwear

/mob/living/carbon/human/make_interaction()
	set_machine(src)

	var/mob/living/carbon/human/H = usr
	var/mob/living/carbon/human/P = H.partner
	var/obj/item/organ/external/temp = H.organs_by_name["r_hand"]
	var/hashands = (temp && temp.is_usable())
	if (!hashands)
		temp = H.organs_by_name["l_hand"]
		hashands = (temp && temp.is_usable())
	temp = P.organs_by_name["r_hand"]
	var/hashands_p = (temp && temp.is_usable())
	if (!hashands_p)
		temp = P.organs_by_name["l_hand"]
		hashands = (temp && temp.is_usable())
	var/mouthfree = !(H.wear_mask)
	var/mouthfree_p = !(P.wear_mask)
	var/haspenis = ((H.gender == MALE && H.potenzia > -1 && H.species.genitals))
	var/haspenis_p = ((P.gender == MALE && P.potenzia > -1 && P.species.genitals))
	var/hasvagina = (H.gender == FEMALE && H.species.genitals && H.species.name != "Stok" && H.species.name != "Teshari")
	var/hasvagina_p = (P.gender == FEMALE && P.species.genitals && P.species.name != "Stok" && P.species.name != "Teshari")
	var/hasanus_p = P.species.anus
	var/hasanus = H.species.anus
	var/isnude = H.is_nude()
	var/isnude_p = P.is_nude()

	H.lastfucked = null
	H.lfhole = ""

	var/dat = "<B><HR><FONT size=3>INTERACTIONS - [H.partner]</FONT></B><BR><HR>"
	var/ya = "&#1103;"

	if (P != H)
		dat +=  {"• <A href='?src=\ref[src];interaction=bow'>Отвесить поклон.</A><BR>"}
		dat +=  {"• <A href='?src=\ref[src];interaction=wave'>Поприветствовать.</A><BR>"}
	if (hashands)
		dat +=  {"<font size=3><B>Руки:</B></font><BR>"}
		if (Adjacent(P))
			if (P != H)
				dat +=  {"• <A href='?src=\ref[src];interaction=handshake'>Пожать руку.</A><BR>"}
				dat +=  {"• <A href='?src=\ref[src];interaction=five'>Дать п[ya]ть.</A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=hug'>Обнимашки!</A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=cheer'>Похлопать по плечу</A><BR>"}
			if (hashands_p && (P != H))
				dat +=  {"• <A href='?src=\ref[src];interaction=give'>Передать предмет.</A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=slap'><font color=red>Дать пощечину!</font></A><BR>"}
			if (hasanus_p)
				dat += {"• <A href='?src=\ref[src];interaction=assslap'>Шлепнуть по заднице</A><BR>"}
			if (isnude_p)
				if (hasvagina_p)
					dat += {"• <A href='?src=\ref[src];interaction=fingering'><font color=purple>Просунуть пальчик...</font></A><BR>"}
				if (haspenis_p)
					dat += {"• <A href='?src=\ref[src];interaction=jerk'><font color=purple>Подрочить</font></A><BR>"}
			if ((P.species.get_bodytype() == tail) && (P != H))
				dat +=  {"• <A href='?src=\ref[src];interaction=pull'><font color=red>Дёрнуть за хвост!</font></A><BR>"}
				if(P.can_inject(H, 1))
					dat +=  {"• <A href='?src=\ref[src];interaction=pet'>Погладить.</A><BR>"}
			if (P == H)
				dat +=  {"• <A href='?src=\ref[src];interaction=pet'>Погладить себ[ya].</A><BR>"}
			if ((haspenis_p || hasvagina_p) && !isnude_p && P.species.name != "Teshari" && P.can_inject(H, 1))
				dat += {"• <A href='?src=\ref[src];interaction=petting'><font color=purple>Потрогать пах</font></A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=knock'><font color=red>Дать подзатыльник.</font></A><BR>"}
		if (P != H)
			dat +=  {"• <A href='?src=\ref[src];interaction=fuckyou'><font color=red>Показать средний палец.</font></A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=threaten'><font color=red>Погрозить кулаком.</font></A><BR>"}

	if (mouthfree && H.species.name != "Diona" && P != H)
		dat += {"<font size=3><B>Лицо:</B></font><BR>"}
		dat += {"• <A href='?src=\ref[src];interaction=kiss'>Поцеловать.</A><BR>"}
		if (Adjacent(P))
			if (mouthfree_p)
				dat += {"• <A href='?src=\ref[src];interaction=lick'>Лизнуть в щеку.</A><BR>"}
			if (isnude_p)
				if (haspenis_p)
					dat += {"• <A href='?src=\ref[src];interaction=blowjob'><font color=purple>Сделать минет.</font></A><BR>"}
				if (hasvagina_p)
					dat += {"• <A href='?src=\ref[src];interaction=vaglick'><font color=purple>Вылизать.</font></A><BR>"}
				if (hasanus_p && P.species.name != "Diona")
					dat += {"• <A href='?src=\ref[src];interaction=asslick'><font color=purple>Отполировать черный ход?!</font></A><BR>"}
			dat +=  {"• <A href='?src=\ref[src];interaction=spit'><font color=red>Плюнуть.</font></A><BR>"}
		dat +=  {"• <A href='?src=\ref[src];interaction=tongue'><font color=red>Показать [ya]зык.</font></A><BR>"}

	if (Adjacent(P) && isnude && P.species.name != "Diona" && P != H)
		if (haspenis && hashands)
			dat += {"<font size=3><B>Член:</B></font><BR>"}
			if (hasvagina_p && isnude_p && P.species.name != "Teshari")
				dat += {"• <A href='?src=\ref[src];interaction=vaginal'><font color=purple>Трахнуть вагинально.</font></A><BR>"}
			if (hasanus_p && isnude_p && P.species.name != "Vox")
				dat += {"• <A href='?src=\ref[src];interaction=anal'><font color=purple>Трахнуть анально.</font></A><BR>"}
			if (mouthfree_p)
				dat += {"• <A href='?src=\ref[src];interaction=oral'><font color=purple>Трахнуть орально.</font></A><BR>"}
	if (isnude && hashands && P != H)
		if (hasvagina)
			dat += {"<font size=3><B>Лоно:</B></font><BR>"}
			if (isnude_p && haspenis_p && usr.loc == H.partner.loc)
				dat += {"• <A href='?src=\ref[src];interaction=mount'><font color=purple>Оседлать</font></A><BR>"}
				dat += {"• <A href='?src=\ref[src];interaction=rub'><font color=purple>Потеретьс[ya]</font></A><BR>"}
			if (mouthfree_p && usr.loc == H.partner.loc)
				dat += {"• <A href='?src=\ref[src];interaction=facesitting'><font color=purple>Сесть на лицо</font></A><BR>"}
			if (mouthfree_p && (Adjacent(P) || (usr.loc == H.partner.loc)))
				dat += {"• <A href='?src=\ref[src];interaction=forcelick'><font color=purple>Заставить отлизывать</font></A><BR>"}
			if ((usr.loc == H.partner.loc) && hasvagina_p)
				dat += {"• <A href='?src=\ref[src];interaction=tribadism'><font color=purple>Трибадизм</font></A><BR>"}
	if (isnude && hashands && P.species.name != "Diona" && P.species.name != "Vox" && P != H)
		if (hasanus && haspenis_p)
			dat += {"<font size=3><B>Зад:</B></font><BR>"}
			if (isnude_p && usr.loc == H.partner.loc)
				dat += {"• <A href='?src=\ref[src];interaction=assfuck'><font color=purple>Оседлать задом</font></A><BR>"}

	var/datum/browser/popup = new(usr, "interactions", "Interactions", 340, 480)
	popup.set_content(dat)
	popup.open()