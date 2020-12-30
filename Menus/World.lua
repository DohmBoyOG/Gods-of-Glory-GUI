worlds = game:GetService("Workspace").GameWorlds
remote = game:GetService("ReplicatedStorage").Remotes.BreakBuilding

local config = {
   ["HeaderWidth"] = 200,
   ['PrimaryColor'] = Color3.fromRGB(166, 167, 159),
   ['SecondaryColor'] = Color3.fromRGB(73, 103, 123),
   ["AccentColor"] = Color3.new(0.6,0,0)
}

--- GUI Setup ---
local gui = loadstring(game:HttpGet("https://gitlab.com/0x45.xyz/droplib/-/raw/master/drop-minified.lua"))():Init(config,game.CoreGui)
local lpg = gui:CreateCategory("World Fun Options ", UDim2.new(0, 400, 0, 100))
--- GUI Setup ---

local sDestruct = lpg:CreateButton('Self Destruct Worlds',function() spawn(function()
    for _, v in pairs(worlds:GetChildren()) do
        if v:IsA("Folder") then
            for _, destructs in pairs(v:GetDescendants()) do
                if destructs:IsA("Folder") and destructs.Name == "Destructibles" then
                    for _, begin in pairs(destructs:GetChildren()) do
                        remote:FireServer(
                            {
                                ["TagFullName"] = tostring(begin:GetFullName())
                                
                            }
                            )
                    end
                end
            end
        end
    end
end
)
--local Exit = lpg:CreateButton("Exit",function() gui:CleanUp() end) 
end)