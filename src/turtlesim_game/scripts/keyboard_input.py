#!/usr/bin/env python

import rospy
from std_msgs.msg import String
import sys
import select
import tty
import termios
import os

def get_key():
    tty.setraw(sys.stdin.fileno())
    select.select([sys.stdin], [], [], 0)
    key = sys.stdin.read(1)
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, termios.tcgetattr(sys.stdin))
    return key

def main():
    rospy.init_node('keyboard_input_node')
    pub = rospy.Publisher('/keyboard_input', String, queue_size=10)

    rate = rospy.Rate(10)  # 10 Hz
    while not rospy.is_shutdown():
        key = get_key()
        if key:
            rospy.loginfo("Key pressed: %s", key)
            pub.publish(key)
            if key == 'v':  # If key is 'v', shutdown all nodes
                rospy.signal_shutdown("Terminating program")
                os.system("killall -9 roscore; killall -9 rosmaster")
        rate.sleep()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
