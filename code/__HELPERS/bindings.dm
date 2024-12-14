//THIS FILE IS AUTOMATICALLY GENERATED BY AUXMOS, PLEASE DO NOT TOUCH IT
//PROC DEFINITIONS MAY MOVE AROUND, THIS IS NORMAL

/* This comment bypasses grep checks */ /var/__auxmos

/proc/__detect_auxmos()
	if (world.system_type == UNIX)
		return __auxmos = "libauxmos"
	else
		return __auxmos = "auxmos"

#define AUXMOS (__auxmos || __detect_auxmos())

/proc/byondapi_stack_trace(msg)
	CRASH(msg)

/// Returns: true. Parses gas strings like "o2=2500;plasma=5000;TEMP=370" and turns src mixes into the parsed gas mixture, invalid patterns will be ignored
/datum/gas_mixture/proc/__auxtools_parse_gas_string(string)
	return call_ext(AUXMOS, "byond:parse_gas_string_ffi")(src, string)

/// Returns: the total amount of gas mixtures in the arena, including "free" ones.
/datum/controller/subsystem/air/proc/get_max_gas_mixes()
	return call_ext(AUXMOS, "byond:hook_max_gas_mixes_ffi")()

/// Returns: the amount of gas mixtures that are attached to a byond gas mixture.
/datum/controller/subsystem/air/proc/get_amt_gas_mixes()
	return call_ext(AUXMOS, "byond:hook_amt_gas_mixes_ffi")()

/// Args: (list). Takes every gas in the list and makes them all identical, scaled to their respective volumes. The total heat and amount of substance in all of the combined gases is conserved.
/proc/equalize_all_gases_in_list(gas_list)
	return call_ext(AUXMOS, "byond:equalize_all_hook_ffi")(gas_list)

/// Args: (temperature). Returns: how much oxidizer for fire is in the mixture at the given temperature. If temperature is omitted, just uses current temperature instead.
/datum/gas_mixture/proc/get_oxidation_power(temp)
	return call_ext(AUXMOS, "byond:oxidation_power_hook_ffi")(src, temp)

/// Args: (temperature). Returns: how much fuel for fire is in the mixture at the given temperature. If temperature is omitted, just uses current temperature instead.
/datum/gas_mixture/proc/get_fuel_amount(temp)
	return call_ext(AUXMOS, "byond:fuel_amount_hook_ffi")(src, temp)

/// Args: (mixture). Makes `src` a copy of `mixture`, with volumes taken into account.
/datum/gas_mixture/proc/equalize_with(total)
	return call_ext(AUXMOS, "byond:equalize_with_hook_ffi")(src, total)

/// Args: (mixture, ratio). Transfers `ratio` of `src` to `mixture`.
/datum/gas_mixture/proc/transfer_ratio_to(other, ratio)
	return call_ext(AUXMOS, "byond:transfer_ratio_hook_ffi")(src, other, ratio)

/// Args: (mixture, amount). Takes the `amount` given and transfers it from `src` to `mixture`.
/datum/gas_mixture/proc/transfer_to(other, moles)
	return call_ext(AUXMOS, "byond:transfer_hook_ffi")(src, other, moles)

/// Args: (heat). Adds a given amount of heat to the mixture, i.e. in joules taking into account capacity.
/datum/gas_mixture/proc/adjust_heat(temp)
	return call_ext(AUXMOS, "byond:adjust_heat_hook_ffi")(src, temp)

/// Args: (holder). Runs all reactions on this gas mixture. Holder is used by the reactions, and can be any arbitrary datum or null.
/datum/gas_mixture/proc/react(holder)
	return call_ext(AUXMOS, "byond:react_hook_ffi")(src, holder)

/// Returns: true if the two mixtures are different enough for processing, false otherwise.
/datum/gas_mixture/proc/compare(other)
	return call_ext(AUXMOS, "byond:compare_hook_ffi")(src, other)

/// Clears the gas mixture my removing all of its gases.
/datum/gas_mixture/proc/clear()
	return call_ext(AUXMOS, "byond:clear_hook_ffi")(src)

/// Marks the mix as immutable, meaning it will never change. This cannot be undone.
/datum/gas_mixture/proc/mark_immutable()
	return call_ext(AUXMOS, "byond:mark_immutable_hook_ffi")(src)

/// Args: (mixture, ratio, gas_list). Takes gases given by `gas_list` and moves `ratio` amount of those gases from `src` into `mixture`.
/datum/gas_mixture/proc/scrub_into(into, ratio_v, gas_list)
	return call_ext(AUXMOS, "byond:scrub_into_hook_ffi")(src, into, ratio_v, gas_list)

/// Args: (flag). As get_gases(), but only returns gases with the given flag.
/datum/gas_mixture/proc/get_by_flag(flag_val)
	return call_ext(AUXMOS, "byond:get_by_flag_hook_ffi")(src, flag_val)

/// Args: (mixture, flag, amount). Takes `amount` from src that have the given `flag` and puts them into the given `mixture`. Returns: 0 if gas didn't have any with that flag, 1 if it did.
/datum/gas_mixture/proc/__remove_by_flag(into, flag_val, amount_val)
	return call_ext(AUXMOS, "byond:remove_by_flag_hook_ffi")(src, into, flag_val, amount_val)

/// Args: (coefficient). Divides all gases by this amount.
/datum/gas_mixture/proc/divide(num_val)
	return call_ext(AUXMOS, "byond:divide_hook_ffi")(src, num_val)

/// Args: (coefficient). Multiplies all gases by this amount.
/datum/gas_mixture/proc/multiply(num_val)
	return call_ext(AUXMOS, "byond:multiply_hook_ffi")(src, num_val)

/// Args: (amount). Subtracts the given amount from each gas.
/datum/gas_mixture/proc/subtract(num_val)
	return call_ext(AUXMOS, "byond:subtract_hook_ffi")(src, num_val)

/// Args: (amount). Adds the given amount to each gas.
/datum/gas_mixture/proc/add(num_val)
	return call_ext(AUXMOS, "byond:add_hook_ffi")(src, num_val)

/// Args: (gas_id_1, amount_1, gas_id_2, amount_2, ...). As adjust_moles, but with variadic arguments.
/datum/gas_mixture/proc/adjust_multi(...)
	var/list/args_copy = args.Copy()
	args_copy.Insert(1, src)
	return call_ext(AUXMOS, "byond:adjust_multi_hook_ffi")(arglist(args_copy))

/// Args: (gas_id, moles, temp). Adjusts the given gas's amount by the given amount, with that gas being treated as if it is at the given temperature.
/datum/gas_mixture/proc/adjust_moles_temp(id_val, num_val, temp_val)
	return call_ext(AUXMOS, "byond:adjust_moles_temp_hook_ffi")(src, id_val, num_val, temp_val)

/// Args: (gas_id, moles). Adjusts the given gas's amount by the given amount, e.g. (GAS_O2, -0.1) will remove 0.1 moles of oxygen from the mixture.
/datum/gas_mixture/proc/adjust_moles(id_val, num_val)
	return call_ext(AUXMOS, "byond:adjust_moles_hook_ffi")(src, id_val, num_val)

/// Args: (gas_id, moles). Sets the amount of substance of the given gas, in moles.
/datum/gas_mixture/proc/set_moles(gas_id, amt_val)
	return call_ext(AUXMOS, "byond:set_moles_hook_ffi")(src, gas_id, amt_val)

/// Args: (gas_id). Returns: the amount of substance of the given gas, in moles.
/datum/gas_mixture/proc/get_moles(gas_id)
	return call_ext(AUXMOS, "byond:get_moles_hook_ffi")(src, gas_id)

/// Args: (volume). Sets the volume of the gas.
/datum/gas_mixture/proc/set_volume(vol_arg)
	return call_ext(AUXMOS, "byond:set_volume_hook_ffi")(src, vol_arg)

/// Args: (gas_id). Returns the heat capacity from the given gas, in J/K (probably).
/datum/gas_mixture/proc/partial_heat_capacity(gas_id)
	return call_ext(AUXMOS, "byond:partial_heat_capacity_ffi")(src, gas_id)

/// Args: (temperature). Sets the temperature of the mixture. Will be set to 2.7 if it's too low.
/datum/gas_mixture/proc/set_temperature(arg_temp)
	return call_ext(AUXMOS, "byond:set_temperature_hook_ffi")(src, arg_temp)

/// Returns: a list of the gases in the mixture, associated with their IDs.
/datum/gas_mixture/proc/get_gases()
	return call_ext(AUXMOS, "byond:get_gases_hook_ffi")(src)

/// Args: (src, mixture, conductivity) or (src, conductivity, temperature, heat_capacity). Adjusts temperature of src based on parameters. Returns: temperature of sharer after sharing is complete.
/datum/gas_mixture/proc/temperature_share(...)
	var/list/args_copy = args.Copy()
	args_copy.Insert(1, src)
	return call_ext(AUXMOS, "byond:temperature_share_hook_ffi")(arglist(args_copy))

/// Arg: (mixture). Makes src into a copy of the argument mixture.
/datum/gas_mixture/proc/copy_from(giver)
	return call_ext(AUXMOS, "byond:copy_from_hook_ffi")(src, giver)

/// Args: (mixture, amount). Takes the given amount of gas from src and puts it into the argument mixture. Amount is amount of substance in moles.
/datum/gas_mixture/proc/__remove(into, amount_arg)
	return call_ext(AUXMOS, "byond:remove_hook_ffi")(src, into, amount_arg)

/// Args: (mixture, ratio). Takes the given ratio of gas from src and puts it into the argument mixture. Ratio is a number between 0 and 1.
/datum/gas_mixture/proc/__remove_ratio(into, ratio_arg)
	return call_ext(AUXMOS, "byond:remove_ratio_hook_ffi")(src, into, ratio_arg)

/// Args: (mixture). Merges the gas from the giver into src, without modifying the giver mix.
/datum/gas_mixture/proc/merge(giver)
	return call_ext(AUXMOS, "byond:merge_hook_ffi")(src, giver)

/// Returns: the mix's thermal energy, the product of the mixture's heat capacity and its temperature.
/datum/gas_mixture/proc/thermal_energy()
	return call_ext(AUXMOS, "byond:thermal_energy_hook_ffi")(src)

/// Returns: the mix's volume, in liters.
/datum/gas_mixture/proc/return_volume()
	return call_ext(AUXMOS, "byond:return_volume_hook_ffi")(src)

/// Returns: the mix's temperature, in kelvins.
/datum/gas_mixture/proc/return_temperature()
	return call_ext(AUXMOS, "byond:return_temperature_hook_ffi")(src)

/// Returns: the mix's pressure, in kilopascals.
/datum/gas_mixture/proc/return_pressure()
	return call_ext(AUXMOS, "byond:return_pressure_hook_ffi")(src)

/// Returns: Amount of substance, in moles.
/datum/gas_mixture/proc/total_moles()
	return call_ext(AUXMOS, "byond:total_moles_hook_ffi")(src)

/// Args: (min_heat_cap). Sets the mix's minimum heat capacity.
/datum/gas_mixture/proc/set_min_heat_capacity(arg_min)
	return call_ext(AUXMOS, "byond:min_heat_cap_hook_ffi")(src, arg_min)

/// Returns: Heat capacity, in J/K (probably).
/datum/gas_mixture/proc/heat_capacity()
	return call_ext(AUXMOS, "byond:heat_cap_hook_ffi")(src)

/// Adds the gas mixture's ID to the queue of mixtures that have been deleted, to be reused later.
/// This version is only if auxcleanup is not being used; it should be called from /datum/gas_mixture/Del.
/datum/gas_mixture/proc/__gasmixture_unregister()
	return call_ext(AUXMOS, "byond:unregister_gasmixture_hook_ffi")(src)

/// Fills in the first unused slot in the gas mixtures vector, or adds another one, then sets the argument ByondValue to point to it.
/datum/gas_mixture/proc/__gasmixture_register()
	return call_ext(AUXMOS, "byond:register_gasmixture_hook_ffi")(src)

/// Args: (ms). Runs callbacks until time limit is reached. If time limit is omitted, runs all callbacks.
/proc/process_atmos_callbacks(remaining)
	return call_ext(AUXMOS, "byond:atmos_callback_handle_ffi")(remaining)

/// Updates adjacency infos for turfs, only use this in immediateupdateturfs.
/turf/proc/__update_auxtools_turf_adjacency_info()
	return call_ext(AUXMOS, "byond:hook_infos_ffi")(src)

/// Returns: null. Updates turf air infos, whether the turf is closed, is space or a regular turf, or even a planet turf is decided here.
/turf/proc/update_air_ref(flag)
	return call_ext(AUXMOS, "byond:hook_register_turf_ffi")(src, flag)

/// Returns: If this cycle is interrupted by overtiming or not. Starts a katmos equalize cycle, does nothing if process_turfs isn't ran.
/datum/controller/subsystem/air/proc/process_turf_equalize_auxtools(remaining)
	return call_ext(AUXMOS, "byond:equalize_hook_ffi")(src, remaining)

/// Returns: If this cycle is interrupted by overtiming or not. Starts a processing turfs cycle.
/datum/controller/subsystem/air/proc/process_turfs_auxtools(remaining)
	return call_ext(AUXMOS, "byond:process_turf_hook_ffi")(src, remaining)

/// Returns: If this cycle is interrupted by overtiming or not. Calls all outstanding callbacks created by other processes, usually ones that can't run on other threads and only the main thread.
/datum/controller/subsystem/air/proc/finish_turf_processing_auxtools(time_remaining)
	return call_ext(AUXMOS, "byond:finish_process_turfs_ffi")(time_remaining)

/// Returns: If a processing thread is running or not.
/datum/controller/subsystem/air/proc/thread_running()
	return call_ext(AUXMOS, "byond:thread_running_hook_ffi")()

/// Returns: If this cycle is interrupted by overtiming or not. Starts a processing excited groups cycle, does nothing if process_turfs isn't ran.
/datum/controller/subsystem/air/proc/process_excited_groups_auxtools(remaining)
	return call_ext(AUXMOS, "byond:groups_hook_ffi")(src, remaining)

/// For updating reagent gas fire products, do not use for now.
/proc/finalize_gas_refs()
	return call_ext(AUXMOS, "byond:finalize_gas_refs_ffi")()

/// For updating reaction informations for auxmos, only call this when it is changed.
/datum/controller/subsystem/air/proc/auxtools_update_reactions()
	return call_ext(AUXMOS, "byond:update_reactions_ffi")()

/// Registers gases, and get reaction infos for auxmos, only call when ssair is initing.
/proc/auxtools_atmos_init(gas_data)
	return call_ext(AUXMOS, "byond:hook_init_ffi")(gas_data)

/// For registering gases, do not touch this.
/proc/_auxtools_register_gas(gas)
	return call_ext(AUXMOS, "byond:hook_register_gas_ffi")(gas)

