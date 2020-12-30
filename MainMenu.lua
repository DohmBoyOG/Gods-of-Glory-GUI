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
local Mana = lpg:CreateButton('Mana Options', function() loadstring(game:HttpGet(('https://raw.githubusercontent.com/DohmBoyOG/Gods-of-Glory-GUI/main/Menus/Mana.lua'),true))() end)
local Codes = lpg:CreateButton('Twitter Codes', function() twitterCodes() end)
local Player = lpg:CreateButton('Player Fun', function() loadstring(game:HttpGet(('https://raw.githubusercontent.com/DohmBoyOG/Gods-of-Glory-GUI/main/Menus/Player.lua'),true))() end)
local World = lpg:CreateButton('World Fun', function() loadstring(game:HttpGet(('https://raw.githubusercontent.com/DohmBoyOG/Gods-of-Glory-GUI/main/Menus/World.lua'),true))() end) 
local Teleport = lpg:CreateButton('Teleports', function() print('SOOOOOOOOOON') end)
local Exit = lpg:CreateButton("Exit",function() gui:CleanUp() end)
local Credits = lpg:CreateTextLabel('Made By DohmBoyOG')
--- Main Menu ---

--- Functions Setup --

function twitterCodes()
    codes = require(game:GetService("ReplicatedStorage").Sandbox.Codes).YoutuberCodes
    print('----------- Begin Twitter Codes -----------')
    for code, youtuber in pairs(codes) do
    --game:GetService("ReplicatedStorage").Remotes.CodeItem:InvokeServer({
       -- ["Value"] = code
    --})
    --wait(20)
    print('[Code]: '..code..' [Youtuber:] '..youtuber)
   end
   print('------------- End Twitter Codes -------------')
end
