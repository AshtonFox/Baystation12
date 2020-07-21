//Material earrings
/obj/item/clothing/ears/earring
	name = "earring"
	desc = "An earring of some kind."
	icon = 'icons/obj/clothing/obj_ears.dmi'
	gender = PLURAL
	species_restricted = list(SPECIES_HUMAN, SPECIES_HUMAN2, SPECIES_CUSTOM, SPECIES_PROMETHEAN)

/obj/item/clothing/ears/earring/stud
	name = "pearl stud earrings"
	desc = "A pair of small stud earrings."
	icon_state = "ear_stud"
	color = "#eae0c8"

/obj/item/clothing/ears/earring/stud/glass
	name = "glass stud earrings"
	color = "#00e1ff"

/obj/item/clothing/ears/earring/stud/wood
	name = "wood stud earrings"
	color = "#824b28"

/obj/item/clothing/ears/earring/stud/iron
	name = "iron stud earrings"
	color = "#5c5454"

/obj/item/clothing/ears/earring/stud/steel
	name = "steel stud earrings"
	color = "#666666"

/obj/item/clothing/ears/earring/stud/silver
	name = "silver stud earrings"
	color = "#d1e6e3"

/obj/item/clothing/ears/earring/stud/gold
	name = "gold stud earrings"
	color = "#edd12f"

/obj/item/clothing/ears/earring/stud/platinum
	name = "platinum stud earrings"
	color = "#9999ff"

/obj/item/clothing/ears/earring/stud/diamond
	name = "diamond stud earrings"
	color = "#00ffe1"

/obj/item/clothing/ears/earring/dangle
	name = "pearl dangle earrings"
	desc = "A pair of small dangle earrings."
	icon_state = "ear_dangle"
	color = "#eae0c8"

/obj/item/clothing/ears/earring/dangle/glass
	name = "glass dangle earrings"
	color = "#00e1ff"

/obj/item/clothing/ears/earring/dangle/wood
	name = "wood dangle earrings"
	color = "#824b28"

/obj/item/clothing/ears/earring/dangle/iron
	name = "iron dangle earrings"
	color = "#5c5454"

/obj/item/clothing/ears/earring/dangle/steel
	name = "steel dangle earrings"
	color = "#666666"

/obj/item/clothing/ears/earring/dangle/silver
	name = "silver dangle earrings"
	color = "#d1e6e3"

/obj/item/clothing/ears/earring/dangle/gold
	name = "gold dangle earrings"
	color = "#edd12f"

/obj/item/clothing/ears/earring/dangle/platinum
	name = "platinum dangle earrings"
	color = "#9999ff"

/obj/item/clothing/ears/earring/dangle/diamond
	name = "diamond dangle earrings"
	color = "#00ffe1"

//Vulpkanin
/obj/item/clothing/ears/earring/vulpkanin
	name = "vulpkanin earring"
	desc = "An earring of some kind."
	icon = 'icons/obj/clothing/species/vulpkanin/obj_ears_vulp.dmi'
	gender = PLURAL
	species_restricted = list(SPECIES_VULP)
	sprite_sheets = list(
		SPECIES_VULP = 'icons/mob/species/vulpkanin/onmob_ears_vulpkanin.dmi')

/obj/item/clothing/ears/earring/vulpkanin/stud
	name = "vulpkanin pearl stud earrings"
	desc = "A pair of small vulpkanin stud earrings."
	icon_state = "ear_stud_p1"
	color = "#eae0c8"

/obj/item/clothing/ears/earring/vulpkanin/stud/attack_self()
	toggle()

/obj/item/clothing/ears/earring/vulpkanin/stud/verb/toggle()
	set category = "Object"
	set name = "Adjust Earrings"
	set src in usr

	if(!CanPhysicallyInteract(usr))
		return

	var/list/variant_names = list(
		"Vulpkanin Ears (Variant 1)",
		"Vulpkanin Ears (Variant 2)",
		"Vulpkanin Ears (Variant 3)",
		"Vulpkanin Ears (Variant 4)",
		"Vulpkanin Ears (Variant 5)",
		"Vulpkanin Ears (Variant 6)",
		"Vulpkanin Ears (Variant 7)",
		"Vulpkanin Ears (Variant 8)",
		"Vulpkanin Ears (Variant 9)",
		"Vulpkanin Ears (Variant 10)",
		"Vulpkanin Ears (Variant 11)",
		"Vulpkanin Ears (Variant 12)",
		"Vulpkanin Ears (Variant 13)",
		"Wolf Ears (Variant 1)",
		"Wolf Ears (Variant 2)"
	)

	var/new_icon_type = input("Select icon type:", "Icon type", "Vulpkanin Ears (Variant 1)") as null|anything in variant_names
	if(!new_icon_type)
		return

	switch(new_icon_type)
		if("Vulpkanin Ears (Variant 1)")
			icon_state = "ear_stud_p1"
		if("Vulpkanin Ears (Variant 2)")
			icon_state = "ear_stud_p2"
		if("Vulpkanin Ears (Variant 3)")
			icon_state = "ear_stud_p3"
		if("Vulpkanin Ears (Variant 4)")
			icon_state = "ear_stud_p4"
		if("Vulpkanin Ears (Variant 5)")
			icon_state = "ear_stud_p5"
		if("Vulpkanin Ears (Variant 6)")
			icon_state = "ear_stud_p6"
		if("Vulpkanin Ears (Variant 7)")
			icon_state = "ear_stud_p7"
		if("Vulpkanin Ears (Variant 8)")
			icon_state = "ear_stud_p8"
		if("Vulpkanin Ears (Variant 9)")
			icon_state = "ear_stud_p9"
		if("Vulpkanin Ears (Variant 10)")
			icon_state = "ear_stud_p10"
		if("Vulpkanin Ears (Variant 11)")
			icon_state = "ear_stud_p11"
		if("Vulpkanin Ears (Variant 12)")
			icon_state = "ear_stud_p12"
		if("Vulpkanin Ears (Variant 13)")
			icon_state = "ear_stud_p13"
		if("Wolf Ears (Variant 1)")
			icon_state = "ear_stud_wolf_p1"
		if("Wolf Ears (Variant 2)")
			icon_state = "ear_stud_wolf_p2"
	update_clothing_icon()

/obj/item/clothing/ears/earring/vulpkanin/stud/glass
	name = "vulpkanin glass stud earrings"
	color = "#00e1ff"

/obj/item/clothing/ears/earring/vulpkanin/stud/wood
	name = "vulpkanin wood stud earrings"
	color = "#824b28"

/obj/item/clothing/ears/earring/vulpkanin/stud/iron
	name = "vulpkanin iron stud earrings"
	color = "#5c5454"

/obj/item/clothing/ears/earring/vulpkanin/stud/steel
	name = "vulpkanin steel stud earrings"
	color = "#666666"

/obj/item/clothing/ears/earring/vulpkanin/stud/silver
	name = "vulpkanin silver stud earrings"
	color = "#d1e6e3"

/obj/item/clothing/ears/earring/vulpkanin/stud/gold
	name = "vulpkanin gold stud earrings"
	color = "#edd12f"

/obj/item/clothing/ears/earring/vulpkanin/stud/platinum
	name = "vulpkanin platinum stud earrings"
	color = "#9999ff"

/obj/item/clothing/ears/earring/vulpkanin/stud/diamond
	name = "vulpkanin diamond stud earrings"
	color = "#00ffe1"

/obj/item/clothing/ears/earring/vulpkanin/dangle
	name = "vulpkanin pearl dangle earrings"
	desc = "A pair of small dangle earrings."
	icon_state = "ear_dangle_p1"
	color = "#eae0c8"

/obj/item/clothing/ears/earring/vulpkanin/dangle/attack_self()
	toggle()

/obj/item/clothing/ears/earring/vulpkanin/dangle/verb/toggle()
	set category = "Object"
	set name = "Adjust Earrings"
	set src in usr

	if(!CanPhysicallyInteract(usr))
		return

	var/list/variant_names = list(
		"Vulpkanin Ears (Variant 1)",
		"Vulpkanin Ears (Variant 2)",
		"Wolf Ears (Variant 1)",
		"Wolf Ears (Variant 2)"
	)

	var/new_icon_type = input("Select icon type:", "Icon type", "Vulpkanin Ears (Variant 1)") as null|anything in variant_names
	if(!new_icon_type)
		return

	switch(new_icon_type)
		if("Vulpkanin Ears (Variant 1)")
			icon_state = "ear_dangle_p1"
		if("Vulpkanin Ears (Variant 2)")
			icon_state = "ear_dangle_p2"
		if("Wolf Ears (Variant 1)")
			icon_state = "ear_dangle_wolf_p1"
		if("Wolf Ears (Variant 2)")
			icon_state = "ear_dangle_wolf_p2"
	update_clothing_icon()

/obj/item/clothing/ears/earring/vulpkanin/dangle/glass
	name = "vulpkanin glass dangle earrings"
	color = "#00e1ff"

/obj/item/clothing/ears/earring/vulpkanin/dangle/wood
	name = "vulpkanin wood dangle earrings"
	color = "#824b28"

/obj/item/clothing/ears/earring/vulpkanin/dangle/iron
	name = "vulpkanin iron dangle earrings"
	color = "#5c5454"

/obj/item/clothing/ears/earring/vulpkanin/dangle/steel
	name = "vulpkanin steel dangle earrings"
	color = "#666666"

/obj/item/clothing/ears/earring/vulpkanin/dangle/silver
	name = "vulpkanin silver dangle earrings"
	color = "#d1e6e3"

/obj/item/clothing/ears/earring/vulpkanin/dangle/gold
	name = "vulpkanin gold dangle earrings"
	color = "#edd12f"

/obj/item/clothing/ears/earring/vulpkanin/dangle/platinum
	name = "vulpkanin platinum dangle earrings"
	color = "#9999ff"

/obj/item/clothing/ears/earring/vulpkanin/dangle/diamond
	name = "vulpkanin diamond dangle earrings"
	color = "#00ffe1"

// Tajaran
/obj/item/clothing/ears/earring/tajaran
	name = "earring"
	desc = "An earring of some kind."
	icon = 'icons/obj/clothing/species/tajaran/obj_ears_tajaran.dmi'
	gender = PLURAL
	species_restricted = list(SPECIES_TAJ)
	sprite_sheets = list(
		SPECIES_TAJ = 'icons/mob/species/tajaran/onmob_ears_tajaran.dmi')

/obj/item/clothing/ears/earring/tajaran/stud
	name = "tajaran pearl stud earrings"
	desc = "A pair of small tajaran stud earrings."
	icon_state = "ear_stud_p1"
	color = "#eae0c8"

/obj/item/clothing/ears/earring/tajaran/stud/attack_self()
	toggle()

/obj/item/clothing/ears/earring/tajaran/stud/verb/toggle()
	set category = "Object"
	set name = "Adjust Earrings"
	set src in usr

	if(!CanPhysicallyInteract(usr))
		return

	var/list/variant_names = list(
		"Variant 1",
		"Variant 2",
		"Variant 3",
		"Variant 4",
		"Variant 5",
		"Variant 6",
		"Variant 7"
	)

	var/new_icon_type = input("Select icon type:", "Icon type", "Variant 1") as null|anything in variant_names
	if(!new_icon_type)
		return

	switch(new_icon_type)
		if("Variant 1")
			icon_state = "ear_stud_p1"
		if("Variant 2")
			icon_state = "ear_stud_p2"
		if("Variant 3")
			icon_state = "ear_stud_p3"
		if("Variant 4")
			icon_state = "ear_stud_p4"
		if("Variant 5")
			icon_state = "ear_stud_p5"
		if("Variant 6")
			icon_state = "ear_stud_p6"
		if("Variant 7")
			icon_state = "ear_stud_p7"
	update_clothing_icon()

/obj/item/clothing/ears/earring/tajaran/stud/glass
	name = "tajaran glass stud earrings"
	color = "#00e1ff"

/obj/item/clothing/ears/earring/tajaran/stud/wood
	name = "tajaran wood stud earrings"
	color = "#824b28"

/obj/item/clothing/ears/earring/tajaran/stud/iron
	name = "tajaran iron stud earrings"
	color = "#5c5454"

/obj/item/clothing/ears/earring/tajaran/stud/steel
	name = "tajaran steel stud earrings"
	color = "#666666"

/obj/item/clothing/ears/earring/tajaran/stud/silver
	name = "tajaran silver stud earrings"
	color = "#d1e6e3"

/obj/item/clothing/ears/earring/tajaran/stud/gold
	name = "tajaran gold stud earrings"
	color = "#edd12f"

/obj/item/clothing/ears/earring/tajaran/stud/platinum
	name = "tajaran platinum stud earrings"
	color = "#9999ff"

/obj/item/clothing/ears/earring/tajaran/stud/diamond
	name = "tajaran diamond stud earrings"
	color = "#00ffe1"

/obj/item/clothing/ears/earring/tajaran/dangle
	name = "tajaran pearl dangle earrings"
	desc = "A pair of small dangle earrings."
	icon_state = "ear_dangle_p1"
	color = "#eae0c8"

/obj/item/clothing/ears/earring/tajaran/dangle/glass
	name = "tajaran glass dangle earrings"
	color = "#00e1ff"

/obj/item/clothing/ears/earring/tajaran/dangle/wood
	name = "tajaran wood dangle earrings"
	color = "#824b28"

/obj/item/clothing/ears/earring/tajaran/dangle/iron
	name = "tajaran iron dangle earrings"
	color = "#5c5454"

/obj/item/clothing/ears/earring/tajaran/dangle/steel
	name = "tajaran steel dangle earrings"
	color = "#666666"

/obj/item/clothing/ears/earring/tajaran/dangle/silver
	name = "tajaran silver dangle earrings"
	color = "#d1e6e3"

/obj/item/clothing/ears/earring/tajaran/dangle/gold
	name = "tajaran gold dangle earrings"
	color = "#edd12f"

/obj/item/clothing/ears/earring/tajaran/dangle/platinum
	name = "tajaran platinum dangle earrings"
	color = "#9999ff"

/obj/item/clothing/ears/earring/tajaran/dangle/diamond
	name = "tajaran diamond dangle earrings"
	color = "#00ffe1"