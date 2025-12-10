#define DEFAULT_TIME 30
#define MAX_TIME 36000 // 10 hours

/mob/living/carbon/human/verb/acting()
	set category = "IC"
	set name = "Feign Impairment"
	set desc = "Pretend to be impaired for a defined duration."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You can't do this right now..."))
		return

	var/static/list/choices = list("drunkenness", "stuttering", "jittering")
	var/impairment = tgui_input_list(src, "Select an impairment to perform:", "Impairments", choices)
	if(!impairment)
		return

	var/duration = tgui_input_number(src, "How long would you like to feign [impairment] for?", "Duration in seconds", DEFAULT_TIME, MAX_TIME)
	switch(impairment)
		if("drunkenness")
			var/mob/living/living_user = usr
			if(istype(living_user))
				living_user.add_mood_event("drunk", /datum/mood_event/drunk)
			set_slurring_if_lower(duration SECONDS)
		if("stuttering")
			set_stutter_if_lower(duration SECONDS)
		if("jittering")
			set_jitter_if_lower(duration SECONDS)

	if(duration)
		addtimer(CALLBACK(src, PROC_REF(acting_expiry), impairment), duration SECONDS)
		to_chat(src, "You are now feigning [impairment].")

/mob/living/carbon/human/proc/acting_expiry(impairment)
	if(impairment)
		// Procs when fake impairment duration ends, useful for calling extra events to wrap up too
		if(impairment == "drunkenness")
			var/mob/living/living_user = usr
			if(istype(living_user))
				living_user.clear_mood_event("drunk")
		// Notify the user
		to_chat(src, "You are no longer feigning [impairment].")

#undef DEFAULT_TIME
#undef MAX_TIME
