import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Layout.NoBorders
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spacing

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myTerminal = "kitty"

-- Colors from https://draculatheme.com/contribute
colorBlack  = "#282a36"
colorGray   = "#44475a"
colorWhite  = "#f8f8f2"
colorBlue   = "#6272a4"
colorCyan   = "#8be9fd"
colorGreen  = "#50fa7b"
colorOrange = "#ffb86c"
colorPink   = "#ff79c6"
colorPurple = "#bd93f9"
colorRed    = "#ff5555"
colorYellow = "#f1fa8c"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
myBorderWidth = 2

-- Left-Alt: mod1Mask, Right-Alt: mod3Mask, Super/Win: mod4Mask
myModMask = mod1Mask

myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

-- Border colors for unfocused and focused windows, respectively.
myNormalBorderColor  = colorGray
myFocusedBorderColor = colorGreen

-- Key bindings. Add, modify or remove key bindings here.
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [
        ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf), -- terminal
        ((modm,               xK_space ), spawn "sh ~/.config/rofi/scripts/launcher.sh"), -- rofi launcher
        ((modm .|. shiftMask, xK_q     ), kill), -- kill window
        ((modm,               xK_l     ), sendMessage NextLayout), -- change layout
        ((modm .|. shiftMask, xK_l     ), setLayout $ XMonad.layoutHook conf), -- reset layout
        ((modm,               xK_n     ), refresh), -- reset window size
        ((modm,               xK_Tab   ), windows W.focusDown), -- next window
        ((modm,               xK_Right ), windows W.focusDown), -- next window
        ((modm,               xK_Down  ), windows W.focusDown), -- next window
        ((modm,               xK_Left  ), windows W.focusUp), -- previous window
        ((modm,               xK_Up    ), windows W.focusUp), -- previous window
        ((modm,               xK_m     ), windows W.focusMaster), -- focus master window
        ((modm,               xK_Return), windows W.swapMaster), -- swap focused window with master
        ((modm .|. shiftMask, xK_Right ), windows W.swapDown), -- swap focused with next
        ((modm .|. shiftMask, xK_Down  ), windows W.swapDown), -- swap focused with next
        ((modm .|. shiftMask, xK_Left  ), windows W.swapUp), -- swap focused with previous
        ((modm .|. shiftMask, xK_Up    ), windows W.swapUp), -- swap focused with previous
        ((modm,               xK_t     ), withFocused $ windows . W.sink), -- unfloat window
        ((modm,               xK_comma ), sendMessage (IncMasterN 1)), -- more master windows
        ((modm,               xK_period), sendMessage (IncMasterN (-1))), -- less master windows
        ((modm .|. shiftMask, xK_e     ), spawn "sh ~/.config/rofi/scripts/powermenu.sh"), -- rofi power menu
        ((modm .|. shiftMask, xK_r     ), spawn "xmonad --recompile; killall xmobar; xmonad --restart"), -- reload xmonad and xmobar
        ((modm .|. shiftMask, xK_comma ), spawn "amixer -q -D pulse sset Master 5%+"), -- increase vol
        ((modm .|. shiftMask, xK_period), spawn "amixer -q -D pulse sset Master 5%-"), -- decrease vol
        ((0,                  xK_Print ), spawn "flameshot gui") -- screenshot
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts (centerFocus ||| smartBorders Full)
  where
     -- default tiling algorithm partitions the screen into two panes
     centerFocus = spacingWithEdge 5 $ ThreeColMid nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [
        className =? "MPlayer"            --> doFloat,
        className =? "arandr"             --> doFloat,
        className =? "dunst"              --> doFloat,
        className =? "galculator"         --> doFloat,
        className =? "Galculator"         --> doFloat,
        className =? "battle.net.exe"     --> doFloat,
        className =? "leagueclientux.exe" --> doFloat,
        className =? "steam_app_0"        --> doFloat,
        resource  =? "desktop_window"     --> doIgnore,
        resource  =? "kdesktop"           --> doIgnore
    ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
    spawnOnce "feh --bg-scale ~/wallpaper.png &"
    spawnOnce "nm-applet &"
    spawnOnce "dunst -config ~/.config/dunst/dunstrc &"
    spawnOnce "stalonetray &"
    spawnOnce "fcitx5 &"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

myXmobarPP :: PP
myXmobarPP = def
    {
        ppSep = "",
        ppTitleSanitize = xmobarStrip,
        ppCurrent = wrap " " " " . green,
        ppHidden = wrap " " " " . white,
        ppHiddenNoWindows = wrap " " " " . gray,
        ppUrgent = red . wrap (yellow "!") (yellow "!"),
        ppOrder = \[ws, l, _, wins] -> [ws],
        ppExtras = [logTitles formatFocused formatUnfocused]
    }
    where
        formatFocused = wrap (white "[") (white "]") . green . ppWindow
        formatUnfocused = wrap (white "[") (white "]") . white . ppWindow
        ppWindow :: String -> String
        ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30
        white, green, red, yellow :: String -> String
        white  = xmobarColor colorWhite ""
        green  = xmobarColor colorGreen ""
        red    = xmobarColor colorRed ""
        yellow = xmobarColor colorYellow ""
        gray   = xmobarColor colorGray ""

-- Run xmonad with the settings you specify. No need to modify this.
--main = do
--    xmproc <- spawnPipe "xmobar -d -x 0 ~/.config/xmobar/xmobar.hs"
--     xmonad $ docks defaults
main :: IO ()
main = xmonad
    . ewmhFullscreen
    . ewmh
    . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
    $ defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
