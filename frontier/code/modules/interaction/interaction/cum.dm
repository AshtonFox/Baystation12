/datum/reagent/f_lube
	name = "female lube"
	id = "f_lube"
	description = "Organic substance, natural lubricant to protect the mucous membrane of the genitals from the appearance of microcracks and irritation."
	reagent_state = LIQUID
	color = "#AAAAAA77"
	taste_description = "slimy and salty liquid"
	taste_mult = 2
	var/nutriment_factor = 0.3
	glass_desc = "Probably smells like a fish."

/datum/reagent/f_lube/touch_turf(var/turf/T)
	src = null
	if(!istype(T, /turf/space))
		new /obj/effect/decal/cleanable/f_lube(T)

/datum/reagent/semen
	name = "semen"
	id = "semen"
	description = "Fluid secreted by males during ejaculation."
	reagent_state = LIQUID
	color = "#fffaf0"
	taste_description = "salt"
	taste_mult = 2
	var/nutriment_factor = 0.5
//	glass_icon_state = "glass_white"
	glass_name = "glass of cream"
	glass_desc = "Smells suspicious."

/datum/reagent/semen/touch_turf(var/turf/T)
	src = null
	if(!istype(T, /turf/space))
		new /obj/effect/decal/cleanable/cum(T)

/obj/effect/decal/cleanable/cum
	name = "cum"
	desc = "It's pie cream from a cream pie. Or not..."
	density = 0
	layer = 2
	icon = 'frontier/code/modules/interaction/icons/effects/cum.dmi'
	blood_DNA = list()
	anchored = 1
	random_icon_states = list("cum1", "cum3", "cum4", "cum5", "cum6", "cum7", "cum8", "cum9", "cum10", "cum11", "cum12")

/obj/effect/decal/cleanable/f_lube
	name = "lube"
	desc = "Is it Space Lube?"
	density = 0
	layer = 2
	icon = 'frontier/code/modules/interaction/icons/effects/lube.dmi'
	anchored = 1
	var/amount = 5
	random_icon_states = list("mgibbl1", "mgibbl2", "mgibbl3", "mgibbl4", "mgibbl5", "mfloor1", "mfloor2", "mfloor3", "mfloor4", "mfloor5", "mfloor6", "mfloor7")

/obj/effect/decal/cleanable/f_lube/splatter
	random_icon_states = list("mgibbl1", "mgibbl2", "mgibbl3", "mgibbl4", "mgibbl5", "mfloor1", "mfloor2", "mfloor3", "mfloor4", "mfloor5", "mfloor6", "mfloor7")
	amount = 2

/obj/effect/decal/cleanable/f_lube/drip
	name = "drips of female lube"
	desc = "It's transparent."
	gender = PLURAL
	icon = 'frontier/code/modules/interaction/icons/effects/l_drip.dmi'
	icon_state = "1"
	random_icon_states = list("1","2","3","4","5")
	amount = 0
	var/list/drips = list()

/obj/effect/decal/cleanable/f_lube/drip/New()
	..()
	drips |= icon_state

