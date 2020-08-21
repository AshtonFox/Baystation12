/mob/proc/make_interaction()
	return

proc/floorI(x,y)
	return round((x) / (y)) * (y)

proc/modulusI(x,y)
	return (x) - (y) * round((x) / (y))

mob/living/carbon/human/proc/moan()
//	var/ya = "&#255;"
	var/mob/living/carbon/human/H = src
	if(!is_muzzled())
		if(H.species.get_bodytype() in moan)
			if(prob(H.lust / H.resistenza * 65))
				var/message = pick("�����������", "������ �� ������������", "���������� �����", "���������� ����", "�������� ������������")
				H.visible_message("<B>[H]</B> [message].")
				var/g = H.gender == FEMALE ? "f" : "m"
				var/moan = rand(1, 7)
				if (moan == lastmoan)
					moan--
				if(!istype(loc, /obj/structure/closet))
					playsound(loc, "frontier/code/modules/interaction/sound/interactions/moan_[g][moan].ogg", 70, 1, frequency = get_age_pitch())
				else if (g == "f")
					playsound(loc, "frontier/code/modules/interaction/sound/interactions/under_moan_f[rand(1, 4)].ogg", 70, 1, frequency = get_age_pitch())
				lastmoan = moan

				if(istype(H.head, /obj/item/clothing/head/kitty) || istype(H.head, /obj/item/clothing/head/collectable/kitty))
					playsound(loc, "frontier/code/modules/interaction/sound/interactions/purr_f[rand(1, 3)].ogg", 70, 1, 0)

		if(H.species.get_bodytype() in purr)
			if (prob(H.lust / src.resistenza * 70))
				var/message = pick("��������", "�������� �� ������������", "���������� �����", "�������� ������������")
				H.visible_message("<B>[H]</B> [message].")
				playsound(loc, "frontier/code/modules/interaction/sound/interactions/purr[rand(1, 3)].ogg", 70, 1, frequency = get_age_pitch())

		if(H.species.get_bodytype() in whine)
			if (prob(H.lust / src.resistenza * 70))
				var/message = pick("�����������", "����������� �� ������������", "���������� �����", "�������� ������������")
				H.visible_message("<B>[H]</B> [message].")
		if(H.species.get_bodytype() in hiss)
			if (prob(H.lust / H.resistenza * 65))
				var/message = pick("�������� �����", "���������� �� ������������")
				H.visible_message("<B>[H]</B> [message].")

		if(H.species.get_bodytype() in squeak)
			if (prob(H.lust / H.resistenza * 65))
				var/message = pick("�������� �����", "���������� �� ������������")
				H.visible_message("<B>[H]</B> [message].")

	else if (prob(H.lust / H.resistenza * 65))
		var/message = pick("���� ������", "����������� � ������", "���������� ����� �� ������������")
		H.visible_message("<B>[H]</B> [message].")

/mob/living/carbon/human/proc/get_age_pitch()
	return 1.0 + 0.5*(30 - age)/80

/mob/living/carbon/human/proc/do_fucking_animation(mob/living/carbon/human/P)
	var/pixel_x_diff = 0
	var/pixel_y_diff = 0
	var/final_pixel_y = initial(pixel_y)

	var/direction = get_dir(src, P)
	if(direction & NORTH)
		pixel_y_diff = 8
	else if(direction & SOUTH)
		pixel_y_diff = -8

	if(direction & EAST)
		pixel_x_diff = 8
	else if(direction & WEST)
		pixel_x_diff = -8

	if(pixel_x_diff == 0 && pixel_y_diff == 0)
		pixel_x_diff = rand(-3,3)
		pixel_y_diff = rand(-3,3)
		animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
		animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 2)
		return

	animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
	animate(pixel_x = initial(pixel_x), pixel_y = final_pixel_y, time = 2)

/proc/DisplayTimeText(time_value, round_seconds_to = 0.1)
	var/second = round(time_value * 0.1, round_seconds_to)
	if(!second)
		return "right now"
	if(second < 60)
		return "[second] second[(second != 1)? "s":""]"
	var/minute = floorI(second / 60, 1)
	second = modulusI(second, 60)
	var/secondT
	if(second)
		secondT = " and [second] second[(second != 1)? "s":""]"
	if(minute < 60)
		return "[minute] minute[(minute != 1)? "s":""][secondT]"
	var/hour = floorI(minute / 60, 1)
	minute = modulusI(minute, 60)
	var/minuteT
	if(minute)
		minuteT = " and [minute] minute[(minute != 1)? "s":""]"
	if(hour < 24)
		return "[hour] hour[(hour != 1)? "s":""][minuteT][secondT]"
	var/day = floorI(hour / 24, 1)
	hour = modulusI(hour, 24)
	var/hourT
	if(hour)
		hourT = " and [hour] hour[(hour != 1)? "s":""]"
	return "[day] day[(day != 1)? "s":""][hourT][minuteT][secondT]"

mob/living/carbon/human/proc/handle_arousal(var/mob/living/carbon/human/H)
	if(erpcooldown > 0)
		arousal -= 20
	if(arousal < 0)
		arousal = 0
	if(arousal > resistenza)
		arousal = resistenza

	if((arousal > 1) && (arousal <= low_arousal))
		arousal -= 2
	else if((arousal > low_arousal) && (arousal <= med_arousal))
		arousal -= 1
		if(prob(10))
			if(gender == FEMALE && species.name != "Resomi" && !(wear_suit || w_uniform))
				flube_splatter(src,H,0)
	else if(arousal > med_arousal)
		arousal -= 0.5
		if(prob(30))
			if(gender == FEMALE && species.name != "Resomi" && !(wear_suit || w_uniform))
				flube_splatter(src,H,0)

mob/living/carbon/human/proc/handle_lust()
	lust -= 4
	if (lust <= 0)
		lust = 0
		lastfucked = null
		lfhole = ""
		multiorgasms = 0
	if (lust == 0)
		erpcooldown -= 1
	if (erpcooldown < 0)
		erpcooldown = 0
	interactcooldown -= 1
	if (interactcooldown < 0)
		interactcooldown = 0

/mob/living/carbon/human/proc/cum(mob/living/carbon/human/H as mob, mob/living/carbon/human/P as mob, var/hole = "floor")
//	var/ya = "&#255;"
	var/message = ""
	var/turf/T
	var/obj/item/weapon/reagent_containers/R = locate() in P.loc

	if (H.gender == MALE)
		var/datum/reagent/blood/source = H.get_blood(H.vessel)
		if (P)
			T = get_turf(P)
		else
			T = get_turf(H)
		if (H.multiorgasms < H.potenzia)
			if(R && (P == H))
				R.reagents.add_reagent("semen", rand(5, 15))
			else
				var/obj/effect/decal/cleanable/cum/C = new(T)
				// Update cum information.
				C.blood_DNA = list()
				if(source.data["blood_type"])
					C.blood_DNA[source.data["blood_DNA"]] = source.data["blood_type"]
				else
					C.blood_DNA[source.data["blood_DNA"]] = "O+"

		if (H.species.genitals)
			if (hole == "mouth")
				message = pick("������� [P] � ���.", "������� [P] � ������.", "��������� ��� [P] �������.", "�������� ������� � ��� [P].", "�������� �� ������ [P].")
				var/datum/reagents/holder = new
				var/amt = rand(20,30)
				holder.add_reagent("semen", amt)
				holder.trans_to_mob(P, amt, CHEM_INGEST)

			else if (hole == "vagina")
				message = pick("������� � [P]", "�������� � ����� [P]", "��������� ��������� [P] �������.", "����� ���������� ���� �� [P], � ����� �������� �� ���.", "��������� � [P] ��������� ���, ����� �����������. ������ �������� �������� �� ���� [P].")

			else if (hole == "anus")
				message = pick("������� [P] � ���.", "��������� ������� [P] �������.", "�������� �������� �������� � ������ ����� [P].", "����������� ���� �� [P], � ����� ������� ������� �� [P.gender == MALE ? "���" : "�"] ���.", "���������� ���� �� ������� [P] � ����� �� �������� �� ���.")

			else if (hole == "floor")
				message = pick("������� �� ���!", "������� �� ������ �������!")

			else if (hole == "cumhand")
				if (P != H)
					message = pick("������� [P] � ����.", "������� � ������ ������� [P].", "������������� ����, ������ ������� � ������ [P].", "�������� ����� ����� �������, ��������� ���� [P].")
				else if (!R)
					message = pick("������� ���� � ����.", "������� � ���� ������ �������.", "������������� ����, ������ ���� ������� � ������.", "�������� ����� ����� �������, ��������� ���� ����.")
				else
					message = pick("������� � [R.name].", "���������� � ���� � ������� � [R.name].", "��������� [R.name] �������� ���.", "������� ���� � [R.name], �������.")

			else if (hole == "rub")
				message = pick("������� ���� �� �����.", "������� �� ����� [P], �������� ����� ����� �������, �� �������������.", "������������� ���� �� ������ [P].", "��������� ������� ����� ������ [P] ����� �������.")

			else if (hole == "assfuck")
				message = pick("������� [P] � �������.", "��������� ������� [P] �������.", "�������� �������� �������� � ��� [P].", "��������� ���� � ������ ����� [P].", "������������ ������� � ������ ����� [P].", "�������� � ��� [P].", "������� � ��� [P].", "��������� ���� � ��� [P].", "�������� � ������ ����� [P].", "�������� � ������� [P]")

		else
			message = pick("�������!", "�����������!")

		playsound(loc, "frontier/code/modules/interaction/sound/interactions/final_m[rand(1, 5)].ogg", 70, 1, 0)

		H.visible_message("<B>[H] [message]</B>")
		if (istype(P.loc, /obj/structure/closet))
			P.visible_message("<B>[H] [message]</B>")
		H.lust = 5
		H.resistenza += 50

	else
		if(R && (P == H))
			R.reagents.add_reagent("f_lube", rand(5, 15))
			message = pick("���������� � �������� ������� � ��������� [R.name] ����� �������", "���������� ����� � ����� ������. [R.name] ����������� ���������� ������", "�����������, � ����� ����� �������������, �������� [R.name] �������", "��������, ������� �����, � ������� � [R.name] �������")
		else
			message = pick("���������� � �������� �������", "���������� ����� � ����� ������", "�����������, � ����� ����� �������������", "��������, ������� �����")
		H.visible_message("<B>[H] [message].</B>")
		if (istype(P.loc, /obj/structure/closet))
			P.visible_message("<B>[H] [message].</B>")
		playsound(loc, "frontier/code/modules/interaction/sound/interactions/final_f[rand(1, 3)].ogg", 90, 1, 0)
		var/delta = pick(20, 30, 40, 50)
		src.lust -= delta

	H.druggy = 60
	H.multiorgasms += 1
	H.erpcooldown = rand(200, 450)
	if (H.multiorgasms > H.potenzia / 3)
		H.druggy = 300
		H.erpcooldown = 600

proc/flube_splatter(var/target,var/datum/reagent/f_lube/source,var/large)

	if(istype(source,/atom/movable))
		var/atom/movable/A = source
		if(!isturf(A.loc))
			return

	var/obj/effect/decal/cleanable/f_lube/B
	var/decal_type = /obj/effect/decal/cleanable/f_lube/splatter
	var/turf/T = get_turf(target)

// Are we dripping or splattering?
	var/list/drips = list()
// Only a certain number of drips (or one large splatter) can be on a given turf.
	for(var/obj/effect/decal/cleanable/f_lube/drip/drop in T)
		drips |= drop.drips
		qdel(drop)
	if(!large && drips.len < 5)
		decal_type = /obj/effect/decal/cleanable/f_lube/drip

// Find a blood decal or create a new one.
	B = locate(decal_type) in T
	if(!B)
		B = new decal_type(T)

	var/obj/effect/decal/cleanable/f_lube/drip/drop = B
	if(istype(drop) && drips && drips.len && !large)
		drop.overlays |= drips
		drop.drips |= drips