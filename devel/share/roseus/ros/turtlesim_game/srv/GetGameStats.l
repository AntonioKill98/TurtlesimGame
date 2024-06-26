;; Auto-generated. Do not edit!


(when (boundp 'turtlesim_game::GetGameStats)
  (if (not (find-package "TURTLESIM_GAME"))
    (make-package "TURTLESIM_GAME"))
  (shadow 'GetGameStats (find-package "TURTLESIM_GAME")))
(unless (find-package "TURTLESIM_GAME::GETGAMESTATS")
  (make-package "TURTLESIM_GAME::GETGAMESTATS"))
(unless (find-package "TURTLESIM_GAME::GETGAMESTATSREQUEST")
  (make-package "TURTLESIM_GAME::GETGAMESTATSREQUEST"))
(unless (find-package "TURTLESIM_GAME::GETGAMESTATSRESPONSE")
  (make-package "TURTLESIM_GAME::GETGAMESTATSRESPONSE"))

(in-package "ROS")





(defclass turtlesim_game::GetGameStatsRequest
  :super ros::object
  :slots ())

(defmethod turtlesim_game::GetGameStatsRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass turtlesim_game::GetGameStatsResponse
  :super ros::object
  :slots (_catches _average_time _game_status ))

(defmethod turtlesim_game::GetGameStatsResponse
  (:init
   (&key
    ((:catches __catches) 0)
    ((:average_time __average_time) 0.0)
    ((:game_status __game_status) "")
    )
   (send-super :init)
   (setq _catches (round __catches))
   (setq _average_time (float __average_time))
   (setq _game_status (string __game_status))
   self)
  (:catches
   (&optional __catches)
   (if __catches (setq _catches __catches)) _catches)
  (:average_time
   (&optional __average_time)
   (if __average_time (setq _average_time __average_time)) _average_time)
  (:game_status
   (&optional __game_status)
   (if __game_status (setq _game_status __game_status)) _game_status)
  (:serialization-length
   ()
   (+
    ;; int32 _catches
    4
    ;; float32 _average_time
    4
    ;; string _game_status
    4 (length _game_status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _catches
       (write-long _catches s)
     ;; float32 _average_time
       (sys::poke _average_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _game_status
       (write-long (length _game_status) s) (princ _game_status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _catches
     (setq _catches (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _average_time
     (setq _average_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _game_status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _game_status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass turtlesim_game::GetGameStats
  :super ros::object
  :slots ())

(setf (get turtlesim_game::GetGameStats :md5sum-) "7c5d5a8df822594016cbcf60c0ddc011")
(setf (get turtlesim_game::GetGameStats :datatype-) "turtlesim_game/GetGameStats")
(setf (get turtlesim_game::GetGameStats :request) turtlesim_game::GetGameStatsRequest)
(setf (get turtlesim_game::GetGameStats :response) turtlesim_game::GetGameStatsResponse)

(defmethod turtlesim_game::GetGameStatsRequest
  (:response () (instance turtlesim_game::GetGameStatsResponse :init)))

(setf (get turtlesim_game::GetGameStatsRequest :md5sum-) "7c5d5a8df822594016cbcf60c0ddc011")
(setf (get turtlesim_game::GetGameStatsRequest :datatype-) "turtlesim_game/GetGameStatsRequest")
(setf (get turtlesim_game::GetGameStatsRequest :definition-)
      "---
int32 catches
float32 average_time
string game_status

")

(setf (get turtlesim_game::GetGameStatsResponse :md5sum-) "7c5d5a8df822594016cbcf60c0ddc011")
(setf (get turtlesim_game::GetGameStatsResponse :datatype-) "turtlesim_game/GetGameStatsResponse")
(setf (get turtlesim_game::GetGameStatsResponse :definition-)
      "---
int32 catches
float32 average_time
string game_status

")



(provide :turtlesim_game/GetGameStats "7c5d5a8df822594016cbcf60c0ddc011")


