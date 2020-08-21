/mob/living/carbon/human/Topic(href, href_list)

	if (href_list["refresh"])
		if((machine)&&(in_range(src, usr)))
			show_inv(machine)

	if (href_list["mach_close"])
		var/t1 = text("window=[]", href_list["mach_close"])
		unset_machine()
		src << browse(null, t1)

	if(href_list["item"])
		handle_strip(href_list["item"],usr)

	// VOREStation Start
	if(href_list["ooc_notes"])
		src.Examine_OOC()
	// VOREStation End

	///////Interactions!!///////
	if(href_list["interaction"])

		if (usr.stat == DEAD || usr.stat == UNCONSCIOUS || usr.restrained())
			return

		//CONDITIONS
		var/mob/living/carbon/human/H = usr
		var/mob/living/carbon/human/P = H.partner
		if (!(P in view(H.loc)))
			return
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
		var/mouthfree = !((H.head && (H.check_mouth_coverage())) || (H.wear_mask && (H.check_mouth_coverage())))
		var/mouthfree_p = !((P.head && (P.check_mouth_coverage())) || (P.wear_mask && (P.check_mouth_coverage())))
		var/haspenis = ((H.gender == MALE && H.potenzia > -1 && H.species.genitals))
		var/haspenis_p = ((P.gender == MALE && P.potenzia > -1  && P.species.genitals))
		var/hasvagina = (H.gender == FEMALE && H.species.genitals && H.species.name != "Stok")
		var/hasvagina_p = (P.gender == FEMALE && P.species.genitals && P.species.name != "Stok")
		var/hasanus_p = P.species.anus
		var/hasanus = H.species.anus
		var/isnude = H.is_nude()
		var/isnude_p = P.is_nude()
//		var/ya = "&#255;"


		if (href_list["interaction"] == "bow")
			if (H.interactcooldown <= 2)
				H.visible_message("<B>[H]</B> ��������� <B>[P]</B>.")
				if (istype(P.loc, /obj/structure/closet) && P.loc == H.loc)
					P.visible_message("<B>[H]</B> ��������� <B>[P]</B>.")
				H.interactcooldown += 1
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "pet")
			if (H.interactcooldown <= 2)
				if (!hashands)
					to_chat(H, "<span class='warning'>�� �� ������ ����� �������. � ��� ��� ���!</span>")
				else if ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc))
					if (P != H)
						H.visible_message("<B>[H]</B> [pick("������", "����� �������")] <B>[P]</B>.")
					else
						H.visible_message("<B>[H]</B> [pick("������ ����", "������ ��� ����")].")
					if (istype(P.loc, /obj/structure/closet))
						if (P != H)
							P.visible_message("<B>[H]</B> [pick("������", "����� �������")] <B>[P]</B>.")
						else
							P.visible_message("<B>[H]</B> [pick("������ ����", "������ ��� ����")].")
					H.interactcooldown += 1
				else
					to_chat(H, "<span class='warning'>�� ������� ������.</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "give")
			if(Adjacent(P))
				if (((!istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
					H.give(P)

		else if (href_list["interaction"] == "kiss")
			if (H.interactcooldown <= 2)
				if (!mouthfree && !mouthfree_p)
					to_chat(H, "<span class='warning'>���-�� ������ ��� ��� �������.</span>")
				else if ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc))
					if (H.arousal == 0)
						H.visible_message("<B>[H]</B> ������ <B>[P]</B>.")
						if (istype(P.loc, /obj/structure/closet))
							P.visible_message("<B>[H]</B> ������ <B>[P]</B>.")
					else
						H.visible_message("<B>[H]</B> �������� ������ <B>[P]</B>.")
						if (istype(P.loc, /obj/structure/closet))
							P.visible_message("<B>[H]</B> �������� ������ <B>[P]</B>.")
					H.arousal += 10
					if (P.stat != DEAD && P.stat != UNCONSCIOUS)
						P.arousal += 10
				else if(mouthfree)
					H.visible_message("<B>[H]</B> �������� <B>[P]</B> ��������� �������.")
				H.interactcooldown += 1
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "lick")
			if (H.interactcooldown <= 2)
				if (!mouthfree && !mouthfree_p)
					to_chat(H, "<span class='warning'>���-�� ������ ��� ��� �������.</span>")
				else if ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc))
					if (H.arousal == 0)
						H.visible_message("<B>[H]</B> [H.gender == FEMALE ? "�������" : "������"] <B>[P]</B> � ����.")
						if (istype(P.loc, /obj/structure/closet))
							P.visible_message("<B>[H]</B> [H.gender == FEMALE ? "�������" : "������"] <B>[P]</B> � ����.")
					else
						H.visible_message("<B>[H]</B> ����� ��������� [H.gender == FEMALE ? "�������" : "������"] <B>[P]</B>.")
						if (istype(P.loc, /obj/structure/closet))
							P.visible_message("<B>[H]</B> ����� ��������� [H.gender == FEMALE ? "�������" : "������"] <B>[P]</B>.")
					H.arousal += 10
					if (P.stat != DEAD && P.stat != UNCONSCIOUS)
						P.arousal += 10
					H.interactcooldown += 1
				else
					to_chat(H, "<span class='warning'>�� ������� ������.</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "hug")
			if (H.interactcooldown <= 2)
				if (!hashands)
					to_chat(H, "<span class='warning'>�� �� ������ ����� �������. � ��� ��� ���!</span>")
				else if ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc))
					if (P != H)
						H.visible_message("<B>[H]</B> �������� <B>[P]</B>.")
					else
						H.visible_message("<B>[H]</B> �������� <B>����</B>.")
					if (istype(P.loc, /obj/structure/closet))
						if (P != H)
							P.visible_message("<B>[H]</B> �������� <B>[P]</B>.")
						else
							P.visible_message("<B>[H]</B> �������� <B>����</B>.")
					playsound(loc, 'frontier/code/modules/interaction/sound/interactions/hug.ogg', 50, 1, -1)
					H.interactcooldown += 1
				else
					to_chat(H, "<span class='warning'>�� ������� ������.</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "cheer")
			if (H.interactcooldown <= 2)
				if (!hashands)
					to_chat(H, "<span class='warning'>�� �� ������ ����� �������. � ��� ��� ���!</span>")
				else if ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc))
					if (P != H)
						H.visible_message("<B>[H]</B> ����������� <B>[P]</B> �� �����.")
					else
						H.visible_message("<B>[H]</B> ����������� <B>����</B> �� �����.")
					if (istype(P.loc, /obj/structure/closet))
						if (P != H)
							P.visible_message("<B>[H]</B> ����������� <B>[P]</B> �� �����.")
						else
							P.visible_message("<B>[H]</B> ����������� <B>����</B> �� �����.")
					H.interactcooldown += 1
				else
					to_chat(H, "<span class='warning'>�� ������� ������.</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "five")
			if (H.interactcooldown <= 2)
				if (!hashands)
					to_chat(H, "<span class='warning'>�� �� ������ ����� �������. � ��� ��� ���!</span>")
				else if ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc))
					H.visible_message("<B>[H]</B> ��� <B>[P]</B> ����.")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[H]</B> ��� <B>[P]</B> ����.")
					playsound(loc, 'frontier/code/modules/interaction/sound/interactions/slap.ogg', 50, 1, -1)
					H.interactcooldown += 1
				else
					to_chat(H, "<span class='warning'>�� ������� ������.</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "handshake")
			if (H.interactcooldown <= 2)
				if (!hashands)
					to_chat(H, "<span class='warning'>�� �� ������ ����� �������. � ����-�� �� ��� ��� ���!</span>")
				else if ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc))
					H.visible_message("<B>[H]</B> ��� ���� <B>[P]</B>.")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[H]</B> ��� ���� <B>[P]</B>.")
					H.interactcooldown += 1
				else
					H.visible_message("<B>[H]</B> ���������� [H.gender == FEMALE ? "�������" : "������"] � ������� <B>[P]</B>.")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[H]</B> ���������� [H.gender == FEMALE ? "�������" : "������"] � ������� <B>[P]</B>.")
					H.interactcooldown += 1
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "wave")
			if (H.interactcooldown <= 2)
				if (!(Adjacent(P)) && hashands)
					H.visible_message("<B>[H]</B> ���������� ����� <B>[P]</B>.")
					H.interactcooldown += 1
				else
					H.visible_message("<B>[H]</B> ���������� [H.gender == FEMALE ? "�������" : "������"] � ������� <B>[P]</B>.")
					H.interactcooldown += 1
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")


		else if (href_list["interaction"] == "slap")
			if (H.interactcooldown <= 2)
				if (!hashands)
					to_chat(H, "<span class='warning'>�� �� ������ ����� �������. � ��� ��� ���!</span>")
				else if ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc))
					if (P != H)
						H.visible_message("<span class='danger'>[H] ���� [P] ��������!</span>")
					else
						H.visible_message("<span class='danger'>[H] ���� ���� ��������!</span>")
					if (istype(P.loc, /obj/structure/closet))
						if (P != H)
							P.visible_message("<span class='danger'>[H] ���� [P] ��������!</span>")
						else
							P.visible_message("<span class='danger'>[H] ���� ���� ��������!</span>")
					playsound(loc, 'frontier/code/modules/interaction/sound/interactions/slap.ogg', 50, 1, -1)
					H.do_attack_animation(P)
					H.interactcooldown += 1
				else
					to_chat(H, "<span class='warning'>�� ������� ������.</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "fuckyou")
			if (H.interactcooldown <= 2)
				if (!hashands)
					to_chat(H, "<span class='warning'>�� �� ������ ����� �������. � ��� ��� ���!</span>")
				else
					H.visible_message("<span class='danger'>[H] ���������� [P] ������� �����!</span>")
					if (istype(P.loc, /obj/structure/closet) && P.loc == H.loc)
						P.visible_message("<span class='danger'>[H] ���������� [P] ������� �����!</span>")
					H.interactcooldown += 1
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "knock")
			if (H.interactcooldown <= 2)
				if (!hashands)
					to_chat(H, "<span class='warning'>�� �� ������ ����� �������. � ��� ��� ���!</span>")
				else if ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc))
					if (P != H)
						H.visible_message("<span class='danger'>[H] ���� [P] ������������!</span>")
					else
						H.visible_message("<span class='danger'>[H] ���� ���� ������������!</span>")
					if (istype(P.loc, /obj/structure/closet))
						if (P != H)
							P.visible_message("<span class='danger'>[H] ���� [P] ������������!</span>")
						else
							P.visible_message("<span class='danger'>[H] ���� ���� ������������!</span>")
					playsound(loc, 'sound/weapons/throwtap.ogg', 50, 1, -1)
					H.do_attack_animation(P)
					H.interactcooldown += 1
				else
					to_chat(H, "<span class='warning'>�� ������� ������.</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "spit")
			if (H.interactcooldown <= 2)
				if (!mouthfree)
					to_chat(H, "<span class='warning'>���-�� ������ ��� ��� �������.</span>")
				else if ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc))
					H.visible_message("<span class='danger'>[H] ����� � [P]!</span>")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<span class='danger'>[H] ����� � [P]!</span>")
					H.interactcooldown += 1
				else
					to_chat(H, "<span class='warning'>�� ������� ������.</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "threaten")
			if (H.interactcooldown <= 2)
				if (!hashands)
					to_chat(H, "<span class='warning'>�� �� ������ ����� �������. � ��� ��� ���!</span>")
				else
					H.visible_message("<span class='danger'>[H] ������ [P] �������!</span>")
					if (istype(P.loc, /obj/structure/closet) && H.loc == P.loc)
						P.visible_message("<span class='danger'>[H] ������ [P] �������!</span>")
					H.interactcooldown += 1
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "tongue")
			if (H.interactcooldown <= 2)
				if (!mouthfree)
					to_chat(H, "<span class='warning'>���-�� ������ ��� ��� �������.</span>")
				else
					H.visible_message("<span class='danger'>[H] ���������� [P] ����!</span>")
					if (istype(P.loc, /obj/structure/closet) && H.loc == P.loc)
						P.visible_message("<span class='danger'>[H] ���������� [P] ����!</span>")
					H.interactcooldown += 1
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "assslap")
			if (H.interactcooldown <= 2)
				if (!hashands)
					to_chat(H, "<span class='warning'>�� �� ������ ����� �������. � ��� ��� ���!</span>")
				else if (((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hasanus_p)
					if (P != H)
						H.visible_message("<span class='danger'>[H] ������� [P] �� �������!</span>")
					else
						H.visible_message("<span class='danger'>[H] ������� ���� �� �������!</span>")
					if (istype(P.loc, /obj/structure/closet))
						if (P != H)
							P.visible_message("<span class='danger'>[H] ������� [P] �� �������!</span>")
						else
							P.visible_message("<span class='danger'>[H] ������� ���� �� �������!</span>")
					playsound(loc, 'frontier/code/modules/interaction/sound/interactions/slap.ogg', 50, 1, -1)
					H.interactcooldown += 1
				else
					to_chat(H, "<span class='warning'>�� ������� ������, ���� � [P] ��� ������ ����� ����.</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")

		else if (href_list["interaction"] == "pull")
			if (H.interactcooldown <= 2)
				if (!hashands || H.restrained())
					to_chat(H, "<span class='warning'>�� �� ������ ����� �������. � ��� ��� ���, ���� ��� �������!</span>")
				else if ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc))
					if (prob(30))
						H.visible_message("<span class='danger'>[H] ������ [P] �� �����!</span>")
						if (istype(P.loc, /obj/structure/closet))
							P.visible_message("<span class='danger'>[H] ������ [P] �� �����!</span>")
					else
						H.visible_message("<B>[H]</B> �������� ������� <B>[P]</B> �� �����!")
						if (istype(P.loc, /obj/structure/closet))
							P.visible_message("<B>[H]</B> �������� ������� <B>[P]</B> �� �����!")
					H.interactcooldown += 1
				else
					to_chat(H, "<span class='warning'>�� ������� ������.</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ��� ������� �����.</span>")


		else if (href_list["interaction"] == "vaglick")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && isnude_p && mouthfree && hasvagina_p && P.species.name != "Teshari")
				H.fuck(H, P, "vaglick")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "facesitting")
			if (H.loc == P.loc && isnude && mouthfree_p && hasvagina && H.species.name != "Teshari")
				if (H.erpcooldown == 0)
					H.fuck(H, P, "facesitting")
				else
					to_chat(H, "<span class='warning'>�� �� ��� ������ � �������� ����. ����� ��������� [DisplayTimeText(H.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "forcelick")
			if (((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && isnude && mouthfree_p && hasvagina && H.species.name != "Teshari")
				if (H.erpcooldown == 0)
					H.fuck(H, P, "forcelick")
				else
					to_chat(H, "<span class='warning'>�� �� ��� ������ � �������� ����. ����� ��������� [DisplayTimeText(H.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "asslick")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && isnude_p && mouthfree && hasanus_p && P.species.name != "Diona")
				//H.fuck(H, P, "asslick")
				usr.visible_message("<font color=purple>[H] ���������� ���� [P].</font>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "fingering")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && isnude_p && hashands && hasvagina_p && P.species.name != "Teshari")
				if (P == H && H.erpcooldown != 0)
					to_chat(H, "<span class='warning'>�� �� ��� ������ � �������� ����. ����� ��������� [DisplayTimeText(H.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
				else
					H.fuck(H, P, "fingering")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "jerk")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && isnude_p && hashands && haspenis_p)
				if (P.erpcooldown == 0)
					H.fuck(H, P, "jerk")
				else
					if (P == H)
						to_chat(H, "<span class='warning'>�� �� ��� ������ � �������� ����. ����� ��������� [DisplayTimeText(H.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
					else
						to_chat(H, "<span class='warning'>[P.gender==FEMALE ? "���" : "��"] �� ��� [P.gender==FEMALE ? "������" : "�����"] � �������� ����. ����� ��������� [DisplayTimeText(P.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "blowjob")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && isnude_p && mouthfree && haspenis_p)
				if (P.erpcooldown == 0)
					H.fuck(H, P, "blowjob")
				else
					to_chat(H, "<span class='warning'>[P.gender==FEMALE ? "���" : "��"] �� ��� [P.gender==FEMALE ? "������" : "�����"] � �������� ����. ����� ��������� [DisplayTimeText(P.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "anal")
			if (((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && isnude_p && isnude && haspenis && hasanus_p && P.species.name != "Diona")
				if (H.erpcooldown == 0)
					if (H.potenzia > 0)
						H.fuck(H, P, "anal")
				else
					to_chat(H, "<span class='warning'>�� �� ��� ������ � �������� ����. ����� ��������� [DisplayTimeText(H.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "vaginal")
			if (((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && isnude_p && isnude && haspenis && hasvagina_p && P.species.name != "Teshari")
				if (H.erpcooldown == 0)
					if (H.potenzia > 0)
						H.fuck(H, P, "vaginal")
				else
					to_chat(H, "<span class='warning'>�� �� ��� ������ � �������� ����. ����� ��������� [DisplayTimeText(H.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "oral")
			if (((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && isnude && mouthfree_p && haspenis && P.species.name != "Diona")
				if (H.erpcooldown == 0)
					if (H.potenzia > 0)
						H.fuck(H, P, "oral")
				else
					to_chat(H, "<span class='warning'>�� �� ��� ������ � �������� ����. ����� ��������� [DisplayTimeText(H.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "mount")
			if (H.loc == P.loc && isnude && isnude_p && haspenis_p && hasvagina && H.species.name != "Teshari")
				if (H.erpcooldown == 0)
					if (P.erpcooldown == 0)
						if (P.potenzia > 0)
							H.fuck(H, P, "mount")
					else
						to_chat(H, "<span class='warning'>[P.gender==FEMALE ? "���" : "��"] �� ��� [P.gender==FEMALE ? "������" : "�����"] � �������� ����. ����� ��������� [DisplayTimeText(P.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
				else
					to_chat(H, "<span class='warning'>�� �� ��� ������ � �������� ����. ����� ��������� [DisplayTimeText(H.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "rub")
			if (H.loc == P.loc && isnude && isnude_p && haspenis_p && hasvagina && H.species.name != "Teshari")
				if (H.erpcooldown == 0)
					if (P.erpcooldown == 0)
						if (P.potenzia > 0)
							H.fuck(H, P, "rub")
							H.interactcooldown += 1
					else
						to_chat(H, "<span class='warning'>[P.gender==FEMALE ? "���" : "��"] �� ��� [P.gender==FEMALE ? "������" : "�����"] � �������� ����. ����� ��������� [DisplayTimeText(P.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
				else
					to_chat(H, "<span class='warning'>�� �� ��� ������ � �������� ����. ����� ��������� [DisplayTimeText(H.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "tribadism")
			if (H.loc == P.loc && isnude && isnude_p && hasvagina_p && hasvagina && H.species.name != "Teshari")
				if (H.erpcooldown == 0)
					H.fuck(H, P, "tribadism")
				else
					to_chat(H, "<span class='warning'>�� �� ��� ������ � �������� ����. ����� ��������� [DisplayTimeText(H.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "petting")
			if (Adjacent(P) && !isnude_p && (hasvagina_p || haspenis_p) && hashands && H.species.name != "Teshari")
				if (P.erpcooldown == 0)
					H.fuck(H, P, "petting")
				else
					to_chat(H, "<span class='warning'>[P.gender==FEMALE ? "���" : "��"] �� ��� [P.gender==FEMALE ? "������" : "�����"] � �������� ����. ����� ��������� [DisplayTimeText(P.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")

		else if (href_list["interaction"] == "assfuck")
			if (H.loc == P.loc && isnude && isnude_p && haspenis_p && hasanus)
				if (H.erpcooldown == 0)
					if (P.erpcooldown == 0)
						if (P.potenzia > 0)
							H.fuck(H, P, "assfuck")
					else
						to_chat(H, "<span class='warning'>[P.gender==FEMALE ? "���" : "��"] �� ��� [P.gender==FEMALE ? "������" : "�����"] � �������� ����. ����� ��������� [DisplayTimeText(P.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
				else
					to_chat(H, "<span class='warning'>�� �� ��� ������ � �������� ����. ����� ��������� [DisplayTimeText(H.erpcooldown * 20, TRUE)], ����� ��� ��� ����������!</span>")
			else
				to_chat(H, "<span class='warning'>�� ������� ������ ��� ���-�� ������ ��� ��� �������.</span>")
