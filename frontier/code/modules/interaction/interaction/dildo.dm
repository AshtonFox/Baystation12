/obj/item/weapon/dildo
	name = "dildo"
	desc = "Hmmm, deal throw"
	icon = 'frontier/code/modules/interaction/icons/obj/items/dildo.dmi'
	icon_state = "dildo"
	item_state = "c_tube"
	throwforce = 0
	force = 10
	w_class = 1
	throw_speed = 3
	throw_range = 15
	attack_verb = list("slammed", "bashed", "whipped")
	var/hole = "vagina"
	var/pleasure = 10
	var/ya = "&#255;"


/********************************************************************
****************************Moans for dildo**************************
*******************************FIX NEEDED****************************
****it isn't working properly and i think it isn't working at all****
***********************Todo: fix this shit please********************
********************************************************************/
mob/living/carbon/human/proc/dmoan()
//	var/ya = "&#255;"
	var/mob/living/carbon/human/M = src
	if(!is_muzzled())
		if(M.species.get_bodytype() in moan)
			if (prob(M.arousal / M.resistenza * 65))
				var/message = pick("�����������", "������ �� ������������", "���������� �����", "���������� ����", "�������� ������������")
				M.visible_message("<B>[M]</B> [message].")
				var/g = M.gender == FEMALE ? "f" : "m"
				var/moan = rand(1, 7)
				if (moan == lastmoan)
					moan--
				if(!istype(loc, /obj/structure/closet))
					playsound(loc, "frontier/code/modules/interaction/sound/interactions/moan_[g][moan].ogg", 70, 1, frequency = get_age_pitch())
				else if (g == "f")
					playsound(loc, "frontier/code/modules/interaction/sound/interactions/under_moan_f[rand(1, 4)].ogg", 70, 1, frequency = get_age_pitch())
				lastmoan = moan

				if(istype(M.head, /obj/item/clothing/head/kitty) || istype(M.head, /obj/item/clothing/head/collectable/kitty))
					playsound(loc, "frontier/code/modules/interaction/sound/interactions/purr_f[rand(1, 3)].ogg", 70, 1, 0)

		if(M.species.get_bodytype() in purr)
			if (prob(M.arousal / src.resistenza * 70))
				var/message = pick("��������", "�������� �� ������������", "���������� �����", "�������� ������������")
				M.visible_message("<B>[M]</B> [message].")
				playsound(loc, "frontier/code/modules/interaction/sound/interactions/purr[rand(1, 3)].ogg", 70, 1, frequency = get_age_pitch())

		if(M.species.get_bodytype() in whine)
			if (prob(M.arousal / src.resistenza * 70))
				var/message = pick("�����������", "����������� �� ������������", "���������� �����", "�������� ������������")
				M.visible_message("<B>[M]</B> [message].")
		if(M.species.get_bodytype() in hiss)
			if (prob(M.arousal / M.resistenza * 65))
				var/message = pick("�������� �����", "���������� �� ������������")
				M.visible_message("<B>[M]</B> [message].")

		if(M.species.get_bodytype() in squeak)
			if (prob(M.arousal / M.resistenza * 65))
				var/message = pick("�������� �����", "���������� �� ������������")
				M.visible_message("<B>[M]</B> [message].")

	else if (prob(M.lust / M.resistenza * 65))
		var/message = pick("���� ������", "����������� � ������", "���������� ����� �� ������������")
		M.visible_message("<B>[M]</B> [message].")


	else if (prob(M.arousal / M.resistenza * 65))
		var/message = pick("���� ������", "����������� � ������", "���������� ����� �� ������������")
		M.visible_message("<B>[M]</B> [message].")

/obj/item/weapon/dildo/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	var/hasvagina = (M.gender == FEMALE && M.species.genitals && M.species.name != "Stok")
	var/hasanus = M.species.anus
	var/mouthfree = !(M.wear_mask)
	var/message = ""

// Va-Gina

	if(istype(M, /mob/living/carbon/human) && user.zone_sel.selecting == "groin" && M.is_nude())
		if (hole == "vagina" && hasvagina && M.erpcooldown == 0)
			if (user == M)
				message = pick("������������� ���� � ������� �����", "��������� ����� � ���� �����", "����������� ����� � ���� ������ �� ����� ����", "��������� ����� � ��� ����", "������� ���� �� ��������� ��� ������ �����")
			else
				message = pick("������������� [M] � ������� �����", "��������� ����� � ����� [M]", "����������� ����� � ������ [M] �� ����� ����", "��������� ����� � ���� [M]", "������� [M] �� ��������� ��� ������ �����")

			if (prob(5) && M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple><B>[user] [message].</B></font>")
				M.lust += pleasure * 2

			else if (M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple>[user] [message].</font>")
				M.lust += pleasure

			if (M.lust >= M.resistenza)
				M.cum(M, user, "floor")
			else
				M.moan()

			user.do_fucking_animation(M)
			playsound(loc, "frontier/code/modules/interaction/sound/interactions/bang[rand(4, 6)].ogg", 70, 1, -1)

// A-S-S

	if(istype(M, /mob/living/carbon/human) && user.zone_sel.selecting == "groin" && M.is_nude())
		if (hole == "anus" && hasanus && M.erpcooldown == 0)
			if (user == M)
				message = pick("������������� ���� ������� � ������� �����", "������� ���� � ��� ��� ������ �����", "����������� ����� ���� � ���� �� ����� ����", "������ ���� �������, ��������� �����", "����� ����� � ����� ����� ��� ������ �����")
			else
				message = pick("������������� [M] ������� � ������� �����", "������� [M] � ��� ��� ������ �����", "����������� ����� [M] � ���� �� ����� ����", "������ ������� [M], ��������� �����", "����� ����� � ����� [M] ��� ������ �����")

			if (prob(5) && M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple><B>[user] [message].</B></font>")
				M.lust += pleasure * 2

			else if (M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple>[user] [message].</font>")
				M.lust += pleasure

			if (M.lust >= M.resistenza)
				M.cum(M, user, "floor")
			else
				M.moan()

			user.do_fucking_animation(M)
			playsound(loc, "frontier/code/modules/interaction/sound/interactions/bang[rand(4, 6)].ogg", 70, 1, -1)

// Suck it carefully, babe

	if(istype(M, /mob/living/carbon/human) && user.zone_sel.selecting == "mouth" && mouthfree)
		if (hole == "mouth")
			if (user == M)
				message = pick("������������� ���� ������� ��� ������ �����", "����������� ����� ���� � ������", "������������� ���� ������, ��������� �����", "������� ���� � �����, ��������� �����", "����������� ����� ���� � ������ �� ����� ����", "���� ����� ��� �������")
			else
				message = pick("������������� ������� [M] ��� ������ �����", "����������� ����� [M] � ������", "������������� ������ [M], ��������� �����", "������� [M] � ����� ��� ������ �����", "����������� ����� � ������ [M] �� ����� ����")

			if (prob(5) && M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple><B>[user] [message].</B></font>")
				M.arousal += pleasure * 2

			else if (M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple>[user] [message].</font>")
				M.arousal += pleasure

			else if (M.arousal <= M.resistenza / 2) // <-- Maybe issue is here
				M.dmoan()

			user.do_fucking_animation(M)
			playsound(loc, "frontier/code/modules/interaction/sound/interactions/oral[rand(1, 2)].ogg", 70, 1, -1)
			if (prob(pleasure))
				M.losebreath += 5
				M.visible_message("<B>[M]</B> [pick("������� <B>�����</B>", "����������", "�������� � ������� ������")].")
				if (istype(M.loc, /obj/structure/closet))
					M.visible_message("<B>[M]</B> [pick("������� <B>�����</B>", "����������", "�������� � ������� ������")].")

/*********************************************
*****Switch between rot, pez-da and zhopa*****
*********************************************/
/obj/item/weapon/dildo/attack_self(mob/user as mob)
	if(hole == "vagina")
		hole = "anus"
	else if(hole == "anus")
		hole = "mouth"
	else if(hole == "mouth")
		hole = "vagina"
	user << "<span class='warning'>Hmmm. Maybe we should put it in [hole]?!</span>"

