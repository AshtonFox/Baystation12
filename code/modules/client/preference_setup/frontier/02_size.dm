// Define a place to save in character setup
/datum/preferences
	var/size_multiplier = RESIZE_NORMAL

// Definition of the stuff for Sizing
/datum/category_item/player_setup_item/vore/size
	name = "Size"
	sort_order = 2

/datum/category_item/player_setup_item/vore/size/load_character(var/savefile/S)
	S["size_multiplier"]	>> pref.size_multiplier

/datum/category_item/player_setup_item/vore/size/save_character(var/savefile/S)
	S["size_multiplier"]	<< pref.size_multiplier

/datum/category_item/player_setup_item/vore/size/sanitize_character()
	if(pref.size_multiplier == null || pref.size_multiplier < RESIZE_TINY || pref.size_multiplier > RESIZE_HUGE)
		pref.size_multiplier = initial(pref.size_multiplier)

/datum/preferences/copy_to(mob/living/carbon/human/character, is_preview_copy = TRUE)
	..()
	character.size_multiplier			= size_multiplier

/datum/category_item/player_setup_item/vore/size/content(var/mob/user)
	. += "<br>"
	. += "<b>Scale:</b> <a href='?src=\ref[src];size_multiplier=1'>[round(pref.size_multiplier*100)]%</a><br>"
	. += "<br>"

/datum/category_item/player_setup_item/vore/size/OnTopic(var/href, var/list/href_list, var/mob/user)
	if(href_list["size_multiplier"])
		var/new_size = input(user, "Choose your character's size, ranging from 75% to 125%", "Set Size") as num|null
		if (!IsInRange(new_size,75,125))
			pref.size_multiplier = 1
			user << "<span class='notice'>Invalid size.</span>"
			return TOPIC_REFRESH_UPDATE_PREVIEW
		else if(new_size)
			pref.size_multiplier = (new_size/100)
			return TOPIC_REFRESH_UPDATE_PREVIEW
	return ..();
