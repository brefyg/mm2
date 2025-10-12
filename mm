local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "LoadingGui"
loadingGui.ResetOnSpawn = false
loadingGui.DisplayOrder = 200
loadingGui.IgnoreGuiInset = true
loadingGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
loadingGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
loadingFrame.BackgroundTransparency = 0
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = loadingGui

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 40)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(40, 25, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 40, 70))
}
gradient.Transparency = NumberSequence.new(0)
gradient.Rotation = 45
gradient.Parent = loadingFrame

local pattern = Instance.new("ImageLabel")
pattern.Size = UDim2.new(1, 0, 1, 0)
pattern.BackgroundTransparency = 1
pattern.Image = "rbxassetid://2151741365"
pattern.ImageTransparency = 0.9
pattern.ImageColor3 = Color3.fromRGB(50, 50, 80)
pattern.Parent = loadingFrame

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(0, 450, 0, 70)
loadingText.Position = UDim2.new(0.5, -225, 0.38, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading xHub Script..."
loadingText.TextColor3 = Color3.fromRGB(210, 210, 255)
loadingText.Font = Enum.Font.GothamBlack
loadingText.TextSize = 32
loadingText.TextStrokeTransparency = 0.7
loadingText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
loadingText.Parent = loadingFrame

local textGlow = Instance.new("UIStroke")
textGlow.Thickness = 1.5
textGlow.Color = Color3.fromRGB(150, 150, 255)
textGlow.Transparency = 0.3
textGlow.Parent = loadingText

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 550, 0, 45)
progressBar.Position = UDim2.new(0.5, -275, 0.5, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
progressBar.BorderSizePixel = 0
progressBar.Parent = loadingFrame

local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(120, 160, 255)
progressFill.BorderSizePixel = 0
progressFill.Parent = progressBar

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0, 14)
progressCorner.Parent = progressBar

local progressFillCorner = Instance.new("UICorner")
progressFillCorner.CornerRadius = UDim.new(0, 14)
progressFillCorner.Parent = progressFill

local progressGlow = Instance.new("UIStroke")
progressGlow.Thickness = 2.5
progressGlow.Color = Color3.fromRGB(160, 200, 255)
progressGlow.Transparency = 0.2
progressGlow.Parent = progressBar

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(0, 550, 0, 35)
statusText.Position = UDim2.new(0.5, -275, 0.6, 0)
statusText.BackgroundTransparency = 1
statusText.Text = "Initializing... 0%"
statusText.TextColor3 = Color3.fromRGB(190, 190, 210)
statusText.Font = Enum.Font.Gotham
statusText.TextSize = 20
statusText.Parent = loadingFrame

local TweenService = game:GetService("TweenService")

spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/brefyg/XHub/refs/heads/main/HubScript.txt"))()
end)

spawn(function()
    for i = 0, 120 do
        wait(1)
        local progress = math.min(i / 120, 1)
        TweenService:Create(
            progressFill,
            TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
            {Size = UDim2.new(progress, 0, 1, 0)}
        ):Play()
        statusText.Text = "Initializing... " .. math.floor(progress * 100) .. "%"
    end
    loadingGui:Destroy()
end)
