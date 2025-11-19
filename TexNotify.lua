local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local TexNotify = {}
TexNotify.__index = TexNotify

function TexNotify:Show(config)
    local Name = config.Name or "Notification"
    local Description = config.Description or ""
    local Duration = config.Duration or 5
    local Button1 = config.Button1
    local Button2 = config.Button2
    local Image = config.Image
    local Sound = config.Sound
    
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIGradient = Instance.new("UIGradient")
    local UIStroke = Instance.new("UIStroke")
    local TitleLabel = Instance.new("TextLabel")
    local DescLabel = Instance.new("TextLabel")
    local ImageLabel = Instance.new("ImageLabel")
    local ImageCorner = Instance.new("UICorner")
    local ButtonFrame = Instance.new("Frame")
    local Button1Obj = Instance.new("TextButton")
    local Button2Obj = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local ProgressBar = Instance.new("Frame")
    local ProgressFill = Instance.new("Frame")
    
    ScreenGui.Name = "TexNotify"
    ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(1.5, 0, 0.02, 0)
    MainFrame.Size = UDim2.new(0, 380, 0, 140)
    MainFrame.ClipsDescendants = true
    
    UICorner.CornerRadius = UDim.new(0, 15)
    UICorner.Parent = MainFrame
    
    UIGradient.Parent = MainFrame
    UIGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 15))
    }
    UIGradient.Rotation = 45
    
    UIStroke.Parent = MainFrame
    UIStroke.Color = Color3.fromRGB(80, 80, 120)
    UIStroke.Thickness = 2
    UIStroke.Transparency = 0.5
    
    CloseButton.Parent = MainFrame
    CloseButton.BackgroundTransparency = 1
    CloseButton.Position = UDim2.new(0.92, 0, 0.03, 0)
    CloseButton.Size = UDim2.new(0, 25, 0, 25)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
    CloseButton.TextSize = 18
    
    if Image then
        ImageLabel.Parent = MainFrame
        ImageLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        ImageLabel.Position = UDim2.new(0.03, 0, 0.15, 0)
        ImageLabel.Size = UDim2.new(0, 60, 0, 60)
        ImageLabel.Image = "rbxassetid://" .. Image
        ImageLabel.ScaleType = Enum.ScaleType.Fit
        
        ImageCorner.CornerRadius = UDim.new(0, 10)
        ImageCorner.Parent = ImageLabel
    end
    
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(Image and 0.22 or 0.05, 0, 0.12, 0)
    TitleLabel.Size = UDim2.new(0, 260, 0, 28)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = Name
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 20
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextWrapped = true
    
    DescLabel.Parent = MainFrame
    DescLabel.BackgroundTransparency = 1
    DescLabel.Position = UDim2.new(Image and 0.22 or 0.05, 0, 0.38, 0)
    DescLabel.Size = UDim2.new(0, 260, 0, 40)
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.Text = Description
    DescLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    DescLabel.TextSize = 15
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextWrapped = true
    DescLabel.TextTransparency = 0.2
    
    ProgressBar.Parent = MainFrame
    ProgressBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Position = UDim2.new(0, 0, 0.95, 0)
    ProgressBar.Size = UDim2.new(1, 0, 0.05, 0)
    
    ProgressFill.Parent = ProgressBar
    ProgressFill.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    ProgressFill.BorderSizePixel = 0
    ProgressFill.Size = UDim2.new(1, 0, 1, 0)
    
    local ProgressGradient = Instance.new("UIGradient")
    ProgressGradient.Parent = ProgressFill
    ProgressGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 170, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 130, 255))
    }
    
    if Button1 or Button2 then
        ButtonFrame.Parent = MainFrame
        ButtonFrame.BackgroundTransparency = 1
        ButtonFrame.Position = UDim2.new(0.05, 0, 0.72, 0)
        ButtonFrame.Size = UDim2.new(0.9, 0, 0.18, 0)
        
        if Button1 then
            Button1Obj.Parent = ButtonFrame
            Button1Obj.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
            Button1Obj.BorderSizePixel = 0
            Button1Obj.Position = UDim2.new(0, 0, 0, 0)
            Button1Obj.Size = UDim2.new(Button2 and 0.48 or 1, 0, 1, 0)
            Button1Obj.Font = Enum.Font.GothamBold
            Button1Obj.Text = Button1
            Button1Obj.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button1Obj.TextSize = 15
            
            local UICorner1 = Instance.new("UICorner")
            UICorner1.CornerRadius = UDim.new(0, 8)
            UICorner1.Parent = Button1Obj
            
            local UIStroke1 = Instance.new("UIStroke")
            UIStroke1.Parent = Button1Obj
            UIStroke1.Color = Color3.fromRGB(100, 150, 255)
            UIStroke1.Thickness = 1.5
            UIStroke1.Transparency = 0.6
            
            Button1Obj.MouseButton1Click:Connect(function()
                TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(1.5, 0, 0.02, 0)}):Play()
                task.wait(0.5)
                ScreenGui:Destroy()
            end)
        end
        
        if Button2 then
            Button2Obj.Parent = ButtonFrame
            Button2Obj.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
            Button2Obj.BorderSizePixel = 0
            Button2Obj.Position = UDim2.new(0.52, 0, 0, 0)
            Button2Obj.Size = UDim2.new(0.48, 0, 1, 0)
            Button2Obj.Font = Enum.Font.GothamBold
            Button2Obj.Text = Button2
            Button2Obj.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button2Obj.TextSize = 15
            
            local UICorner2 = Instance.new("UICorner")
            UICorner2.CornerRadius = UDim.new(0, 8)
            UICorner2.Parent = Button2Obj
            
            local UIStroke2 = Instance.new("UIStroke")
            UIStroke2.Parent = Button2Obj
            UIStroke2.Color = Color3.fromRGB(100, 150, 255)
            UIStroke2.Thickness = 1.5
            UIStroke2.Transparency = 0.6
            
            Button2Obj.MouseButton1Click:Connect(function()
                TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(1.5, 0, 0.02, 0)}):Play()
                task.wait(0.5)
                ScreenGui:Destroy()
            end)
        end
    end
    
    CloseButton.MouseButton1Click:Connect(function()
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(1.5, 0, 0.02, 0)}):Play()
        task.wait(0.5)
        ScreenGui:Destroy()
    end)
    
    if Sound then
        local SoundObj = Instance.new("Sound")
        SoundObj.SoundId = "rbxassetid://" .. Sound
        SoundObj.Volume = 0.5
        SoundObj.Parent = ScreenGui
        SoundObj:Play()
        
        SoundObj.Ended:Connect(function()
            SoundObj:Destroy()
        end)
    end
    
    TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.68, 0, 0.02, 0)}):Play()
    
    TweenService:Create(ProgressFill, TweenInfo.new(Duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()
    
    task.spawn(function()
        task.wait(Duration)
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(1.5, 0, 0.02, 0)}):Play()
        task.wait(0.6)
        ScreenGui:Destroy()
    end)
end

return TexNotify
