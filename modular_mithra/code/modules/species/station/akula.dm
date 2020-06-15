/datum/species/akula
	name = SPECIES_AKULA
	name_plural = SPECIES_AKULA
	icobase = 'modular_mithra/icons/mob/human_races/species/akula/body.dmi'
	deform = 'modular_mithra/icons/mob/human_races/species/akula/deformed_body.dmi'
	husk_icon = 'modular_mithra/icons/mob/human_races/species/akula/husk.dmi'
	preview_icon = 'modular_mithra/icons/mob/human_races/species/akula/preview.dmi'
	modular_tail = 'modular_mithra/icons/mob/human_races/species/akula/tail.dmi'
	tail = "aktail"
	limb_blend = ICON_MULTIPLY
	tail_blend = ICON_MULTIPLY
	hidden_from_codex = FALSE

	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick,/datum/unarmed_attack/tail, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/sharp)

	description = "The Akula is a species of amphibious humanoids like the Skrell, but have an appearance very similar to that of a shark. They were first discovered as a primitive race of underwater-dwelling tribal creatures by the Skrell. At first they were not believed to be noteworthy, but the Akula proved to be such swift and clever learners that the Skrell reclassified them as sentients. Allegedly, the Akula was also the first sentient life that the Skrell had ever encountered beside themselves, and thus the two species became swift allies over the next few hundred years. With the help of Skrellean technology, the Akula had their genome modified to be capable of surviving in open air for long periods of time. However, Akula even today still require a high humidity environment to avoid drying out after a few days, which would make life on the arid worlds nearly impossible if it were not for Skrellean technology to aid them."

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	sexybits_location = BP_GROIN //this is possibly my favorite variable just because of how out of place it is.


	available_cultural_info = list( //I can do ANYTHING! Placeholder until the loreboys come and figure out what Akula do
		TAG_CULTURE = list(
			CULTURE_HUMAN,
			CULTURE_HUMAN_VATGROWN,
			CULTURE_HUMAN_MARTIAN,
			CULTURE_HUMAN_MARSTUN,
			CULTURE_HUMAN_LUNAPOOR,
			CULTURE_HUMAN_LUNARICH,
			CULTURE_HUMAN_VENUSIAN,
			CULTURE_HUMAN_VENUSLOW,
			CULTURE_HUMAN_BELTER,
			CULTURE_HUMAN_PLUTO,
			CULTURE_HUMAN_EARTH,
			CULTURE_HUMAN_CETI,
			CULTURE_HUMAN_SPACER,
			CULTURE_HUMAN_SPAFRO,
			CULTURE_HUMAN_CONFED,
			CULTURE_HUMAN_OTHER,
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
