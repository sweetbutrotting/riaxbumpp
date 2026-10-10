
# BumppLib

A clean, pink UI library for Roblox. Draggable window, sidebar tabs, welcome card, color picker, hide keybind and smooth animations.


<img width="637" height="413" alt="image" src="https://github.com/user-attachments/assets/1fecf800-c474-416e-99ac-c2e820dd9574" />
<img width="635" height="412" alt="image" src="https://github.com/user-attachments/assets/6e18c246-a2ea-48ec-aa9a-616e4d5babe0" />
<img width="633" height="413" alt="image" src="https://github.com/user-attachments/assets/15034090-e19a-49ba-a57a-f742a012e227" />


## Features

- Draggable window (drag the top bar), minimize and close buttons
- Sidebar tabs with animated page transitions
- Welcome card (avatar + display name) and a welcome notification
- Hide / show keybind (default `RightShift`), rebindable at runtime
- Elements: Section, Label, Button, Toggle, Slider, Dropdown, Keybind, Textbox, ColorPicker
- Color picker with saturation/value box, hue bar and hex input
- Live accent color: change it once and the whole UI follows
- Notifications, mobile open button, auto-fit on small screens

## Install

**Quick start:** paste `PinkLib.lua` into a `LocalScript` in `StarterPlayer > StarterPlayerScripts`.

**As a module:** put everything above the `EXAMPLE` marker in a `ModuleScript`, add `return Library` at the end, then:

```lua
local Library = require(path.to.BumppLib)
```

## Usage

```lua
local Window = Library:CreateWindow({
	Title = "Bumpp",
	Subtitle = "Hub",
	ToggleKey = Enum.KeyCode.RightShift,
})

local Main = Window:CreateTab("Main")

Main:AddSection("Example")
Main:AddToggle({ Name = "My toggle", Flag = "MyToggle", Callback = function(on) print(on) end })
Main:AddSlider({ Name = "Speed", Min = 0, Max = 100, Default = 50, Callback = function(v) print(v) end })
```

## API

| Call | Description |
| --- | --- |
| `Library:CreateWindow({ Title, Subtitle, ToggleKey, Width, Height, Accent, Welcome, MobileButton })` | Creates a window |
| `Window:CreateTab(name, icon?)` | Adds a tab (`icon` is an optional `rbxassetid://` string) |
| `Tab:AddSection(name)` | Section header |
| `Tab:AddLabel(text)` | Text block |
| `Tab:AddButton({ Name, Callback })` | Button |
| `Tab:AddToggle({ Name, Default, Flag, Callback })` | Toggle |
| `Tab:AddSlider({ Name, Min, Max, Default, Increment, Suffix, Flag, Callback })` | Slider |
| `Tab:AddDropdown({ Name, Options, Default, Flag, Callback })` | Dropdown (`:Refresh(newOptions)`) |
| `Tab:AddKeybind({ Name, Default, Callback, Changed })` | Keybind |
| `Tab:AddTextbox({ Name, Placeholder, Numeric, Callback })` | Textbox |
| `Tab:AddColorPicker({ Name, Default, Flag, Callback })` | Color picker |
| `Window:Notify({ Title, Content, Duration })` | Notification |
| `Window:SetAccent(color)` | Change the accent color |
| `Window:SetToggleKey(keyCode)` | Change the hide / show key |
| `Window:Toggle()` / `Window:Destroy()` | Show or hide / remove the UI |

Every element returns an object with `:Set(value)` and `.Value`. Elements given a `Flag` also write their value to `Library.Flags[flag]`.

## Customizing

Colors live in the `T` table near the top of the file.

## License

MIT, see [LICENSE](LICENSE).
