/datum/gear/head/beret/purple
	display_name = "purple beret"
	path = /obj/item/clothing/head/beret/purple
	description = "A stylish, if purple, beret. For personnel that are more inclined towards style than safety."
	flags = null

/datum/gear/head/beret/sec
	display_name = "corporate security beret"
	path = /obj/item/clothing/head/beret/sec
	description = "A beret with the security insignia emblazoned on it. For officers that are more inclined towards style than safety."
	allowed_roles = list(/datum/job/hos, /datum/job/warden, /datum/job/detective, /datum/job/officer)
	flags = null

/datum/gear/head/beret/sec/officer
	display_name = "corporate security officer beret"
	path = /obj/item/clothing/head/beret/sec/corporate/officer
	description = "A beret with an officer's rank emblem. For officers that are more inclined towards style than safety."
	allowed_roles = list(/datum/job/officer)
	flags = null

/datum/gear/head/beret/sec/officer/New()
	..()
	var/berets = list()
	berets["corporate security officer beret"] = /obj/item/clothing/head/beret/sec/corporate/officer
	berets["corporate security officer beret, navy"] = /obj/item/clothing/head/beret/sec/navy/officer
	gear_tweaks += new/datum/gear_tweak/path(berets)

/datum/gear/head/beret/sec/warden
	display_name = "corporate security warden beret"
	path = /obj/item/clothing/head/beret/sec/corporate/officer
	description = "A beret with a warden's rank emblem. For officers that are more inclined towards style than safety."
	allowed_roles = list(/datum/job/warden)
	flags = null

/datum/gear/head/beret/sec/warden/New()
	..()
	var/berets = list()
	berets["corporate security warden beret"] = /obj/item/clothing/head/beret/sec/corporate/warden
	berets["corporate security warden beret, navy"] = /obj/item/clothing/head/beret/sec/navy/warden
	gear_tweaks += new/datum/gear_tweak/path(berets)

/datum/gear/head/beret/sec/hos
	display_name = "corporate security commander beret"
	path = /obj/item/clothing/head/beret/sec/corporate/officer
	description = "A beret with a commander's rank emblem. For officers that are more inclined towards style than safety."
	allowed_roles = list(/datum/job/hos)
	flags = null

/datum/gear/head/beret/sec/hos/New()
	..()
	var/berets = list()
	berets["corporate security commander beret"] = /obj/item/clothing/head/beret/sec/corporate/hos
	berets["corporate security commander beret, navy"] = /obj/item/clothing/head/beret/sec/navy/hos
	gear_tweaks += new/datum/gear_tweak/path(berets)

/datum/gear/head/beret/engineering
	display_name = "corporate engineering beret"
	path = /obj/item/clothing/head/beret/engineering
	description = "A beret with the engineering insignia emblazoned on it. For engineers that are more inclined towards style than safety."
	allowed_roles = list(/datum/job/chief_engineer, /datum/job/senior_engineer, /datum/job/engineer, /datum/job/roboticist, /datum/job/engineer_trainee)
	flags = null