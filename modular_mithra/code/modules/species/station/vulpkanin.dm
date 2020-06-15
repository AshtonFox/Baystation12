/datum/species/vulpkanin
	name = SPECIES_VULP
	name_plural = SPECIES_VULP
	icobase = 'modular_mithra/icons/mob/human_races/species/vulpkanin/body.dmi'
	//deform = 'modular_mithra/icons/mob/human_races/species/vulpkanin/deformed_body.dmi' They don't have deformed icons. Hopefully this doesn't cause problems
	husk_icon = 'modular_mithra/icons/mob/human_races/species/vulpkanin/husk.dmi'
	preview_icon = 'modular_mithra/icons/mob/human_races/species/vulpkanin/preview.dmi'
	modular_tail = 'modular_mithra/icons/mob/human_races/species/vulpkanin/tail.dmi'
	tail_animation = 'modular_mithra/icons/mob/human_races/species/vulpkanin/tail.dmi'
	tail = "vulptail"
	limb_blend = ICON_MULTIPLY
	tail_blend = ICON_MULTIPLY
	default_ears = /datum/sprite_accessory/ears/vulp
	hidden_from_codex = FALSE

	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/sharp, /datum/unarmed_attack/claws)
	darksight_range = 5
	darksight_tint = DARKTINT_GOOD
	flash_mod = 1.2
	burn_mod = 1.15

	description = "Vulpkanin or 'Vulpa' is a species of sharp-witted canid bipeds mainly residing in the binary Vazzend system. Their politically de-centralized society and independent natures have led them to become a species and culture both feared and respected for their scientific breakthroughs. Discovery, loyalty, and utilitarianism dominate their lifestyles to the degree it can cause conflict with more rigorous and strict authorities. They speak a guttural language known as 'Canilunzt' which has a heavy emphasis on utilizing tail positioning and ear twitches to communicate intent."

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#966464"
	base_color = "#B43214"

	min_age = 18
	max_age = 80

	sexybits_location = BP_GROIN //this is possibly my favorite variable just because of how out of place it is. - cebu | what the hell does it even do -tori | Basically it just defines where you can hit them for massive (pain) damage. An entire variable dedicated to nutshots. -cebu


	available_cultural_info = list( //I can do ANYTHING! Placeholder until the loreboys come and figure out what Vulpkanin do
		TAG_CULTURE = list(
			CULTURE_VULP,
			CULTURE_VULP_KELE,
			CULTURE_VULP_SOL,
			CULTURE_HUMAN,
			CULTURE_HUMAN_BELTER,
			CULTURE_HUMAN_EARTH,
			CULTURE_HUMAN_CETI,
			CULTURE_HUMAN_SPACER,
			CULTURE_HUMAN_SPAFRO,
			CULTURE_HUMAN_CONFED,
			CULTURE_HUMAN_OTHER,
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_ALTAM,
			HOME_SYSTEM_KELUNE,
			HOME_SYSTEM_DALSTADT,
			HOME_SYSTEM_MARS,
			HOME_SYSTEM_EARTH,
			HOME_SYSTEM_LUNA,
			HOME_SYSTEM_VENUS,
			HOME_SYSTEM_CERES,
			HOME_SYSTEM_PLUTO,
			HOME_SYSTEM_TAU_CETI,
			HOME_SYSTEM_HELIOS,
			HOME_SYSTEM_TERRA,
			HOME_SYSTEM_TERSTEN,
			HOME_SYSTEM_LORRIMAN,
			HOME_SYSTEM_CINU,
			HOME_SYSTEM_YUKLID,
			HOME_SYSTEM_LORDANIA,
			HOME_SYSTEM_KINGSTON,
			HOME_SYSTEM_GAIA,
			HOME_SYSTEM_MAGNITKA,
			HOME_SYSTEM_OTHER
		),
		TAG_RELIGION = list(
			RELIGION_OTHER,
			RELIGION_AGNOSTICISM,
			RELIGION_DEISM,
			RELIGION_ATHEISM,
			RELIGION_SPIRITUALISM,
		)
	)

	exertion_effect_chance = 10
	exertion_hydration_scale = 1
	exertion_charge_scale = 1
	exertion_reagent_scale = 5
	exertion_reagent_path = /datum/reagent/lactate
	exertion_emotes_biological = list(
		/decl/emote/exertion/biological,
		/decl/emote/exertion/biological/breath,
		/decl/emote/exertion/biological/pant
	)
	exertion_emotes_synthetic = list(
		/decl/emote/exertion/synthetic,
		/decl/emote/exertion/synthetic/creak
	)
