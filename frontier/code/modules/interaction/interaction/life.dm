/mob/living/carbon/human/handle_regular_status_updates()
	..()
	//SSD check, if a logged player is awake put them back to sleep!
	if(ssd_check() && species.get_ssd(src) || player_triggered_sleeping)
		Sleeping(2)
	if(stat == DEAD)	//DEAD. BROWN BREAD. SWIMMING WITH THE SPESS CARP
		blinded = 1
		silent = 0
	else				//ALIVE. LIGHTS ARE ON
		updatehealth()	//TODO

		if(handle_death_check())
			death()
			blinded = 1
			silent = 0
			return 1

	handle_lust() //decreases player's lust, working as erp cooldown
	handle_arousal() //decreases player's arousal, just making them to calm down

	return 1
