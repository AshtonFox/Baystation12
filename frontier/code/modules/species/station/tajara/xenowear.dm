// Taj clothing
/datum/gear/eyes/medical/tajblind
	display_name = "(Tajara) veil, medical"
	path = /obj/item/clothing/glasses/hud/health/tajblind
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 1

/datum/gear/eyes/meson/tajblind
	display_name = "(Tajara) veil, industrial"
	path = /obj/item/clothing/glasses/meson/prescription/tajblind
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 1

/datum/gear/eyes/security/tajblind
	display_name = "(Tajara) veil, sleek"
	path = /obj/item/clothing/glasses/sunglasses/sechud/tajblind
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 1

/datum/gear/eyes/visors
	display_name = "(Tajara) visor selection"
	path = /obj/item/clothing/glasses/tajvisor
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA)
	cost = 1

/datum/gear/eyes/visors/New()
	..()
	var/visors = list()
	visors["visor type-A (Tajara)"] = /obj/item/clothing/glasses/tajvisor/a
	visors["visor type-B (Tajara)"] = /obj/item/clothing/glasses/tajvisor/b
	visors["visor type-C (Tajara)"] = /obj/item/clothing/glasses/tajvisor/c
	visors["visor type-D (Tajara)"] = /obj/item/clothing/glasses/tajvisor/d
	visors["visor type-E (Tajara)"] = /obj/item/clothing/glasses/tajvisor/e
	visors["visor type-F (Tajara)"] = /obj/item/clothing/glasses/tajvisor/f
	visors["visor type-G (Tajara)"] = /obj/item/clothing/glasses/tajvisor/g
	gear_tweaks += new/datum/gear_tweak/path(visors)

/datum/gear/eyes/medical/tajvisor
	display_name = "(Tajara) visor, medical"
	path = /obj/item/clothing/glasses/hud/health/tajvisor
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 1

/datum/gear/eyes/security/tajvisor
	display_name = "(Tajara) visor, security"
	path = /obj/item/clothing/glasses/sunglasses/sechud/tajvisor
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 1

/datum/gear/eyes/meson/tajvisor
	display_name = "(Tajara) visor, industrial"
	path = /obj/item/clothing/glasses/meson/prescription/tajvisor
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 1

/datum/gear/eyes/meson/tajvisor/hybr
	display_name = "(Tajara) visor, engineering"
	path = /obj/item/clothing/glasses/meson/prescription/tajvisor/hybrid
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 3

/datum/gear/shoes/caligae
	display_name = "(Tajara) caligae"
	path = /obj/item/clothing/shoes/sandal/xeno/caligae
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/shoes/caligae/New()
	..()
	var/caligae = list()
	caligae["no sock"] = /obj/item/clothing/shoes/sandal/xeno/caligae
	caligae["black sock"] = /obj/item/clothing/shoes/sandal/xeno/caligae/black
	caligae["grey sock"] = /obj/item/clothing/shoes/sandal/xeno/caligae/grey
	caligae["white sock"] = /obj/item/clothing/shoes/sandal/xeno/caligae/white
	gear_tweaks += new/datum/gear_tweak/path(caligae)

/datum/gear/head/zhan_scarf
	display_name = "(Tajara) Zhan headscarf"
	path = /obj/item/clothing/head/xeno/scarf
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/accessory/capes
	display_name = "(Tajara) shoulder capes"
	path = /obj/item/clothing/accessory/shouldercape
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/accessory/capes/New()
	..()
	var/capes = list()
	capes["simple cape"] = /obj/item/clothing/accessory/shouldercape/grunt
	capes["decorated cape"] = /obj/item/clothing/accessory/shouldercape/officer
	capes["government cape"] = /obj/item/clothing/accessory/shouldercape/command
	gear_tweaks += new/datum/gear_tweak/path(capes)
