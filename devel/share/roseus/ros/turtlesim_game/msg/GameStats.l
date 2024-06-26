;; Auto-generated. Do not edit!


(when (boundp 'turtlesim_game::GameStats)
  (if (not (find-package "TURTLESIM_GAME"))
    (make-package "TURTLESIM_GAME"))
  (shadow 'GameStats (find-package "TURTLESIM_GAME")))
(unless (find-package "TURTLESIM_GAME::GAMESTATS")
  (make-package "TURTLESIM_GAME::GAMESTATS"))

(in-package "ROS")
;;//! \htmlinclude GameStats.msg.html


(defclass turtlesim_game::GameStats
  :super ros::object
  :slots (_time_to_catch _game_status ))

(defmethod turtlesim_game::GameStats
  (:init
   (&key
    ((:time_to_catch __time_to_catch) 0.0)
    ((:game_status __game_status) "")
    )
   (send-super :init)
   (setq _time_to_catch (float __time_to_catch))
   (setq _game_status (string __game_status))
   self)
  (:time_to_catch
   (&optional __time_to_catch)
   (if __time_to_catch (setq _time_to_catch __time_to_catch)) _time_to_catch)
  (:game_status
   (&optional __game_status)
   (if __game_status (setq _game_status __game_status)) _game_status)
  (:serialization-length
   ()
   (+
    ;; float32 _time_to_catch
    4
    ;; string _game_status
    4 (length _game_status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _time_to_catch
       (sys::poke _time_to_catch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _game_status
       (write-long (length _game_status) s) (princ _game_status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _time_to_catch
     (setq _time_to_catch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _game_status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _game_status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get turtlesim_game::GameStats :md5sum-) "26961f3470581d1619e4ee331e4dca0d")
(setf (get turtlesim_game::GameStats :datatype-) "turtlesim_game/GameStats")
(setf (get turtlesim_game::GameStats :definition-)
      "float32 time_to_catch
string game_status

")



(provide :turtlesim_game/GameStats "26961f3470581d1619e4ee331e4dca0d")


