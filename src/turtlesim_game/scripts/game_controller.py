#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from turtlesim.msg import Pose
from std_srvs.srv import Empty
from std_msgs.msg import String
from turtlesim_game.msg import GameStats
from turtlesim_game.srv import GetGameStats, GetGameStatsResponse
import random
import math
import turtlesim.srv
import os
import signal
import time

# Global variables
turtle1_pose = Pose()
turtle2_pose = Pose()
game_over = False
turtle1_vel = Twist()
turtle2_vel = Twist()
wall_touch_time = 0
touching_wall = False
start_time = 0
catches = 0
total_time = 0.0

def turtle1_pose_callback(msg):
    global turtle1_pose
    turtle1_pose = msg

def turtle2_pose_callback(msg):
    global turtle2_pose, wall_touch_time, touching_wall
    turtle2_pose = msg

    # Check if turtle2 is touching the wall
    if turtle2_pose.x <= 0.1 or turtle2_pose.x >= 10.9 or turtle2_pose.y <= 0.1 or turtle2_pose.y >= 10.9:
        if not touching_wall:
            touching_wall = True
            wall_touch_time = time.time()
        elif time.time() - wall_touch_time >= 1.0:
            teleport_turtle2()
            touching_wall = False
    else:
        touching_wall = False

def distance(pose1, pose2):
    return math.sqrt((pose1.x - pose2.x)**2 + (pose1.y - pose2.y)**2)

def teleport_turtle2():
    if turtle2_pose.x <= 0.1:
        new_x = 10.8
    elif turtle2_pose.x >= 10.9:
        new_x = 0.2
    else:
        new_x = turtle2_pose.x

    if turtle2_pose.y <= 0.1:
        new_y = 10.8
    elif turtle2_pose.y >= 10.9:
        new_y = 0.2
    else:
        new_y = turtle2_pose.y

    rospy.wait_for_service('/turtle2/teleport_absolute')
    try:
        teleport_turtle = rospy.ServiceProxy('/turtle2/teleport_absolute', turtlesim.srv.TeleportAbsolute)
        teleport_turtle(new_x, new_y, turtle2_pose.theta)
    except rospy.ServiceException as e:
        rospy.logerr("Service call failed: %s", e)

def stop_turtle2(msg):
    global game_over, turtle1_vel, turtle2_vel
    if msg.data == "z":
        turtle2_vel = Twist()  # Stop turtle2
        rospy.loginfo("La Preda è immobile !!")
        game_event_pub.publish(GameStats(time_to_catch=0.0, game_status="La Preda è immobile !!"))
    elif msg.data == "v":
        rospy.signal_shutdown("Terminating program")  # Shut down the node
        os.system("killall -9 roscore; killall -9 rosmaster")  # Ensure all ROS processes are killed
    elif msg.data == "w":
        turtle1_vel.linear.x = 2.0
        turtle1_vel.angular.z = 0
    elif msg.data == "s":
        turtle1_vel.linear.x = -2.0
        turtle1_vel.angular.z = 0
    elif msg.data == "a":
        turtle1_vel.linear.x = 0
        turtle1_vel.angular.z = 2.0
    elif msg.data == "d":
        turtle1_vel.linear.x = 0
        turtle1_vel.angular.z = -2.0
    elif msg.data == "r" and game_over:
        reset_game()
    else:
        turtle1_vel.linear.x = 0
        turtle1_vel.angular.z = 0

def reset_game():
    global game_over, start_time
    reset_turtles = rospy.ServiceProxy('reset', Empty)
    reset_turtles()
    rospy.set_param('/turtle1/x', 5.5)
    rospy.set_param('/turtle1/y', 5.5)
    rospy.set_param('/turtle2/x', random.uniform(1, 10))
    rospy.set_param('/turtle2/y', random.uniform(1, 10))
    turtle1_vel = Twist()
    turtle2_vel = Twist()
    game_over = False
    spawn_turtle('turtle2', random.uniform(1, 10), random.uniform(1, 10))
    rospy.loginfo("Game reset! Catch the turtle again.")
    game_event_pub.publish(GameStats(time_to_catch=0.0, game_status="Il Gioco è iniziato"))
    start_time = time.time()

def handle_get_game_stats(req):
    average_time = total_time / catches if catches > 0 else 0.0
    game_status = "In corso" if not game_over else "Finito"
    return GetGameStatsResponse(catches=catches, average_time=average_time, game_status=game_status)

def spawn_turtle(name, x, y):
    rospy.wait_for_service('/spawn')
    try:
        spawn_turtle = rospy.ServiceProxy('/spawn', turtlesim.srv.Spawn)
        spawn_turtle(x, y, 0, name)
    except rospy.ServiceException as e:
        rospy.logerr("Service call failed: %s", e)

def main():
    global game_event_pub, game_over, start_time, catches, total_time
    try:
        rospy.init_node('turtlesim_game_controller')

        # Publishers
        turtle1_vel_pub = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
        turtle2_vel_pub = rospy.Publisher('/turtle2/cmd_vel', Twist, queue_size=10)
        game_event_pub = rospy.Publisher('/game_event', GameStats, queue_size=10)

        # Subscribers
        rospy.Subscriber('/turtle1/pose', Pose, turtle1_pose_callback)
        rospy.Subscriber('/turtle2/pose', Pose, turtle2_pose_callback)
        rospy.Subscriber('/keyboard_input', String, stop_turtle2)

        # Services
        rospy.Service('get_game_stats', GetGameStats, handle_get_game_stats)
        rospy.wait_for_service('reset')
        reset_turtles = rospy.ServiceProxy('reset', Empty)
        reset_turtles()

        # Spawn turtle2
        spawn_turtle('turtle2', random.uniform(1, 10), random.uniform(1, 10))

        # Initial positions
        rospy.set_param('/turtle1/x', 5.5)
        rospy.set_param('/turtle1/y', 5.5)

        rate = rospy.Rate(10)  # 10 Hz
        game_event_pub.publish(GameStats(time_to_catch=0.0, game_status="Il Gioco è iniziato"))
        start_time = time.time()
        while not rospy.is_shutdown():
            if not game_over:
                # Move turtle1 based on keyboard input
                turtle1_vel_pub.publish(turtle1_vel)

                # Move turtle2 randomly if close to turtle1
                if distance(turtle1_pose, turtle2_pose) < 2.0:
                    turtle2_vel.linear.x = random.uniform(-4, 4)
                    turtle2_vel.linear.y = random.uniform(-4, 4)
                turtle2_vel_pub.publish(turtle2_vel)

                if distance(turtle1_pose, turtle2_pose) < 1.0:
                    end_time = time.time()
                    time_to_catch = end_time - start_time
                    rospy.loginfo("\n\nHai preso la tartaruga fuggitiva! Premi 'r' per resettare la partita.\n\n")
                    game_event_pub.publish(GameStats(time_to_catch=time_to_catch, game_status="Il Gioco è finito"))
                    catches += 1
                    total_time += time_to_catch
                    game_over = True
         
            rate.sleep()
    except rospy.ROSInterruptException:
        pass
    except Exception as e:
        rospy.logerr("An error occurred: %s", e)

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
