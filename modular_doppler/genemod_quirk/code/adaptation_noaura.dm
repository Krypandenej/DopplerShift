/datum/mutation/adaptation/cold_genemodded
	name = "Cold Adaptation (No Aura)"
	desc = "A strange mutation that renders the host immune to damage from low temperature environments. It also prevents the host from slipping on ice."
	text_gain_indication = span_notice("Your body feels refreshingly cold.")
	instability = POSITIVE_INSTABILITY_MODERATE
	mutation_traits = list(TRAIT_RESISTCOLD, TRAIT_NO_SLIP_ICE)
	locked = TRUE

/datum/mutation/adaptation/heat_genemodded
	name = "Heat Adaptation (No Aura)"
	desc = "A strange mutation that renders the host immune to damage from high temperature, including being set alight, though the flame itself still burns clothing. It also seems to make the host resist ash storms."
	text_gain_indication = span_notice("Your body feels invigoratingly warm.")
	instability = POSITIVE_INSTABILITY_MODERATE
	mutation_traits = list(TRAIT_RESISTHEAT, TRAIT_ASHSTORM_IMMUNE)
	locked = TRUE
