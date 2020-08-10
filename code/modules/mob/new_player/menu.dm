//MENU SYSTEM BY BIGRAGE, some awful code, some awful design, all as you love //Code edits/additions by AshtonFox

/datum/hud/new_player
	hud_shown = TRUE			//Used for the HUD toggle (F12)
	inventory_shown = FALSE
	hotkey_ui_hidden = FALSE

/datum/hud/new_player/FinalizeInstantiation(var/ui_style='icons/mob/screen1_White.dmi', var/ui_color = "#fffffe", var/ui_alpha = 255)
	adding = list()
	var/obj/screen/using

	using = new /obj/screen/new_player/title() //all MENU UI
	using.SetName("Title")
	adding += using

	using = new /obj/screen/new_player/selection/join_game()
	using.SetName("Join Game")
	adding += using

	using = new /obj/screen/new_player/selection/settings()
	using.SetName("Setup Character")
	adding += using

	using = new /obj/screen/new_player/selection/manifest()
	using.SetName("Crew Manifest")
	adding += using

	using = new /obj/screen/new_player/selection/observe()
	using.SetName("Observe")
	adding += using

	using = new /obj/screen/new_player/selection/changelog()
	using.SetName("Changelog")
	adding += using

	using = new /obj/screen/new_player/selection/polls()
	using.SetName("Polls")
	adding += using

	mymob.client.screen = list()
	mymob.client.screen += adding
	src.adding += using


/obj/screen/new_player
	icon = 'icons/misc/hudmenu.dmi'
	plane = HUD_PLANE
	layer = HUD_BASE_LAYER

/obj/screen/new_player/title
	name = "Title"
	screen_loc = "WEST,SOUTH"
	var/lobby_index = 1

/obj/screen/new_player/title/Initialize()
	icon = GLOB.using_map.lobby_icon
	var/known_icon_states = icon_states(icon)
	for(var/lobby_screen in GLOB.using_map.lobby_screens)
		if(!(lobby_screen in known_icon_states))
			error("Lobby screen '[lobby_screen]' did not exist in the icon set [icon].")
			GLOB.using_map.lobby_screens -= lobby_screen

	if(GLOB.using_map.lobby_screens.len)
		if(GLOB.using_map.lobby_transitions && isnum(GLOB.using_map.lobby_transitions))
			icon_state = GLOB.using_map.lobby_screens[lobby_index]
			if(Master.initializing)
				spawn(GLOB.using_map.lobby_transitions)
					Update()
			else
				addtimer(CALLBACK(src, .proc/Update), GLOB.using_map.lobby_transitions, TIMER_UNIQUE | TIMER_CLIENT_TIME | TIMER_OVERRIDE)
		else
			icon_state = pick(GLOB.using_map.lobby_screens)
	else
		icon_state = LAZYACCESS(known_icon_states, 1)

	. = ..()

/obj/screen/new_player/title/proc/Update()
	lobby_index += 1
	if (lobby_index > GLOB.using_map.lobby_screens.len)
		lobby_index = 1
	animate(src, alpha = 0, time = 1 SECOND)
	animate(alpha = 255, icon_state = GLOB.using_map.lobby_screens[lobby_index], time = 1 SECOND)
	if(Master.initializing)
		spawn(GLOB.using_map.lobby_transitions)
			Update()
	else
		addtimer(CALLBACK(src, .proc/Update), GLOB.using_map.lobby_transitions, TIMER_UNIQUE | TIMER_CLIENT_TIME | TIMER_OVERRIDE)

/obj/screen/new_player/selection/join_game
	name = "Join Game"
	icon_state = "unready"
	screen_loc = "LEFT+1,CENTER"

/obj/screen/new_player/selection/settings
	name = "Setup"
	icon_state = "setup"
	screen_loc = "LEFT+1,CENTER-1"

/obj/screen/new_player/selection/manifest
	name = "Crew Manifest"
	icon_state = "manifest"
	screen_loc = "LEFT+1,CENTER-2"

/obj/screen/new_player/selection/observe
	name = "Observe"
	icon_state = "observe"
	screen_loc = "LEFT+1,CENTER-3"

/obj/screen/new_player/selection/changelog
	name = "Changelog"
	icon_state = "changelog"
	screen_loc = "LEFT+1,CENTER-4"

/obj/screen/new_player/selection/polls
	name = "Polls"
	icon_state = "polls"
	screen_loc = "LEFT+1,CENTER-5"

//SELECTION

/obj/screen/new_player/selection/New(var/desired_loc)
	color = null
	return ..()

/obj/screen/new_player/selection/MouseEntered(location,control,params) //Yellow color for the font
	color = "#6cb0e8"
	var/matrix/M = matrix()
	M.Scale(1.1, 1.1)
	animate(src, transform = M, time = 1, easing = CUBIC_EASING)
	return ..()

/obj/screen/new_player/selection/MouseExited(location,control,params)
	color = null
	animate(src, transform = null, time = 1, easing = CUBIC_EASING)
	return ..()


/obj/screen/new_player/selection/join_game/New()
	var/mob/new_player/player = usr
	if(GAME_STATE <= RUNLEVEL_LOBBY)
		if(player.ready)
			icon_state = "ready"
		else
			icon_state = "unready"
	else
		icon_state = "joingame"

/obj/screen/new_player/selection/join_game/Click()
	var/mob/new_player/player = usr
	sound_to(player, 'sound/effects/menu_click.ogg')
	if(GAME_STATE <= RUNLEVEL_LOBBY)
		if(player.ready)
			player.ready = FALSE
			player.ready()
			icon_state = "unready"
		else
			player.ready = TRUE
			player.ready()
			icon_state = "ready"
	else
		icon_state = "joingame"
		player.join_game()

/obj/screen/new_player/selection/manifest/Click()
	var/mob/new_player/player = usr
	sound_to(player, 'sound/effects/menu_click.ogg')
	player.ViewManifest()

/obj/screen/new_player/selection/observe/Click()
	var/mob/new_player/player = usr
	sound_to(player, 'sound/effects/menu_click.ogg')
	player.observe()

/obj/screen/new_player/selection/settings/Click()
	var/mob/new_player/player = usr
	sound_to(player, 'sound/effects/menu_click.ogg')
	player.setupcharacter()

/obj/screen/new_player/selection/changelog/Click()
	var/mob/new_player/player = usr
	sound_to(player, 'sound/effects/menu_click.ogg')
	player.client.changes()

/obj/screen/new_player/selection/poll/Click()
	var/mob/new_player/player = usr
	sound_to(player, 'sound/effects/menu_click.ogg')
	player.handle_player_polling()
