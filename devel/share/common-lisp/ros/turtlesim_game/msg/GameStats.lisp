; Auto-generated. Do not edit!


(cl:in-package turtlesim_game-msg)


;//! \htmlinclude GameStats.msg.html

(cl:defclass <GameStats> (roslisp-msg-protocol:ros-message)
  ((time_to_catch
    :reader time_to_catch
    :initarg :time_to_catch
    :type cl:float
    :initform 0.0)
   (game_status
    :reader game_status
    :initarg :game_status
    :type cl:string
    :initform ""))
)

(cl:defclass GameStats (<GameStats>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GameStats>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GameStats)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtlesim_game-msg:<GameStats> is deprecated: use turtlesim_game-msg:GameStats instead.")))

(cl:ensure-generic-function 'time_to_catch-val :lambda-list '(m))
(cl:defmethod time_to_catch-val ((m <GameStats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim_game-msg:time_to_catch-val is deprecated.  Use turtlesim_game-msg:time_to_catch instead.")
  (time_to_catch m))

(cl:ensure-generic-function 'game_status-val :lambda-list '(m))
(cl:defmethod game_status-val ((m <GameStats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim_game-msg:game_status-val is deprecated.  Use turtlesim_game-msg:game_status instead.")
  (game_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GameStats>) ostream)
  "Serializes a message object of type '<GameStats>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'time_to_catch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'game_status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'game_status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GameStats>) istream)
  "Deserializes a message object of type '<GameStats>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time_to_catch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'game_status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'game_status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GameStats>)))
  "Returns string type for a message object of type '<GameStats>"
  "turtlesim_game/GameStats")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GameStats)))
  "Returns string type for a message object of type 'GameStats"
  "turtlesim_game/GameStats")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GameStats>)))
  "Returns md5sum for a message object of type '<GameStats>"
  "26961f3470581d1619e4ee331e4dca0d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GameStats)))
  "Returns md5sum for a message object of type 'GameStats"
  "26961f3470581d1619e4ee331e4dca0d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GameStats>)))
  "Returns full string definition for message of type '<GameStats>"
  (cl:format cl:nil "float32 time_to_catch~%string game_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GameStats)))
  "Returns full string definition for message of type 'GameStats"
  (cl:format cl:nil "float32 time_to_catch~%string game_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GameStats>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'game_status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GameStats>))
  "Converts a ROS message object to a list"
  (cl:list 'GameStats
    (cl:cons ':time_to_catch (time_to_catch msg))
    (cl:cons ':game_status (game_status msg))
))
