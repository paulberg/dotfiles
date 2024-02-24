; Only one instance of script can run.
; Reload if a second instance starts.
#SingleInstance Force

; Define komorebi functions
#Include komorebic.lib.ahk

; Tell komorebi to use it's config directory
EnvSet("KOMOREBI_CONFIG_HOME", EnvGet("USERPROFILE") "\.config\komorebi")

; Make sure keyboard stays in good state.
SetCapsLockState "AlwaysOff"
SetNumLockState "AlwaysOn"

; Turn off modifier keys doing actions by themselves.
*~LWin::
*~RWin::
*~LAlt::
*~RAlt:: {
  Send "{Blind}{vkFF}"
}


#!^r::Reload

; This will force the wm to stop, then restart on reload.
; We don't just use stop because it hangs if komorebi isn't running.
#!^+r:: {
  DetectHiddenWindows(true)
  if WinExist("ahk_class komorebi-hidden") Stop()
  Reload
}

; Focus windows
#!Left::Focus("left")
#!Down::Focus("down")
#!Up::Focus("up")
#!Right::Focus("right")
#!+Tab::CycleFocus("previous")
#!Tab::CycleFocus("next")

; Move windows
#!+Left::Move("left")
#!+Down::Move("down")
#!+Up::Move("up")
#!+Right::Move("right")
#!+Enter::Promote()

; Stack windows
#Left::Stack("left")
#Right::Stack("right")
#Up::Stack("up")
#Down::Stack("down")
#Esc::Unstack()
#+Tab::CycleStack("previous")
#Tab::CycleStack("next")

; Resize
#+::ResizeAxis("horizontal", "increase")
#-::ResizeAxis("horizontal", "decrease")
#*::ResizeAxis("vertical", "increase")
#/::ResizeAxis("vertical", "decrease")

; Manipulate windows
#+t::ToggleFloat()
#t::ToggleMonocle()

; Window manager options
#+r::Retile()
;!p::TogglePause()

; Layouts
;!x::FlipLayout(horizontal")
;!y::FlipLayout("vertical")

; Workspaces
;!1::FocusWorkspace(0)
;!2::FocusWorkspace(1)
;!3::FocusWorkspace(2)

; Move windows across workspaces
;!+1::MoveToWorkspace(0)
;!+2::MoveToWorkspace(1)
;!+3::MoveToWorkspace(2)

; Start the window manager
DetectHiddenWindows(true)

if not WinExist("ahk_class komorebi-hidden") {
  Start()
}
