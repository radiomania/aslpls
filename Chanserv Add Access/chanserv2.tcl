# +-------------------------------------------------------------------------------------+
# |                                                                                     |
# |                   Chanserv Add Access (Aop, SOP) v2.0.0                             |
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

#Required to install - apt install tcllib-critcl

# Define the channel and ChanServ nickname
set channel "#aslpls"
set chanserv "ChanServ@services.dal.net"

# Bind public commands for AOP, SOP, and HOP management
bind pub - "!addaop" {manage_list "ADD" "AOP" "Added"}
bind pub - "!delaop" {manage_list "DEL" "AOP" "Removed"}
bind pub - "!addsop" {manage_list "ADD" "SOP" "Added"}
bind pub - "!delsop" {manage_list "DEL" "SOP" "Removed"}
bind pub - "!addhop" {manage_list "ADD" "HOP" "Added"}
bind pub - "!delhop" {manage_list "DEL" "HOP" "Removed"}
bind pub - "!addvop" {manage_list "ADD" "VOP" "Added"}
bind pub - "!delvop" {manage_list "DEL" "VOP" "Removed"}

# Generalized procedure to manage user lists (AOP, SOP, HOP, VOP)
proc manage_list {action list_type action_message nick uhost hand chan text} {
    global channel chanserv

    if {$chan != $channel} {
        return
    }

    set params [split $text]
    if {[llength $params] < 1} {
        putserv "PRIVMSG $chan :Usage: !${list_type,,} <nickname>"
        return
    }

    set user [lindex $params 0]
    putserv "PRIVMSG $chanserv :$list_type $channel $action $user"
    putserv "PRIVMSG $chan :$action_message $user to the $list_type list."
}

putlog "Chanserv Access Script Made By aslpls"
