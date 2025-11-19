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
    local UIStroke = Instance.new("UIStroke")
    local TitleLabel = Instance.new("TextLabel")
    local DescLabel = Instance.new("TextLabel")
    local ImageLabel = Instance.new("ImageLabel")
    local ImageCorner = Instance.new("UICorner")
    local ButtonFrame = Instance.new("Frame")
    local Button1Obj = Instance.new("TextButton")
    local Button2Obj = Instance.new("TextButton")
    local ProgressBar = Instance.new("Frame")
    local ProgressFill = Instance.new("Frame")
    
    ScreenGui.Name = "TexNotify"
    ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(-0.5, 0, 0.85, 0)
    MainFrame.Size = UDim2.new(0, 280, 0, 90)
    MainFrame.ClipsDescendants = false
    
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    UIStroke.Parent = MainFrame
    UIStroke.Color = Color3.fromRGB(60, 60, 60)
    UIStroke.Thickness = 1.5
    UIStroke.Transparency = 0.3
    
    if Image then
        ImageLabel.Parent = MainFrame
        ImageLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ImageLabel.Position = UDim2.new(0.04, 0, 0.15, 0)
        ImageLabel.Size = UDim2.new(0, 45, 0, 45)
        ImageLabel.Image = "rbxassetid://" .. Image
        ImageLabel.ScaleType = Enum.ScaleType.Fit
        
        ImageCorner.CornerRadius = UDim.new(0, 8)
        ImageCorner.Parent = ImageLabel
    end
    
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(Image and 0.24 or 0.05, 0, 0.15, 0)
    TitleLabel.Size = UDim2.new(0, 180, 0, 20)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = Name
    TitleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    TitleLabel.TextSize = 15
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextWrapped = true
    
    DescLabel.Parent = MainFrame
    DescLabel.BackgroundTransparency = 1
    DescLabel.Position = UDim2.new(Image and 0.24 or 0.05, 0, 0.45, 0)
    DescLabel.Size = UDim2.new(0, 180, 0, 30)
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.Text = Description
    DescLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    DescLabel.TextSize = 12
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextWrapped = true
    
    ProgressBar.Parent = MainFrame
    ProgressBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Position = UDim2.new(0, 0, 0.96, 0)
    ProgressBar.Size = UDim2.new(1, 0, 0.04, 0)
    
    local ProgressCorner = Instance.new("UICorner")
    ProgressCorner.CornerRadius = UDim.new(0, 12)
    ProgressCorner.Parent = ProgressBar
    
    ProgressFill.Parent = ProgressBar
    ProgressFill.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    ProgressFill.BorderSizePixel = 0
    ProgressFill.Size = UDim2.new(1, 0, 1, 0)
    
    local ProgressFillCorner = Instance.new("UICorner")
    ProgressFillCorner.CornerRadius = UDim.new(0, 12)
    ProgressFillCorner.Parent = ProgressFill
    
    if Button1 or Button2 then
        ButtonFrame.Parent = MainFrame
        ButtonFrame.BackgroundTransparency = 1
        ButtonFrame.Position = UDim2.new(0.05, 0, 0.75, 0)
        ButtonFrame.Size = UDim2.new(0.9, 0, 0.15, 0)
        
        if Button1 then
            Button1Obj.Parent = ButtonFrame
            Button1Obj.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            Button1Obj.BorderSizePixel = 0
            Button1Obj.Position = UDim2.new(0, 0, 0, 0)
            Button1Obj.Size = UDim2.new(Button2 and 0.48 or 1, 0, 1, 0)
            Button1Obj.Font = Enum.Font.GothamBold
            Button1Obj.Text = Button1
            Button1Obj.TextColor3 = Color3.fromRGB(200, 200, 200)
            Button1Obj.TextSize = 12
            
            local UICorner1 = Instance.new("UICorner")
            UICorner1.CornerRadius = UDim.new(0, 6)
            UICorner1.Parent = Button1Obj
            
            Button1Obj.MouseButton1Click:Connect(function()
                TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(-0.5, 0, 0.85, 0)}):Play()
                task.wait(0.5)
                ScreenGui:Destroy()
            end)
        end
        
        if Button2 then
            Button2Obj.Parent = ButtonFrame
            Button2Obj.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            Button2Obj.BorderSizePixel = 0
            Button2Obj.Position = UDim2.new(0.52, 0, 0, 0)
            Button2Obj.Size = UDim2.new(0.48, 0, 1, 0)
            Button2Obj.Font = Enum.Font.GothamBold
            Button2Obj.Text = Button2
            Button2Obj.TextColor3 = Color3.fromRGB(200, 200, 200)
            Button2Obj.TextSize = 12
            
            local UICorner2 = Instance.new("UICorner")
            UICorner2.CornerRadius = UDim.new(0, 6)
            UICorner2.Parent = Button2Obj
            
            Button2Obj.MouseButton1Click:Connect(function()
                TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(-0.5, 0, 0.85, 0)}):Play()
                task.wait(0.5)
                ScreenGui:Destroy()
            end)
        end
    end
    
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
    
    TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.02, 0, 0.85, 0)}):Play()
    
    TweenService:Create(ProgressFill, TweenInfo.new(Duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()
    
    task.spawn(function()
        task.wait(Duration)
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(-0.5, 0, 0.85, 0)}):Play()
        task.wait(0.5)
        ScreenGui:Destroy()
    end)
end

return TexNotify
