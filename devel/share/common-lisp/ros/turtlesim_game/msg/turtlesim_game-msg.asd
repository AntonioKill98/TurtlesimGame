
(cl:in-package :asdf)

(defsystem "turtlesim_game-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GameStats" :depends-on ("_package_GameStats"))
    (:file "_package_GameStats" :depends-on ("_package"))
  ))