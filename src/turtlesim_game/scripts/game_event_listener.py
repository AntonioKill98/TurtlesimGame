#!/usr/bin/env python

import rospy
from turtlesim_game.msg import GameStats

def game_event_callback(msg):
    if msg.game_status == "Il Gioco è iniziato":
        rospy.loginfo("\n\nBenvenuto nell'inseguimento più veloce di sempre!!\n"
                      "Usa (W A S D) per muovere la tua tartaruga,\n"
                      "premi 'z' per bloccare la preda,\n"
                      "premi 'r' per resettare una partita terminata,\n"
                      "premi 'v' per chiudere il gioco.\n")
        rospy.loginfo("Game Event: %s", msg.game_status)
    elif msg.game_status == "Il Gioco è finito":
        rospy.loginfo("Game Event: %s", msg.game_status)
        rospy.loginfo("Il Gioco è Finito: hai preso la tartaruga fuggitiva in %.2f secondi." % msg.time_to_catch)
    else:
        rospy.loginfo("Game Event: %s", msg.game_status)

def main():
    rospy.init_node('game_event_listener')
    rospy.Subscriber('/game_event', GameStats, game_event_callback)

    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
