cmake_minimum_required(VERSION 3.0.2)
project(turtlesim_game)

find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  rospy
  std_msgs
  turtlesim
  message_generation
)

add_message_files(
  FILES
  GameStats.msg
)

add_service_files(
  FILES
  GetGameStats.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS geometry_msgs rospy std_msgs turtlesim message_runtime
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)
