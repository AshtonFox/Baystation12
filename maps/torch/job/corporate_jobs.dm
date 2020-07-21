/datum/job/liaison
	title = "Internal Affairs Agent"
	department = "Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "Corporate Regulations and Central Command"
	selection_color = "#2f2f7f"
	economic_power = 15
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 25)
	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/workplace_liaison
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/contractor)
	min_skill = list(   SKILL_BUREAUCRACY	= SKILL_EXPERT,
	                    SKILL_FINANCE		= SKILL_BASIC)
	skill_points = 20
	access = list(access_liaison, access_bridge, access_solgov_crew,
						access_nanotrasen, access_commissary, access_torch_fax)
	software_on_spawn = list(/datum/computer_file/program/reports)

/datum/job/liaison/get_description_blurb()
	return "You are the Internal Affairs Agent. You are a civilian employee of NT. You are on board the vessel to make sure that the crew is following Standard Operating Procedure. You also handle complaints against crew members, and can have issues brought to the attention of Central Command, assuming their paperwork is in order. Maximise profit. Be the shady corporate shill you always wanted to be."
