/obj/item/weapon/gun/energy
    var/bat_insert_sound = 'sound/weapons/guns/interaction/pistol_magin.ogg'
    var/bat_remove_sound = 'sound/weapons/guns/interaction/pistol_magout.ogg'
    var/hatch = TRUE

/obj/item/weapon/gun/energy/examine(mob/user)
    . = ..(user)
    if (!cell_type)
        to_chat(user, "This weapon uses custom energy cell as a power source.")
    else
        switch(cell_type)
            if (/obj/item/weapon/cell/device/weapon/normal)
                to_chat(user, "This weapon uses a normal-size energy cell as a power source.")
            if (/obj/item/weapon/cell/device/weapon/small)
                to_chat(user, "This weapon uses a small energy cell as a power source.")
            if (/obj/item/weapon/cell/device/weapon/big)
                to_chat(user, "This weapon uses a big energy cell as a power source.")

/obj/item/weapon/gun/energy/proc/unload_battary(mob/user)
    if(cell_type == null || use_external_power)
        to_chat(user, "<span class='warning'>You can't pull the battery out of [src].</span>")
        return
    if(!hatch)
        to_chat(user, "<span class='warning'>Open the hatch first.</span>")
        return
    if (power_supply)
        if(do_after(user, 7 * (SKILL_MAX + 1 - user.get_skill_value(SKILL_WEAPONS)) , src))
            user.put_in_hands(power_supply)
            user.visible_message("[user] removes [power_supply] from [src].", "<span class='notice'>You remove [power_supply] from [src].</span>")
            playsound(loc, bat_remove_sound, 50, 1)
            power_supply = null
            on_update_icon()
    else
        to_chat(user, "<span class='warning'>The [src] is empty.</span>")

/obj/item/weapon/gun/energy/proc/load_battary(var/obj/item/B, mob/user)
    if(cell_type == null || use_external_power)
        to_chat(user, "<span class='warning'>You can't insert a battery into [src].</span>")
        return
    if(istype(B, cell_type))
        . = TRUE
        if(!hatch)
            to_chat(user, "<span class='warning'>Open the hatch first.</span>")
            return
        if(power_supply)
            to_chat(user, "<span class='warning'>[src] already has a battery loaded.</span>")
            return
        if(do_after(user, 7 * (SKILL_MAX + 1 - user.get_skill_value(SKILL_WEAPONS)) , src))
            if(!user.unEquip(B, src))
                return
            power_supply = B
            user.visible_message("[user] inserts [B] into [src].", "<span class='notice'>You insert [B] into [src].</span>")
            playsound(loc, bat_insert_sound, 50, 1)
            on_update_icon()
    else if (istype(B, /obj/item/weapon/cell))
        to_chat(user, "<span class='warning'>You can't use this cell in [src].</span>")
    else
        to_chat(user, "<span class='warning'>You can't use this in [src], stupid.</span>")

/*
/obj/item/weapon/gun/energy/proc/togle_hatch(mob/user)
    playsound(src.loc, 'sound/items/Screwdriver.ogg', 100, 1)
    if(do_after(user, 5, src))
        if(!hatch)
            user.visible_message("[user] opens the hatch on the [src].", "<span class='notice'>You open the hatch on the [src].</span>")
            hatch = TRUE
        else
            user.visible_message("[user] closes the hatch on the [src].", "<span class='notice'>You close the hatch on the [src].</span>")
            hatch = FALSE
*/
/obj/item/weapon/gun/energy/attack_hand(mob/user as mob)
    if(user.get_inactive_hand() == src)
        unload_battary(user)
    else
        return ..()

/obj/item/weapon/gun/energy/attackby(var/obj/item/I as obj, mob/user as mob)
/*
    if(istype(I, /obj/item/weapon/screwdriver))
        togle_hatch(user)
        return ..()
*/
    if(!load_battary(I, user))
        return ..()
