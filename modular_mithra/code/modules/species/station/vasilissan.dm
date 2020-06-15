/datum/species/vasilissan
	name = SPECIES_VASS
	name_plural = "Vasilissans"
	icobase = 'modular_mithra/icons/mob/human_races/species/vasilissan/body.dmi'
	deform = 'modular_mithra/icons/mob/human_races/species/vasilissan/deformed_body.dmi'
	husk_icon = 'modular_mithra/icons/mob/human_races/species/vasilissan/husk.dmi'
	preview_icon = 'modular_mithra/icons/mob/human_races/species/vasilissan/preview.dmi'
	modular_tail = 'modular_mithra/icons/mob/human_races/species/vasilissan/tail.dmi'
	tail = "spidertail"
	limb_blend = ICON_MULTIPLY
	tail_blend = ICON_MULTIPLY
	hidden_from_codex = FALSE

	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/sharp, /datum/unarmed_attack/claws)

	description = "Vasilissans are a carnivorous, large spider-like people with tall, lanky bipedal bodies covered in chitin, and four large spider-like limbs protruding from their backs. They come in a variety of colors and are extremely diverse in that aspect. The females are usually about a foot taller than the males, averaging in at about seven feet. The females are also much stronger than the males. Their faces have four eyes of solid and varying colors. On the top of their heads are strange, thick, leg-like feelers that are normally styled in much the same way as hair. Their color varies greatly and isn’t normally the same color as the Vasilissan’s body. They have several feelers and sharp claw-like limbs around their lipped human-like mouths. These mouths contain only fangs, a strange, bulbous, long tongue, and spinnerets, giving them the ability to spit large strands of silk from their mouths. Their faces are traditionally very pretty, long, and elegant, almost elf-like despite their hard chitin plating and lack of a nose."

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	sexybits_location = BP_GROIN //this is possibly my favorite variable just because of how out of place it is. - cebu | what the hell does it even do -tori | Basically it just defines where you can hit them for massive (pain) damage. An entire variable dedicated to nutshots. -cebu  | do these guys even have junk in their groin??? -cebu


	available_cultural_info = list( //I can do ANYTHING! Placeholder until the loreboys come and figure out what Vasilissans do
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
