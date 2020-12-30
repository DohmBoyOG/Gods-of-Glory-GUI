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
local rage_selector = kickOptions:CreateSelector('Player: ', function() return; end, function() return game.Players:GetPlayers() end)
local targetplayer = kickOptions:CreateButton('Kick Player', function() spawn(targetPlayer) end)
local specialOptions = lpg:CreateSection('Special Options')
local guardGod = specialOptions:CreateButton('Guard Godmode', function() spawn(gGod) end)
local relic = specialOptions:CreateButton('Give Relic', function() game:GetService("ReplicatedStorage").Remotes.Relic:InvokeServer() end)
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

function targetPlayer()
    if rage_selector:GetValue() ~= thisPlayer and rage_selector:GetValue() ~= nil then
        remote:FireServer({
            ["OtherCharacter"] = rage_selector:GetValue().Character,
            ["LV"] = Vector3.new(math.random(5000), math.random(5000), math.random(5000))
            })
    end
    end

function gGod()
    local gmt = getrawmetatable(game)
    local old = gmt.__namecall
    
    setreadonly(gmt, false)
    
    gmt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" and self.Name == "DealDamage" then
        print('Nothing can Stop us now!')
        return nil
    end
    return old(self, ...)
end)

setreadonly(gmt, true)
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



