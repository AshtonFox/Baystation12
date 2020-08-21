//Interact with yourself and others (2 in 1)
/mob/living/carbon/human/verb/selfinteract(mob/user as mob)
	set name = "Interact"
	set category = "IC"
	partner = user
	make_interaction(machine)

/mob/living/carbon/human/verb/arouse()
	set name = "Arouse-Self"
	set category = "Abilities"
	set desc = "Use this to get aroused just with your thoughts... do not abuse by the way. +10 per click."
	var/ya = "&#255;"
	if(gender != NEUTER && arousal <= med_arousal)
		to_chat(src, "<span class='warning'>�� ��������� ���� ����� ���-��, ��� ��� ����������...</span>")
		src.arousal += 10
	else if(gender != NEUTER)
		to_chat(src, "<span class='warning'>�� ��� ������� ����������, ����� ���������������[ya] ������ ����!</span>")
	else
		to_chat(src, "<span class='warning'>� ��� ��� ����������� ������� ���������! ��� �� ��������� ��� ����������?</span>")