; Auto-generated. Do not edit!


(cl:in-package turtlesim_game-srv)


;//! \htmlinclude GetGameStats-request.msg.html

(cl:defclass <GetGameStats-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetGameStats-request (<GetGameStats-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetGameStats-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetGameStats-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtlesim_game-srv:<GetGameStats-request> is deprecated: use turtlesim_game-srv:GetGameStats-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetGameStats-request>) ostream)
  "Serializes a message object of type '<GetGameStats-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetGameStats-request>) istream)
  "Deserializes a message object of type '<GetGameStats-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetGameStats-request>)))
  "Returns string type for a service object of type '<GetGameStats-request>"
  "turtlesim_game/GetGameStatsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetGameStats-request)))
  "Returns string type for a service object of type 'GetGameStats-request"
  "turtlesim_game/GetGameStatsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetGameStats-request>)))
  "Returns md5sum for a message object of type '<GetGameStats-request>"
  "7c5d5a8df822594016cbcf60c0ddc011")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetGameStats-request)))
  "Returns md5sum for a message object of type 'GetGameStats-request"
  "7c5d5a8df822594016cbcf60c0ddc011")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetGameStats-request>)))
  "Returns full string definition for message of type '<GetGameStats-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetGameStats-request)))
  "Returns full string definition for message of type 'GetGameStats-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetGameStats-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetGameStats-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetGameStats-request
))
;//! \htmlinclude GetGameStats-response.msg.html

(cl:defclass <GetGameStats-response> (roslisp-msg-protocol:ros-message)
  ((catches
    :reader catches
    :initarg :catches
    :type cl:integer
    :initform 0)
   (average_time
    :reader average_time
    :initarg :average_time
    :type cl:float
    :initform 0.0)
   (game_status
    :reader game_status
    :initarg :game_status
    :type cl:string
    :initform ""))
)

(cl:defclass GetGameStats-response (<GetGameStats-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetGameStats-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetGameStats-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtlesim_game-srv:<GetGameStats-response> is deprecated: use turtlesim_game-srv:GetGameStats-response instead.")))

(cl:ensure-generic-function 'catches-val :lambda-list '(m))
(cl:defmethod catches-val ((m <GetGameStats-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim_game-srv:catches-val is deprecated.  Use turtlesim_game-srv:catches instead.")
  (catches m))

(cl:ensure-generic-function 'average_time-val :lambda-list '(m))
(cl:defmethod average_time-val ((m <GetGameStats-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim_game-srv:average_time-val is deprecated.  Use turtlesim_game-srv:average_time instead.")
  (average_time m))

(cl:ensure-generic-function 'game_status-val :lambda-list '(m))
(cl:defmethod game_status-val ((m <GetGameStats-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtlesim_game-srv:game_status-val is deprecated.  Use turtlesim_game-srv:game_status instead.")
  (game_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetGameStats-response>) ostream)
  "Serializes a message object of type '<GetGameStats-response>"
  (cl:let* ((signed (cl:slot-value msg 'catches)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'average_time))))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetGameStats-response>) istream)
  "Deserializes a message object of type '<GetGameStats-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'catches) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'average_time) (roslisp-utils:decode-single-float-bits bits)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetGameStats-response>)))
  "Returns string type for a service object of type '<GetGameStats-response>"
  "turtlesim_game/GetGameStatsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetGameStats-response)))
  "Returns string type for a service object of type 'GetGameStats-response"
  "turtlesim_game/GetGameStatsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetGameStats-response>)))
  "Returns md5sum for a message object of type '<GetGameStats-response>"
  "7c5d5a8df822594016cbcf60c0ddc011")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetGameStats-response)))
  "Returns md5sum for a message object of type 'GetGameStats-response"
  "7c5d5a8df822594016cbcf60c0ddc011")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetGameStats-response>)))
  "Returns full string definition for message of type '<GetGameStats-response>"
  (cl:format cl:nil "int32 catches~%float32 average_time~%string game_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetGameStats-response)))
  "Returns full string definition for message of type 'GetGameStats-response"
  (cl:format cl:nil "int32 catches~%float32 average_time~%string game_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetGameStats-response>))
  (cl:+ 0
     4
     4
     4 (cl:length (cl:slot-value msg 'game_status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetGameStats-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetGameStats-response
    (cl:cons ':catches (catches msg))
    (cl:cons ':average_time (average_time msg))
    (cl:cons ':game_status (game_status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetGameStats)))
  'GetGameStats-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetGameStats)))
  'GetGameStats-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetGameStats)))
  "Returns string type for a service object of type '<GetGameStats>"
  "turtlesim_game/GetGameStats")