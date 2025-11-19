local TexNotify = {}

function TexNotify:Show(config)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")  
screenGui.Name = "TexNotifyGui"  
screenGui.ResetOnSpawn = false  
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling  
screenGui.Parent = playerGui  
  
local mainFrame = Instance.new("Frame")  
mainFrame.Name = "NotificationFrame"  
mainFrame.Size = UDim2.new(0, 350, 0, 0)  
mainFrame.Position = UDim2.new(1, -370, 0, 20)  
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)  
mainFrame.BorderSizePixel = 0  
mainFrame.ClipsDescendants = true  
mainFrame.Parent = screenGui  
  
local uiCorner = Instance.new("UICorner")  
uiCorner.CornerRadius = UDim.new(0, 16)  
uiCorner.Parent = mainFrame  
  
local gradient = Instance.new("UIGradient")  
gradient.Color = ColorSequence.new{  
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),  
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 25))  
}  
gradient.Rotation = 45  
gradient.Parent = mainFrame  
  
local uiStroke = Instance.new("UIStroke")  
uiStroke.Color = Color3.fromRGB(88, 101, 242)  
uiStroke.Thickness = 2  
uiStroke.Transparency = 0.3  
uiStroke.Parent = mainFrame  
  
local glowStroke = Instance.new("UIStroke")  
glowStroke.Color = Color3.fromRGB(88, 101, 242)  
glowStroke.Thickness = 4  
glowStroke.Transparency = 0.8  
glowStroke.Parent = mainFrame  
  
local shadow = Instance.new("ImageLabel")  
shadow.Name = "Shadow"  
shadow.Size = UDim2.new(1, 40, 1, 40)  
shadow.Position = UDim2.new(0, -20, 0, -20)  
shadow.BackgroundTransparency = 1  
shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"  
shadow.ImageColor3 = Color3.fromRGB(88, 101, 242)  
shadow.ImageTransparency = 0.6  
shadow.ScaleType = Enum.ScaleType.Slice  
shadow.SliceCenter = Rect.new(10, 10, 118, 118)  
shadow.ZIndex = 0  
shadow.Parent = mainFrame  
  
local topBar = Instance.new("Frame")  
topBar.Name = "TopBar"  
topBar.Size = UDim2.new(1, 0, 0, 4)  
topBar.Position = UDim2.new(0, 0, 0, 0)  
topBar.BackgroundColor3 = Color3.fromRGB(88, 101, 242)  
topBar.BorderSizePixel = 0  
topBar.Parent = mainFrame  
  
local topBarGradient = Instance.new("UIGradient")  
topBarGradient.Color = ColorSequence.new{  
    ColorSequenceKeypoint.new(0, Color3.fromRGB(88, 101, 242)),  
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(138, 151, 255)),  
    ColorSequenceKeypoint.new(1, Color3.fromRGB(88, 101, 242))  
}  
topBarGradient.Parent = topBar  
  
local topBarCorner = Instance.new("UICorner")  
topBarCorner.CornerRadius = UDim.new(0, 16)  
topBarCorner.Parent = topBar  
  
local contentFrame = Instance.new("Frame")  
contentFrame.Name = "Content"  
contentFrame.Size = UDim2.new(1, -24, 1, -24)  
contentFrame.Position = UDim2.new(0, 12, 0, 12)  
contentFrame.BackgroundTransparency = 1  
contentFrame.Parent = mainFrame  
  
local imageContainer = Instance.new("Frame")  
imageContainer.Name = "ImageContainer"  
imageContainer.Size = UDim2.new(0, 55, 0, 55)  
imageContainer.Position = UDim2.new(0, 8, 0, 8)  
imageContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)  
imageContainer.BorderSizePixel = 0  
imageContainer.Parent = contentFrame  
  
local imageContainerCorner = Instance.new("UICorner")  
imageContainerCorner.CornerRadius = UDim.new(0, 12)  
imageContainerCorner.Parent = imageContainer  
  
local imageStroke = Instance.new("UIStroke")  
imageStroke.Color = Color3.fromRGB(88, 101, 242)  
imageStroke.Thickness = 2  
imageStroke.Transparency = 0.5  
imageStroke.Parent = imageContainer  
  
local imageLabel = Instance.new("ImageLabel")  
imageLabel.Name = "NotificationImage"  
imageLabel.Size = UDim2.new(1, -8, 1, -8)  
imageLabel.Position = UDim2.new(0, 4, 0, 4)  
imageLabel.BackgroundTransparency = 1  
imageLabel.Image = "rbxassetid://" .. (config.Image or "7733964640")  
imageLabel.Parent = imageContainer  
  
local imageCorner = Instance.new("UICorner")  
imageCorner.CornerRadius = UDim.new(0, 10)  
imageCorner.Parent = imageLabel  
  
local titleLabel = Instance.new("TextLabel")  
titleLabel.Name = "Title"  
titleLabel.Size = UDim2.new(1, -80, 0, 24)  
titleLabel.Position = UDim2.new(0, 75, 0, 8)  
titleLabel.BackgroundTransparency = 1  
titleLabel.Text = config.Name or "اشعار"  
titleLabel.Font = Enum.Font.GothamBold  
titleLabel.TextSize = 17  
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  
titleLabel.TextXAlignment = Enum.TextXAlignment.Left  
titleLabel.TextYAlignment = Enum.TextYAlignment.Top  
titleLabel.Parent = contentFrame  
  
local titleStroke = Instance.new("UIStroke")  
titleStroke.Color = Color3.fromRGB(88, 101, 242)  
titleStroke.Thickness = 0.5  
titleStroke.Transparency = 0.8  
titleStroke.Parent = titleLabel  
  
local descLabel = Instance.new("TextLabel")  
descLabel.Name = "Description"  
descLabel.Size = UDim2.new(1, -80, 0, 28)  
descLabel.Position = UDim2.new(0, 75, 0, 33)  
descLabel.BackgroundTransparency = 1  
descLabel.Text = config.Description or "وصف الاشعار"  
descLabel.Font = Enum.Font.Gotham  
descLabel.TextSize = 14  
descLabel.TextColor3 = Color3.fromRGB(210, 210, 220)  
descLabel.TextXAlignment = Enum.TextXAlignment.Left  
descLabel.TextYAlignment = Enum.TextYAlignment.Top  
descLabel.TextWrapped = true  
descLabel.Parent = contentFrame  
  
local buttonFrame = Instance.new("Frame")  
buttonFrame.Name = "Buttons"  
buttonFrame.Size = UDim2.new(1, -16, 0, 36)  
buttonFrame.Position = UDim2.new(0, 8, 1, -44)  
buttonFrame.BackgroundTransparency = 1  
buttonFrame.Parent = contentFrame  
  
local button1 = Instance.new("TextButton")  
button1.Name = "Button1"  
button1.Size = UDim2.new(0.48, 0, 1, 0)  
button1.Position = UDim2.new(0, 0, 0, 0)  
button1.BackgroundColor3 = Color3.fromRGB(88, 101, 242)  
button1.BorderSizePixel = 0  
button1.Text = config.Button1 or "موافق"  
button1.Font = Enum.Font.GothamBold  
button1.TextSize = 14  
button1.TextColor3 = Color3.fromRGB(255, 255, 255)  
button1.AutoButtonColor = false  
button1.Parent = buttonFrame  
  
local button1Corner = Instance.new("UICorner")  
button1Corner.CornerRadius = UDim.new(0, 10)  
button1Corner.Parent = button1  
  
local button1Gradient = Instance.new("UIGradient")  
button1Gradient.Color = ColorSequence.new{  
    ColorSequenceKeypoint.new(0, Color3.fromRGB(88, 101, 242)),  
    ColorSequenceKeypoint.new(1, Color3.fromRGB(108, 121, 255))  
}  
button1Gradient.Rotation = 90  
button1Gradient.Parent = button1  
  
local button1Stroke = Instance.new("UIStroke")  
button1Stroke.Color = Color3.fromRGB(138, 151, 255)  
button1Stroke.Thickness = 1.5  
button1Stroke.Transparency = 0.5  
button1Stroke.Parent = button1  
  
local button2 = Instance.new("TextButton")  
button2.Name = "Button2"  
button2.Size = UDim2.new(0.48, 0, 1, 0)  
button2.Position = UDim2.new(0.52, 0, 0, 0)  
button2.BackgroundColor3 = Color3.fromRGB(40, 40, 52)  
button2.BorderSizePixel = 0  
button2.Text = config.Button2 or "الغاء"  
button2.Font = Enum.Font.GothamBold  
button2.TextSize = 14  
button2.TextColor3 = Color3.fromRGB(255, 255, 255)  
button2.AutoButtonColor = false  
button2.Parent = buttonFrame  
  
local button2Corner = Instance.new("UICorner")  
button2Corner.CornerRadius = UDim.new(0, 10)  
button2Corner.Parent = button2  
  
local button2Gradient = Instance.new("UIGradient")  
button2Gradient.Color = ColorSequence.new{  
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 52)),  
    ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 62))  
}  
button2Gradient.Rotation = 90  
button2Gradient.Parent = button2  
  
local button2Stroke = Instance.new("UIStroke")  
button2Stroke.Color = Color3.fromRGB(70, 70, 90)  
button2Stroke.Thickness = 1.5  
button2Stroke.Transparency = 0.5  
button2Stroke.Parent = button2  
  
local finalHeight = 120  
  
button1.MouseEnter:Connect(function()  
    TweenService:Create(button1, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(108, 121, 255)}):Play()  
end)  
  
button1.MouseLeave:Connect(function()  
    TweenService:Create(button1, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(88, 101, 242)}):Play()  
end)  
  
button2.MouseEnter:Connect(function()  
    TweenService:Create(button2, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 62)}):Play()  
end)  
  
button2.MouseLeave:Connect(function()  
    TweenService:Create(button2, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 52)}):Play()  
end)  
  
local openTween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {  
    Size = UDim2.new(0, 350, 0, finalHeight)  
})  
openTween:Play()  
  
spawn(function()  
    while mainFrame.Parent do  
        TweenService:Create(glowStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.5}):Play()  
        wait(1.5)  
        TweenService:Create(glowStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.9}):Play()  
        wait(1.5)  
    end  
end)  
  
if config.Sound then  
    local sound = Instance.new("Sound")  
    sound.SoundId = "rbxassetid://" .. config.Sound  
    sound.Volume = 0.5  
    sound.Parent = screenGui  
    sound:Play()  
    game:GetService("Debris"):AddItem(sound, 3)  
end  
  
local function closeNotification()  
    local closeTween = TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {  
        Size = UDim2.new(0, 350, 0, 0)  
    })  
    closeTween:Play()  
    closeTween.Completed:Wait()  
    screenGui:Destroy()  
end  
  
button1.MouseButton1Click:Connect(function()  
    if config.Callback1 then  
        config.Callback1()  
    end  
    closeNotification()  
end)  
  
button2.MouseButton1Click:Connect(function()  
    if config.Callback2 then  
        config.Callback2()  
    end  
    closeNotification()  
end)  
  
local duration = config.Duration or 5  
task.delay(duration, function()  
    if screenGui and screenGui.Parent then  
        closeNotification()  
    end  
end)

end

return TexNotify
