local config = {
   ["HeaderWidth"] = 200,
   ['PrimaryColor'] = Color3.fromRGB(166, 167, 159),
   ['SecondaryColor'] = Color3.fromRGB(73, 103, 123),
   ["AccentColor"] = Color3.new(0.6,0,0)
}

--- GUI Setup ---
local gui = loadstring(game:HttpGet("https://gitlab.com/0x45.xyz/droplib/-/raw/master/drop-minified.lua"))():Init(config,game.CoreGui)
local lpg = gui:CreateCategory("Mana Options ", UDim2.new(0, 400, 0, 100))
--- GUI Setup --

-- Button Setup --
local giveMana = lpg:CreateButton('Give [Mana]', function() autoMana() end)


--- Options ---
local mOptions = lpg:CreateSection('Manual Options')
local manaAmount = mOptions:CreateTextBox('How Much Many?')
local mMana = mOptions:CreateButton('Give [Mana]', function()  local monies = manaAmount:GetValue() giveAmount(monies) end, '^d+$')
local Exit = lpg:CreateButton("Exit",function() gui:CleanUp() end)

--- Stuff ---
mOptions:Collapse()

--- Functions Setup --- 

function autoMana()
    local remote = game:GetService("ReplicatedStorage").Remotes.GiveMana
    remote:FireServer({
        ["Value"] = '1e+18'
    })
end

function giveAmount(m)
    local remote = game:GetService("ReplicatedStorage").Remotes.GiveMana
    remote:FireServer({
        ["Value"] = m
    })
end


