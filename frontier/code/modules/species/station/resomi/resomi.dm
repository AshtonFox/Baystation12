#define LANGUAGE_RESOMI			"Schechi"
//#define LANGUAGE_PRESOMI			"Primitive schechi"

// Resomi cultures.
#define CULTURE_RESOMI_BIRDCAGE   		"Birdcage, \"Born in the void\""
#define CULTURE_RESOMI_EREMUS     		"Eremus, Eremusianin"
#define CULTURE_RESOMI_ASRANDA    		"Asranda, Randian"
#define CULTURE_RESOMI_SAVEEL     		"Saveel, Sav"
#define CULTURE_RESOMI_REFUGEE 			"Imperial refugee"
#define CULTURE_RESOMI_NEWGENERATION	"New generation"
#define CULTURE_RESOMI_LOSTCOLONYRICH  "A native of a thriving lost colony"
#define CULTURE_RESOMI_LOSTCOLONYPOOR  "A native of a impoverished lost colony"


#define HOME_SYSTEM_RESOMI_BIRDCAGE      	"Birdcage (Colchis Habitat)"
#define HOME_SYSTEM_RESOMI_EREMUS        	"Eremus"
#define HOME_SYSTEM_RESOMI_TIAMATH       "Tiamat"
#define HOME_SYSTEM_RESOMI_ASRANDA      	"Asranda"
#define HOME_SYSTEM_RESOMI_SAVEEL           "Zer'een (Saveel)"
#define HOME_SYSTEM_RESOMI_LOST_COLONY      "Unknown independent colony"
#define HOME_SYSTEM_RESOMI_REFUGEE_COLONY   "Unknown Independent Refugee Colony"
#define HOME_SYSTEM_RESOMI_HOMELESS 		"None"
#define HOME_SYSTEM_RESOMI_IMPER_COLONY  "Unknown Imperial colony"

#define RELIGION_RESOMI_CHOSEN    "Faith of the Chosen"
#define RELIGION_RESOMI_EMPEROR   "Cult of the Emperor"
#define RELIGION_RESOMI_MOUNTAIN  "Echos of the Mountain"
#define RELIGION_RESOMI_SKIES     "Lights of the Skies"


#include "accessory_resomi.dm"
#include "cloak_resomi.dm"
#include "glasses_resomi.dm"
#include "shoes_resomi.dm"
#include "suit.dm"
#include "under_resomi.dm"
#include "loadout.dm"
#include "robolimbs.dm"

#include "cultures_resomi.dm"
#include "factions_resomi.dm"
#include "locations_resomi.dm"
#include "organs.dm"
#include "powers.dm"
#include "religion_resomi.dm"
#include "language.dm"

/datum/species/resomi
	name = SPECIES_RESOMI
	name_plural = "Resomii"
	description = "A race of feathered raptors who developed on a cold world, almost \
	outside of the Goldilocks zone. Extremely fragile, they developed hunting skills \
	that emphasized taking out their prey without themselves getting hit. They are an \
	advanced culture on good terms with Skrellian and Human interests."

	min_age = 15
	max_age = 45
	hidden_from_codex = FALSE
	health_hud_intensity = 3

	blood_color = "#d514f7"
	flesh_color = "#5f7bb0"
	base_color = "#001144"
	tail = "resomitail"
	tail_hair = "feathers"
	strength = STR_HIGH
	reagent_tag = IS_RESOMI
	breath_pressure = 12

	move_trail = /obj/effect/decal/cleanable/blood/tracks/paw

	icobase = 			'frontier/code/modules/species/station/resomi/sprite_body/body.dmi'
	deform = 			'frontier/code/modules/species/station/resomi//sprite_body/body.dmi'
	damage_overlays = 	'frontier/code/modules/species/station/resomi//sprite_body/damage_overlay.dmi'
	damage_mask = 		'frontier/code/modules/species/station/resomi//sprite_body/damage_mask.dmi'
	blood_mask = 		'frontier/code/modules/species/station/resomi//sprite_body/blood_mask.dmi'
	preview_icon =		'frontier/code/modules/species/station/resomi//sprite_body/preview.dmi'
	husk_icon = 		'frontier/code/modules/species/station/resomi//sprite_body/husk.dmi'

	slowdown = -0.8 //speed fix?

	darksight_tint = DARKTINT_GOOD
	flash_mod = 2
	total_health = 150
	brute_mod = 1.35
	burn_mod =  1.35
	metabolism_mod = 2.0
	mob_size = MOB_SMALL
	holder_type = /obj/item/weapon/holder/human
	light_sensitive = 6
	gluttonous = GLUT_TINY
	blood_volume = 280
	hunger_factor = DEFAULT_HUNGER_FACTOR * 3
	taste_sensitivity = TASTE_SENSITIVE
	pulse_rate_mod = 1.5
	body_temperature = 314.15

	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED | SPECIES_NO_FBP_CONSTRUCTION | SPECIES_NO_FBP_CHARGEN
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_A_SKIN_TONE
	bump_flag = MONKEY
	swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags = MONKEY|SLIME|SIMPLE_ANIMAL|ALIEN

	cold_level_1 = 180
	cold_level_2 = 130
	cold_level_3 = 70
	heat_level_1 = 320
	heat_level_2 = 370
	heat_level_3 = 600
	heat_discomfort_level = 292
	heat_discomfort_strings = list(
		"Your feathers prickle in the heat.",
		"You feel uncomfortably warm.",
		)
	cold_discomfort_level = 200
	cold_discomfort_strings = list(
		"You can't feel your paws because of the cold.",
		"You feel sluggish and cold.",
		"Your feathers bristle against the cold.")
	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/resomi),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/resomi),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/resomi),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/resomi)
		)

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver/resomi,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys/resomi,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes/resomi
		)

	unarmed_types = list(
		/datum/unarmed_attack/bite/sharp,
		/datum/unarmed_attack/claws,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/stomp/weak
		)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/resomi_sonar_ping,
		/mob/living/proc/toggle_pass_table
		)

	descriptors = list(
		/datum/mob_descriptor/height = -8,
		/datum/mob_descriptor/build = -8
		)

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_RESOMI_REFUGEE,
			CULTURE_RESOMI_NEWGENERATION,
//			CULTURE_RESOMI_BIRDCAGE,
			CULTURE_RESOMI_EREMUS,
			CULTURE_RESOMI_ASRANDA,
			CULTURE_HUMAN_LUNAPOOR,
			CULTURE_HUMAN_MARTIAN,
			CULTURE_HUMAN_MARSTUN,
			CULTURE_HUMAN_PLUTO,
			CULTURE_HUMAN_BELTER,
			CULTURE_HUMAN_CETI,
			CULTURE_RESOMI_LOSTCOLONYRICH,
			CULTURE_RESOMI_LOSTCOLONYPOOR,
//			CULTURE_RESOMI_SAVEEL,
			CULTURE_OTHER
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_RESOMI_BIRDCAGE,
			HOME_SYSTEM_RESOMI_EREMUS,
			HOME_SYSTEM_RESOMI_ASRANDA,
//			HOME_SYSTEM_RESOMI_TIAMATH,
			HOME_SYSTEM_LUNA,
			HOME_SYSTEM_MARS,
			HOME_SYSTEM_PLUTO,
			HOME_SYSTEM_CERES,
			HOME_SYSTEM_TAU_CETI,
			HOME_SYSTEM_LORRIMAN,
			HOME_SYSTEM_YUKLID,
			HOME_SYSTEM_RESOMI_REFUGEE_COLONY,
			HOME_SYSTEM_RESOMI_LOST_COLONY,
			HOME_SYSTEM_RESOMI_HOMELESS,
			HOME_SYSTEM_RESOMI_SAVEEL,
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_NANOTRASEN,
			FACTION_FREETRADE,
			FACTION_HEPHAESTUS,
			FACTION_XYNERGY,
			FACTION_EXPEDITIONARY,
			FACTION_CORPORATE,
			FACTION_DAIS,
			FACTION_OTHER
		),
		TAG_RELIGION =  list(
			RELIGION_RESOMI_CHOSEN,
			RELIGION_RESOMI_EMPEROR,
			RELIGION_AGNOSTICISM,
			RELIGION_ATHEISM,
			RELIGION_RESOMI_SKIES,
			RELIGION_RESOMI_MOUNTAIN,
			RELIGION_CHRISTIANITY,
			RELIGION_OTHER
		)
	)

/datum/species/resomi/get_surgery_overlay_icon(var/mob/living/carbon/human/H)
	return 'frontier/code/modules/species/station/resomi//sprite_body/surgery.dmi'

/datum/species/resomi/skills_from_age(age)
	switch(age)
		if(0 to 17)		. = -4
		if(18 to 25)	. = 0
		if(26 to 35)	. = 4
		else			. = 8