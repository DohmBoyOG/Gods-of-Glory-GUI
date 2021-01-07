local thisPlayer = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart


local worlds = {
    ["Peaceful Kingdom"] = Vector3.new(154.574997, 23.3469009, -733.197021),
    ["Ancient Greece"] = Vector3.new(8600.27344, 20.4717731, -586.116638),
    ["Kingdom of Egypt"] = Vector3.new(20500.3047, 49.4469223, -759.361328),
    ["Feudal Japan"] = Vector3.new(217.775192, 28.7469292, 13310.2012),
    ["Aztec Empire"] = Vector3.new(53541.5742, 20.4717731, -602.596558),
    ["Viking Conquests"] = Vector3.new(35417.9727, 27.7469292, -797.196289),
    ["Lost Atlantis"] = Vector3.new(8721.17578, 20.4717731, 13434.8027),
    ["Indian Raj"] = Vector3.new(20136.9746, 20.4717731, 13405.8027),
    ["The Underworld"] = Vector3.new(20198.0176, 36.0265656, 13383.3809)
}

thisPlayer.CFrame = CFrame.new(worlds['Ancient Greece'])
