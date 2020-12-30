local config = {
   ["HeaderWidth"] = 200,
   ['PrimaryColor'] = Color3.fromRGB(166, 167, 159),
   ['SecondaryColor'] = Color3.fromRGB(73, 103, 123),
   ["AccentColor"] = Color3.new(0.6,0,0)
}

--- GUI Setup ---
local gui = loadstring(game:HttpGet("https://gitlab.com/0x45.xyz/droplib/-/raw/master/drop-minified.lua"))():Init(config,game.CoreGui)
local lpg = gui:CreateCategory("Gods Of Glory GUI ")
--- GUI Setup ---

--- Main Menu ---
local Mana = lpg:CreateButton('Mana Options')
local Codes = lpg:CreateButton('Twitter Codes')
local Player = lpg:CreateButton('Player Fun')
local World = lpg:CreateButton('World Fun')
local Teleport = lpg:CreateButton('Teleports')
local Exit = lpg:CreateButton("Exit",function() gui:CleanUp() end)
local Credits = lpg:CreateTextLabel('Made By DohmBoyOG')
--- Main Menu ---
