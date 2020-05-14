//Override upstream's voidsuit stuff here


//This override is to allow our snowflake species to use voidsuits. Keep this updated with whatever new species you add.
/obj/item/clothing/head/helmet/space/void/Initialize()
	. = ..()
	sprite_sheets |= list(
		SPECIES_AKULA = 'icons/mob/species/akula/onmob_head_helmet_akula.dmi',
		SPECIES_VULP = 'icons/mob/species/vulpkanin/onmob_head_helmet_vulpkanin.dmi',
		SPECIES_VASS = 'icons/mob/onmob/onmob_head.dmi',
		SPECIES_TAJARA = 'icons/mob/species/tajaran/onmob_head_helmet_tajaran.dmi',
		SPECIES_OLDUNATHI = 'icons/mob/species/unathi/onmob_head_helmet_unathi.dmi',
		SPECIES_SERGAL = 'icons/mob/species/sergal/onmob_head_helmet_sergal.dmi',
		SPECIES_NORTHERN = 'icons/mob/species/sergal/onmob_head_helmet_sergal.dmi',
		SPECIES_EASTERN = 'icons/mob/species/sergal/onmob_head_helmet_sergal.dmi',
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_head_helmet_unathi.dmi',
		SPECIES_RESOMI = 'frontier/icons/mob/species/resomi/onmob_head_resomi.dmi',
		SPECIES_SKRELL = 'icons/mob/species/skrell/onmob_head_skrell.dmi'
		)
	sprite_sheets_obj |= list(
		SPECIES_AKULA = 'icons/obj/clothing/species/akula/obj_head_akula.dmi',
		SPECIES_VULP = 'icons/obj/clothing/species/vulpkanin/obj_head_vulpkanin.dmi',
		SPECIES_VASS = 'icons/obj/clothing/obj_head.dmi',
		SPECIES_TAJARA = 'icons/obj/clothing/species/tajaran/obj_head_tajaran.dmi',
		SPECIES_OLDUNATHI = 'icons/obj/clothing/species/unathi/obj_head_unathi.dmi',
		SPECIES_SERGAL = 'icons/obj/clothing/species/sergal/obj_head_sergal.dmi',
		SPECIES_NORTHERN = 'icons/obj/clothing/species/sergal/obj_head_sergal.dmi',
		SPECIES_EASTERN = 'icons/obj/clothing/species/sergal/obj_head_sergal.dmi',
		SPECIES_UNATHI = 'icons/obj/clothing/species/unathi/obj_head_unathi.dmi',
		SPECIES_RESOMI = 'frontier/icons/obj/clothing/species/resomi/obj_head_resomi.dmi',
		SPECIES_SKRELL = 'icons/obj/clothing/species/skrell/obj_head_skrell.dmi'
		)

/obj/item/clothing/suit/space/void/Initialize()
	. = ..()
	sprite_sheets = list(
		SPECIES_AKULA = 'icons/mob/species/akula/onmob_suit_akula.dmi',
		SPECIES_VULP = 'icons/mob/species/vulpkanin/onmob_suit_vulpkanin.dmi',
		SPECIES_VASS = 'icons/mob/onmob/onmob_suit.dmi',
		SPECIES_TAJARA = 'icons/mob/species/tajaran/onmob_suit_tajaran.dmi',
		SPECIES_OLDUNATHI = 'icons/mob/species/unathi/onmob_suit_unathi.dmi',
		SPECIES_SERGAL = 'icons/mob/species/sergal/onmob_suit_sergal.dmi',
		SPECIES_NORTHERN = 'icons/mob/species/sergal/onmob_suit_sergal.dmi',
		SPECIES_EASTERN = 'icons/mob/species/sergal/onmob_suit_sergal.dmi',
		SPECIES_UNATHI = 'icons/mob/species/unathi/onmob_suit_unathi.dmi',
		SPECIES_RESOMI = 'frontier/icons/mob/species/resomi/onmob_suit_resomi.dmi',
		SPECIES_SKRELL = 'icons/mob/species/skrell/onmob_suit_skrell.dmi'
		)
	sprite_sheets_obj = list(
		SPECIES_AKULA = 'icons/obj/clothing/species/akula/obj_suit_akula.dmi',
		SPECIES_VULP = 'icons/obj/clothing/species/vulpkanin/obj_suit_vulpkanin.dmi',
		SPECIES_VASS = 'icons/obj/clothing/obj_suit.dmi',
		SPECIES_TAJARA = 'icons/obj/clothing/species/tajaran/obj_suit_tajaran.dmi',
		SPECIES_OLDUNATHI = 'icons/obj/clothing/species/unathi/obj_suit_unathi.dmi',
		SPECIES_SERGAL = 'icons/obj/clothing/species/sergal/obj_suit_sergal.dmi',
		SPECIES_NORTHERN = 'icons/obj/clothing/species/sergal/obj_suit_sergal.dmi',
		SPECIES_EASTERN = 'icons/obj/clothing/species/sergal/obj_suit_sergal.dmi',
		SPECIES_RESOMI = 'frontier/icons/obj/clothing/species/resomi/obj_suit_resomi.dmi',
		SPECIES_UNATHI = 'icons/obj/clothing/species/unathi/obj_suit_unathi.dmi',
		SPECIES_SKRELL = 'icons/obj/clothing/species/skrell/obj_suit_skrell.dmi'
		)

/* SHIT DOESNT WORK FOR WHATEVER REASON ITS CURSED
/obj/item/clothing/head/helmet/space/void/excavation	//This fixes a literal year-old bug from upstream. Should probably bring it to bay directly but eh.
	icon = 'modular_mithra/icons/mob/onmob/head.dmi'	//This .dmi consists of only one thing: the properly renamed iconstate of the excavation helmet.
*/
