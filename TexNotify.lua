local TexNotify = {}

function TexNotify:Show(config)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")  
screenGui.Name = "TexNotifyGui"  
screenGui.ResetOnSpawn = false  
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  
screenGui.Parent = playerGui  

local mainFrame = Instance.new("Frame")  
mainFrame.Name = "NotificationFrame"  
mainFrame.Size = UDim2.new(0, 380, 0, 0)  
mainFrame.Position = UDim2.new(1, -400, 0, 20)  
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)  
mainFrame.BorderSizePixel = 0  
mainFrame.ClipsDescendants = true  
mainFrame.AnchorPoint = Vector2.new(0, 0)  
mainFrame.Parent = screenGui  

local uiCorner = Instance.new("UICorner")  
uiCorner.CornerRadius = UDim.new(0, 20)  
uiCorner.Parent = mainFrame  

local uiStroke = Instance.new("UIStroke")  
uiStroke.Color = Color3.fromRGB(88, 101, 242)  
uiStroke.Thickness = 2.5  
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border  
uiStroke.Parent = mainFrame  

local uiGradient = Instance.new("UIGradient")  
uiGradient.Color = ColorSequence.new{  
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),  
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(18, 18, 28)),  
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 22))  
}  
uiGradient.Rotation = 135  
uiGradient.Parent = mainFrame  

local shadow = Instance.new("Frame")  
shadow.Size = UDim2.new(1, 0, 1, 0)  
shadow.Position = UDim2.new(0, 0, 0, 0)  
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  
shadow.BackgroundTransparency = 0.6  
shadow.ZIndex = 0  
shadow.AnchorPoint = Vector2.new(0, 0)  
shadow.Parent = mainFrame  
local shadowCorner = Instance.new("UICorner")  
shadowCorner.CornerRadius = UDim.new(0, 20)  
shadowCorner.Parent = shadow  

local contentFrame = Instance.new("Frame")  
contentFrame.Size = UDim2.new(1, -32, 1, -32)  
contentFrame.Position = UDim2.new(0, 16, 0, 16)  
contentFrame.BackgroundTransparency = 1  
contentFrame.Parent = mainFrame  

local titleLabel = Instance.new("TextLabel")  
titleLabel.Size = UDim2.new(1, -32, 0, 28)  
titleLabel.Position = UDim2.new(0, 0, 0, 0)  
titleLabel.BackgroundTransparency = 1  
titleLabel.Text = config.Name or "اشعار"  
titleLabel.Font = Enum.Font.GothamBold  
titleLabel.TextSize = 19  
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  
titleLabel.TextXAlignment = Enum.TextXAlignment.Left  
titleLabel.TextYAlignment = Enum.TextYAlignment.Top  
titleLabel.Parent = contentFrame  

local descLabel = Instance.new("TextLabel")  
descLabel.Size = UDim2.new(1, -32, 0, 32)  
descLabel.Position = UDim2.new(0, 0, 0, 30)  
descLabel.BackgroundTransparency = 1  
descLabel.Text = config.Description or "وصف الاشعار"  
descLabel.Font = Enum.Font.Gotham  
descLabel.TextSize = 15  
descLabel.TextColor3 = Color3.fromRGB(220, 220, 230)  
descLabel.TextXAlignment = Enum.TextXAlignment.Left  
descLabel.TextYAlignment = Enum.TextYAlignment.Top  
descLabel.TextWrapped = true  
descLabel.Parent = contentFrame  

local buttonFrame = Instance.new("Frame")  
buttonFrame.Size = UDim2.new(1, 0, 0, 30)  
buttonFrame.Position = UDim2.new(0, 0, 1, -40)  
buttonFrame.BackgroundTransparency = 1  
buttonFrame.Parent = contentFrame  

local button1 = Instance.new("TextButton")  
button1.Size = UDim2.new(0.48, 0, 1, 0)  
button1.Position = UDim2.new(0, 0, 0, 0)  
button1.BackgroundColor3 = Color3.fromRGB(88, 101, 242)  
button1.BorderSizePixel = 0  
button1.Text = config.Button1 or "موافق"  
button1.Font = Enum.Font.GothamBold  
button1.TextSize = 15  
button1.TextColor3 = Color3.fromRGB(255, 255, 255)  
button1.Parent = buttonFrame  

local button2 = Instance.new("TextButton")  
button2.Size = UDim2.new(0.48, 0, 1, 0)  
button2.Position = UDim2.new(0.52, 0, 0, 0)  
button2.BackgroundColor3 = Color3.fromRGB(138, 151, 255)  
button2.BorderSizePixel = 0  
button2.Text = config.Button2 or "إلغاء"  
button2.Font = Enum.Font.GothamBold  
button2.TextSize = 15  
button2.TextColor3 = Color3.fromRGB(255, 255, 255)  
button2.Parent = buttonFrame  

local t = 0  
local goalSize = UDim2.new(0, 380, 0, 120)  
RunService.Heartbeat:Connect(function(delta)  
    if mainFrame.Size.Y.Offset < goalSize.Y.Offset then  
        mainFrame.Size = mainFrame.Size:Lerp(goalSize, 0.2)  
    end  
    t = t + delta  
    uiStroke.Color = Color3.fromHSV((tick() % 5)/5, 1, 1)  
end)  

spawn(function()  
    wait(config.Duration or 5)  
    while mainFrame.Size.Y.Offset > 0 do  
        mainFrame.Size = mainFrame.Size:Lerp(UDim2.new(0, 380, 0, 0), 0.2)  
        wait()  
    end  
    screenGui:Destroy()  
end)

end

return TexNotify
