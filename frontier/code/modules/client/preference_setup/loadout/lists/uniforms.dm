/datum/gear/uniform/pmc
	display_name = "private military uniform selection"
	description = "Selection of uniforms provided by private military companies."
	path = /obj/item/clothing/under
	allowed_branches = list(/datum/mil_branch/civilian)

/datum/gear/uniform/pmc/New()
	..()
	var/pmcs = list()
	pmcs += /obj/item/clothing/under/saare
	pmcs += /obj/item/clothing/under/pcrc
	pmcs += /obj/item/clothing/under/pcrcsuit
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(pmcs)