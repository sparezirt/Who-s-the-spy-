local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Paplo Hub (BETA)",
   Icon =117829097495168, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Im clownquesting it",
   LoadingSubtitle = "by the infomaous paplo (i wont tell reel)",
   Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Paplo WTS Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Paplo Keysystem",
      Subtitle = "Enter key blah blah blah",
      Note = "just use 'paplo' as key", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"paplo"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Who is the spy", 4483362458) -- Title, Image
local Section = Tab:CreateSection("this hacker")
local Divider = Tab:CreateDivider()
Rayfield:Notify({
   Title = "Notification Title",
   Content = "Notification Content",
   Duration = 6.5,
   Image = 4483362458,
})

local Button = Tab:CreateButton({
   Name = "Admin Commands (ALPHA)",
   Callback = function()
   -- The function that takes place when the button is pressed

game:GetService("Players").LocalPlayer.PlayerGui.Interface.Main.adminFrame.Visible = true

   end,
})

local Button = Tab:CreateButton({
   Name = "Visible Word",
   Callback = function()
   -- The function that takes place when the button is pressed

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function createLabel(character, text, textColor)
  local billboardGui = Instance.new("BillboardGui")
  billboardGui.Name = "StatusLabel"
  billboardGui.Adornee = character:FindFirstChild("Head")
  billboardGui.Size = UDim2.new(0, 100, 0, 50)
  billboardGui.StudsOffset = Vector3.new(0, 4, 0)
  billboardGui.AlwaysOnTop = true

  local textLabel = Instance.new("TextLabel")
  textLabel.Size = UDim2.new(1, 0, 1, 0)
  textLabel.BackgroundTransparency = 1
  textLabel.Text = text
  textLabel.TextColor3 = textColor
  textLabel.TextScaled = true
  textLabel.Font = Enum.Font.SourceSansBold
  textLabel.Parent = billboardGui

  billboardGui.Parent = character
end

local function checkPlayerForStatus(player)
  local boolFolder = player:FindFirstChild("boolFolder")
  if boolFolder then
    local isSpy = boolFolder:FindFirstChild("isSpy")
    if isSpy and isSpy:IsA("BoolValue") then
      if player.Character and player.Character:FindFirstChild("Head") then
        local existingLabel = player.Character:FindFirstChild("StatusLabel")
        if existingLabel then
          existingLabel:Destroy()
        end

        local chosenMode = ReplicatedStorage.String:FindFirstChild("ChosenMode")
        if chosenMode and chosenMode:IsA("StringValue") then
          if isSpy.Value then
            if chosenMode.Value == "Spy with Word" then
              local spyWord = ReplicatedStorage.String:FindFirstChild("SpyWord")
              if spyWord and spyWord:IsA("StringValue") then
                createLabel(player.Character, spyWord.Value, Color3.new(1, 0, 0))
              else
                warn("SpyWord not found in ReplicatedStorage.String")
              end
            elseif chosenMode.Value == "Wordless Spy" then
              createLabel(player.Character, "No word", Color3.new(1, 0, 0))
            end
          else
            local innocentWord = ReplicatedStorage.String:FindFirstChild("ClueWord")
            if innocentWord and innocentWord:IsA("StringValue") then
              createLabel(player.Character, innocentWord.Value, Color3.new(0, 1, 0))
            else
              warn("ClueWord not found in ReplicatedStorage.String")
            end
          end
        else
          warn("ChosenMode not found in ReplicatedStorage.String")
        end
      end
    end
  end
end

local function checkAllPlayers()
  for _, player in pairs(Players:GetPlayers()) do
    checkPlayerForStatus(player)
  end
end

Players.PlayerAdded:Connect(function(player)
  player.CharacterAdded:Connect(function(character)
    checkPlayerForStatus(player)
  end)
end)

while true do
  checkAllPlayers()
  wait(2)
      end
   end,
})

local Button = Tab:CreateButton({
   Name = "Player ESP  (Spy/Innocent)",
   Callback = function()
   -- The function that takes place when the button is pressed

local Players = game:GetService("Players")

local function createLabel(character, text, textColor)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "StatusLabel"
    billboardGui.Adornee = character:FindFirstChild("Head")
    billboardGui.Size = UDim2.new(0, 100, 0, 50)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)
    billboardGui.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = textColor
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = billboardGui

    billboardGui.Parent = character
end

local function checkPlayerForStatus(player)
    local boolFolder = player:FindFirstChild("boolFolder")
    if boolFolder then
        local isSpy = boolFolder:FindFirstChild("isSpy")
        if isSpy and isSpy:IsA("BoolValue") then
            if player.Character and player.Character:FindFirstChild("Head") then
                local existingLabel = player.Character:FindFirstChild("StatusLabel")
                if existingLabel then
                    existingLabel:Destroy()
                end
                if isSpy.Value then
                    createLabel(player.Character, "Spy", Color3.new(1, 0, 0))
                else
                    createLabel(player.Character, "Innocent", Color3.new(0, 1, 0))
                end
            end
        end
    end
end

local function checkAllPlayers()
    for _, player in pairs(Players:GetPlayers()) do
        checkPlayerForStatus(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        checkPlayerForStatus(player)
    end)
end)

while true do
    checkAllPlayers()
    wait(2)
      end
   end,
})
