/obj/item/weapon/gun/energy
    var/bat_insert_sound = 'sound/weapons/guns/interaction/pistol_magin.ogg'
    var/bat_remove_sound = 'sound/weapons/guns/interaction/pistol_magout.ogg'
    var/hatch = FALSE

/obj/item/weapon/gun/energy/examine(mob/user)
    . = ..(user)
    if (cell_type != null)
        var/obj/item/weapon/cell/C = cell_type
        to_chat(user, "This gun use [C.name] as a power source.")

/obj/item/weapon/gun/energy/proc/unload_battary(mob/user)
    if(cell_type == null || use_external_power)
        to_chat(user, "<span class='warning'>You can't pull out battery from [src].</span>")
        return
    if(!hatch)
        to_chat(user, "<span class='warning'>Open a hatch firts.</span>")
        return
    if (power_supply)
        if(do_after(user, 10 * (SKILL_MAX + 1 - user.get_skill_value(SKILL_WEAPONS)) , src))
            user.put_in_hands(power_supply)
            user.visible_message("[user] removes [power_supply] from [src].", "<span class='notice'>You remove [power_supply] from [src].</span>")
            playsound(loc, bat_remove_sound, 50, 1)
            power_supply = null
            on_update_icon()
    else
        to_chat(user, "<span class='warning'>[src] is empty.</span>")

/obj/item/weapon/gun/energy/proc/load_battary(var/obj/item/B, mob/user)
    if(cell_type == null || use_external_power)
        to_chat(user, "<span class='warning'>You can't insert out battery in [src].</span>")
        return
    if(istype(B, cell_type))
        . = TRUE
        if(!hatch)
            to_chat(user, "<span class='warning'>Open a hatch firts.</span>")
            return
        if(power_supply)
            to_chat(user, "<span class='warning'>[src] already has a battry loaded.</span>")
            return
        if(do_after(user, 10 * (SKILL_MAX + 1 - user.get_skill_value(SKILL_WEAPONS)) , src))
            if(!user.unEquip(B, src))
                return
            power_supply = B
            user.visible_message("[user] inserts [B] into [src].", "<span class='notice'>You insert [B] into [src].</span>")
            playsound(loc, bat_insert_sound, 50, 1)
            on_update_icon()
    else if (istype(B, /obj/item/weapon/cell))
        to_chat(user, "<span class='warning'>You can't use this cell in [src].</span>")
    else
        to_chat(user, "<span class='warning'>You can't use this in [src]. Stupid man.</span>")


/obj/item/weapon/gun/energy/proc/togle_hatch(mob/user)
    if(do_after(user, 5, src))
        if(!hatch)
            user.visible_message("[user] open hatch on [src].", "<span class='notice'>You open hatch on [src].</span>")
            hatch = TRUE
        else
            user.visible_message("[user] close hatch on [src].", "<span class='notice'>You close hatch on [src].</span>")
            hatch = FALSE

/obj/item/weapon/gun/energy/attack_hand(mob/user as mob)
    if(user.get_inactive_hand() == src)
        unload_battary(user)
    else
        return ..()

/obj/item/weapon/gun/energy/attackby(var/obj/item/I as obj, mob/user as mob)
    if(istype(I, /obj/item/weapon/screwdriver))
        togle_hatch(user)
    if(!load_battary(I, user))
        return ..()
