# +-------------------------------------------------------------------------------------+
# |                                                                                     |
# |                   Chanserv Add Access (Aop, SOP) v1.0.0                             |
# |                                                                                     |
# +-------------------------------------------------------------------------------------+
# |                                                                                     |
# | *** Website             @  https://www.RadioMania.Rocks                             |
# | *** GitHub              @  https://github.com/radiomania/aslpls                     |
# |                                                                                     |
# +-------------------------------------------------------------------------------------+
# | *** IRC Support:                                                                    |
# |                    #aslpls     @ DALnet                                             |
# |                    #aslpls     @ UnderNET                                           |
# |                    #aslpls     @ UnderX                                             |
# |                                                                                     |
# | *** Contact:                                                                        |
# |                    Google Mail         : tabiligamer@gmail.com                      |
# |                                                                                     |
# |                                                                                     |
# |                                                                                     |
# |                                                                                     |
# +-------------------------------------------------------------------------------------+


# Define the channel and ChanServ nickname
set channel "#cebu"
set chanserv "ChanServ@services.dal.net"

# Bind public commands for AOP and SOP management
bind pub - "!addaop" add_aop
bind pub - "!delaop" del_aop
bind pub - "!addsop" add_sop
bind pub - "!delsop" del_sop
bind pub - "!addhop" add_hop
bind pub - "!delhop" del_hop
bind pub - "!addvop" add_vop
bind pub - "!delvop" del_vop


# Procedure to add a user to the AOP list
proc add_aop {nick uhost hand chan text} {
    global channel chanserv

    if {$chan != $channel} {
        return
    }

    set params [split $text]
    if {[llength $params] < 1} {
        putserv "PRIVMSG $chan :Usage: !addaop <nickname>"
        return
    }

    set user [lindex $params 0]
    putserv "PRIVMSG $chanserv :AOP $channel ADD $user"
    putserv "PRIVMSG $chan :Added $user to the AutoOp (AOP) list."
}

# Procedure to delete a user from the AOP list
proc del_aop {nick uhost hand chan text} {
    global channel chanserv

    if {$chan != $channel} {
        return
    }

    set params [split $text]
    if {[llength $params] < 1} {
        putserv "PRIVMSG $chan :Usage: !delaop <nickname>"
        return
    }

    set user [lindex $params 0]
    putserv "PRIVMSG $chanserv :AOP $channel DEL $user"
    putserv "PRIVMSG $chan :Removed $user from the AutoOp (AOP) list."
}

# Procedure to add a user to the SOP list
proc add_sop {nick uhost hand chan text} {
    global channel chanserv

    if {$chan != $channel} {
        return
    }

    set params [split $text]
    if {[llength $params] < 1} {
        putserv "PRIVMSG $chan :Usage: !addsop <nickname>"
        return
    }

    set user [lindex $params 0]
    putserv "PRIVMSG $chanserv :SOP $channel ADD $user"
    putserv "PRIVMSG $chan :Added $user to the SuperOp (SOP) list."
}

# Procedure to delete a user from the SOP list
proc del_sop {nick uhost hand chan text} {
    global channel chanserv

    if {$chan != $channel} {
        return
    }

    set params [split $text]
    if {[llength $params] < 1} {
        putserv "PRIVMSG $chan :Usage: !delsop <nickname>"
        return
    }

    set user [lindex $params 0]
    putserv "PRIVMSG $chanserv :SOP $channel DEL $user"
    putserv "PRIVMSG $chan :Removed $user from the SuperOp (SOP) list."
}

# Procedure to add a user to the HOP list
proc add_hop {nick uhost hand chan text} {
    global channel chanserv

    if {$chan != $channel} {
        return
    }

    set params [split $text]
    if {[llength $params] < 1} {
        putserv "PRIVMSG $chan :Usage: !addhop <nickname>"
        return
    }

    set user [lindex $params 0]
    putserv "PRIVMSG $chanserv :HOP $channel ADD $user"
    putserv "PRIVMSG $chan :Added $user to the HalfOp (HOP) list."
}

# Procedure to delete a user from the HOP list
proc del_hop {nick uhost hand chan text} {
    global channel chanserv

    if {$chan != $channel} {
        return
    }

    set params [split $text]
    if {[llength $params] < 1} {
        putserv "PRIVMSG $chan :Usage: !delhop <nickname>"
        return
    }

    set user [lindex $params 0]
    putserv "PRIVMSG $chanserv :HOP $channel DEL $user"
    putserv "PRIVMSG $chan :Removed $user from the HalfOp (HOP) list."
}

# Procedure to add a user to the VOP list
proc add_vop {nick uhost hand chan text} {
    global channel chanserv

    if {$chan != $channel} {
        return
    }

    set params [split $text]
    if {[llength $params] < 1} {
        putserv "PRIVMSG $chan :Usage: !addvop <nickname>"
        return
    }

    set user [lindex $params 0]
    putserv "PRIVMSG $chanserv :VOP $channel ADD $user"
    putserv "PRIVMSG $chan :Added $user to the VOp (VOP) list."
}

# Procedure to delete a user from the VOP list
proc del_hop {nick uhost hand chan text} {
    global channel chanserv

    if {$chan != $channel} {
        return
    }

    set params [split $text]
    if {[llength $params] < 1} {
        putserv "PRIVMSG $chan :Usage: !delvop <nickname>"
        return
    }

    set user [lindex $params 0]
    putserv "PRIVMSG $chanserv :VOP $channel DEL $user"
    putserv "PRIVMSG $chan :Removed $user from the VOp (VOP) list."
}

putlog "Chanserv Access Script Made By aslpls"
