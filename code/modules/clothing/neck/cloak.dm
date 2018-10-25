/obj/item/clothing/neck/cloak/medieval
	name = "cloak"
	desc = "A basic cloak with a hood."
	icon_state = "medievalcloak"
	item_state = "medievalcloak"
	actions_types = list(/datum/action/item_action/toggle_helmet)
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = 260
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/neck/cloak/medieval/item_action_slot_check(slot)
	if(slot == SLOT_NECK)
		return 1
		
/obj/item/clothing/neck/cloak/medieval/ui_action_click()
	..()
	ToggleHood()
	
/obj/item/clothing/neck/cloak/medieval/proc/ToggleHood()
	if(cmptext(icon_state, "medievalcloak"))
		icon_state = "medievalcloak-hood"
		item_state = "medievalcloak-hood"
		cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS | HEAD
		flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
		body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD
	else
		icon_state = "medievalcloak"
		item_state = "medievalcloak"
		cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
		flags_inv = null
		body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

	var/mob/living/carbon/human/H = loc
	H.update_inv_neck()
	H.head_update(src, forced = 1)

	update_icon()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()