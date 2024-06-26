
(cl:in-package :asdf)

(defsystem "turtlesim_game-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetGameStats" :depends-on ("_package_GetGameStats"))
    (:file "_package_GetGameStats" :depends-on ("_package"))
  ))