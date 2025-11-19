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
    
    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = game:GetService("Lighting")
    
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
    
    local backgroundGradient = Instance.new("UIGradient")
    backgroundGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(18, 18, 28)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 22))
    }
    backgroundGradient.Rotation = 135
    backgroundGradient.Parent = mainFrame
    
    local glowFrame = Instance.new("Frame")
    glowFrame.Name = "GlowFrame"
    glowFrame.Size = UDim2.new(1, 50, 1, 50)
    glowFrame.Position = UDim2.new(0, -25, 0, -25)
    glowFrame.BackgroundTransparency = 1
    glowFrame.ZIndex = 0
    glowFrame.Parent = mainFrame
    
    local glow = Instance.new("ImageLabel")
    glow.Name = "Glow"
    glow.Size = UDim2.new(1, 0, 1, 0)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    glow.ImageColor3 = Color3.fromRGB(88, 101, 242)
    glow.ImageTransparency = 0.5
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(10, 10, 118, 118)
    glow.Parent = glowFrame
    
    local mainStroke = Instance.new("UIStroke")
    mainStroke.Color = Color3.fromRGB(88, 101, 242)
    mainStroke.Thickness = 2.5
    mainStroke.Transparency = 0.2
    mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    mainStroke.Parent = mainFrame
    
    local animatedBorder = Instance.new("Frame")
    animatedBorder.Name = "AnimatedBorder"
    animatedBorder.Size = UDim2.new(1, 4, 1, 4)
    animatedBorder.Position = UDim2.new(0, -2, 0, -2)
    animatedBorder.BackgroundTransparency = 1
    animatedBorder.ZIndex = 0
    animatedBorder.Parent = mainFrame
    
    local borderStroke = Instance.new("UIStroke")
    borderStroke.Color = Color3.fromRGB(138, 151, 255)
    borderStroke.Thickness = 3
    borderStroke.Transparency = 0.7
    borderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    borderStroke.Parent = animatedBorder
    
    local borderCorner = Instance.new("UICorner")
    borderCorner.CornerRadius = UDim.new(0, 22)
    borderCorner.Parent = animatedBorder
    
    local topAccent = Instance.new("Frame")
    topAccent.Name = "TopAccent"
    topAccent.Size = UDim2.new(1, 0, 0, 5)
    topAccent.Position = UDim2.new(0, 0, 0, 0)
    topAccent.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    topAccent.BorderSizePixel = 0
    topAccent.Parent = mainFrame
    
    local topGradient = Instance.new("UIGradient")
    topGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(138, 151, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(88, 101, 242)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(138, 151, 255))
    }
    topGradient.Parent = topAccent
    
    local topCorner = Instance.new("UICorner")
    topCorner.CornerRadius = UDim.new(0, 20)
    topCorner.Parent = topAccent
    
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "Content"
    contentFrame.Size = UDim2.new(1, -32, 1, -32)
    contentFrame.Position = UDim2.new(0, 16, 0, 16)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame
    
    local imageContainer = Instance.new("Frame")
    imageContainer.Name = "ImageContainer"
    imageContainer.Size = UDim2.new(0, 64, 0, 64)
    imageContainer.Position = UDim2.new(0, 10, 0, 10)
    imageContainer.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    imageContainer.BorderSizePixel = 0
    imageContainer.Parent = contentFrame
    
    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(0, 16)
    imageCorner.Parent = imageContainer
    
    local imageGradient = Instance.new("UIGradient")
    imageGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 48)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
    }
    imageGradient.Rotation = 45
    imageGradient.Parent = imageContainer
    
    local imageStroke = Instance.new("UIStroke")
    imageStroke.Color = Color3.fromRGB(88, 101, 242)
    imageStroke.Thickness = 2
    imageStroke.Transparency = 0.4
    imageStroke.Parent = imageContainer
    
    local imageGlow = Instance.new("ImageLabel")
    imageGlow.Name = "ImageGlow"
    imageGlow.Size = UDim2.new(1, 20, 1, 20)
    imageGlow.Position = UDim2.new(0, -10, 0, -10)
    imageGlow.BackgroundTransparency = 1
    imageGlow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    imageGlow.ImageColor3 = Color3.fromRGB(88, 101, 242)
    imageGlow.ImageTransparency = 0.7
    imageGlow.ScaleType = Enum.ScaleType.Slice
    imageGlow.SliceCenter = Rect.new(10, 10, 118, 118)
    imageGlow.ZIndex = 0
    imageGlow.Parent = imageContainer
    
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = "NotificationImage"
    imageLabel.Size = UDim2.new(1, -12, 1, -12)
    imageLabel.Position = UDim2.new(0, 6, 0, 6)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Image = "rbxassetid://" .. (config.Image or "7733964640")
    imageLabel.Parent = imageContainer
    
    local imageLabelCorner = Instance.new("UICorner")
    imageLabelCorner.CornerRadius = UDim.new(0, 14)
    imageLabelCorner.Parent = imageLabel
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -95, 0, 28)
    titleLabel.Position = UDim2.new(0, 88, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = config.Name or "اشعار"
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 19
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextYAlignment = Enum.TextYAlignment.Top
    titleLabel.Parent = contentFrame
    
    local titleGlow = Instance.new("UIStroke")
    titleGlow.Color = Color3.fromRGB(138, 151, 255)
    titleGlow.Thickness = 0.8
    titleGlow.Transparency = 0.6
    titleGlow.Parent = titleLabel
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Name = "Description"
    descLabel.Size = UDim2.new(1, -95, 0, 32)
    descLabel.Position = UDim2.new(0, 88, 0, 40)
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
    buttonFrame.Name = "Buttons"
    buttonFrame.Size = UDim2.new(1, -20, 0, 40)
    buttonFrame.Position = UDim2.new(0, 10, 1, -50)
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
    button1.TextSize = 15
    button1.TextColor3 = Color3.fromRGB(255, 255, 255)
    button1.AutoButtonColor = false
    button1.Parent = buttonFrame
    
    local button1Corner = Instance.new("UICorner")
    button1Corner.CornerRadius = UDim.new(0, 12)
    button1Corner.Parent = button1
    
    local button1Gradient = Instance.new("UIGradient")
    button1Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 121, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(88, 101, 242)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(108, 121, 255))
    }
    button1Gradient.Rotation = 90
    button1Gradient.Parent = button1
    
    local button1Stroke = Instance.new("UIStroke")
    button1Stroke.Color = Color3.fromRGB(138, 151, 255)
    button1Stroke.Thickness = 2
    button1Stroke.Transparency = 0.3
    button1Stroke.Parent = button1
    
    local button1Glow = Instance.new("ImageLabel")
    button1Glow.Name = "ButtonGlow"
    button1Glow.Size = UDim2.new(1, 16, 1, 16)
    button1Glow.Position = UDim2.new(0, -8, 0, -8)
    button1Glow.BackgroundTransparency = 1
    button1Glow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    button1Glow.ImageColor3 = Color3.fromRGB(88, 101, 242)
    button1Glow.ImageTransparency = 0.8
    button1Glow.ScaleType = Enum.ScaleType.Slice
    button1Glow.SliceCenter = Rect.new(10, 10, 118, 118)
    button1Glow.ZIndex = 0
    button1Glow.Parent = button1
    
    local button2 = Instance.new("TextButton")
    button2.Name = "Button2"
    button2.Size = UDim2.new(0.48, 0, 1, 0)
    button2.Position = UDim2.new(0.52, 0, 0, 0)
    button2.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
    button2.BorderSizePixel = 0
    button2.Text = config.Button2 or "الغاء"
    button2.Font = Enum.Font.GothamBold
    button2.TextSize = 15
    button2.TextColor3 = Color3.fromRGB(255, 255, 255)
    button2.AutoButtonColor = false
    button2.Parent = buttonFrame
    
    local button2Corner = Instance.new("UICorner")
    button2Corner.CornerRadius = UDim.new(0, 12)
    button2Corner.Parent = button2
    
    local button2Gradient = Instance.new("UIGradient")
    button2Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 58)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 35, 48)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 58))
    }
    button2Gradient.Rotation = 90
    button2Gradient.Parent = button2
    
    local button2Stroke = Instance.new("UIStroke")
    button2Stroke.Color = Color3.fromRGB(70, 70, 90)
    button2Stroke.Thickness = 2
    button2Stroke.Transparency = 0.4
    button2Stroke.Parent = button2
    
    local finalHeight = 135
    
    spawn(function()
        while borderStroke and borderStroke.Parent do
            TweenService:Create(borderStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.3}):Play()
            wait(2)
            if not borderStroke or not borderStroke.Parent then break end
            TweenService:Create(borderStroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.9}):Play()
            wait(2)
        end
    end)
    
    spawn(function()
        while glow and glow.Parent do
            TweenService:Create(glow, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ImageTransparency = 0.3}):Play()
            wait(3)
            if not glow or not glow.Parent then break end
            TweenService:Create(glow, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ImageTransparency = 0.7}):Play()
            wait(3)
        end
    end)
    
    spawn(function()
        while imageGlow and imageGlow.Parent do
            TweenService:Create(imageGlow, TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ImageTransparency = 0.5}):Play()
            wait(2.5)
            if not imageGlow or not imageGlow.Parent then break end
            TweenService:Create(imageGlow, TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ImageTransparency = 0.9}):Play()
            wait(2.5)
        end
    end)
    
    TweenService:Create(blur, TweenInfo.new(0.4), {Size = 8}):Play()
    
    local openTween = TweenService:Create(mainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 380, 0, finalHeight),
        Position = UDim2.new(1, -400, 0, 20)
    })
    openTween:Play()
    
    local rotationTween = TweenService:Create(imageLabel, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Rotation = 360
    })
    rotationTween:Play()
    
    if config.Sound then
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. config.Sound
        sound.Volume = 0.6
        sound.Parent = screenGui
        sound:Play()
        game:GetService("Debris"):AddItem(sound, 3)
    end
    
    button1.MouseEnter:Connect(function()
        TweenService:Create(button1, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0.48, 0, 1.05, 0),
            BackgroundColor3 = Color3.fromRGB(118, 131, 255)
        }):Play()
        TweenService:Create(button1Stroke, TweenInfo.new(0.3), {Transparency = 0.1}):Play()
        TweenService:Create(button1Glow, TweenInfo.new(0.3), {ImageTransparency = 0.5}):Play()
    end)
    
    button1.MouseLeave:Connect(function()
        TweenService:Create(button1, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0.48, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        }):Play()
        TweenService:Create(button1Stroke, TweenInfo.new(0.3), {Transparency = 0.3}):Play()
        TweenService:Create(button1Glow, TweenInfo.new(0.3), {ImageTransparency = 0.8}):Play()
    end)
    
    button2.MouseEnter:Connect(function()
        TweenService:Create(button2, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0.48, 0, 1.05, 0),
            BackgroundColor3 = Color3.fromRGB(55, 55, 68)
        }):Play()
        TweenService:Create(button2Stroke, TweenInfo.new(0.3), {Transparency = 0.2}):Play()
    end)
    
    button2.MouseLeave:Connect(function()
        TweenService:Create(button2, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0.48, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(35, 35, 48)
        }):Play()
        TweenService:Create(button2Stroke, TweenInfo.new(0.3), {Transparency = 0.4}):Play()
    end)
    
    local function closeNotification()
        TweenService:Create(blur, TweenInfo.new(0.4), {Size = 0}):Play()
        
        local closeTween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 380, 0, 0),
            Position = UDim2.new(1, -400, 0, 20)
        })
        closeTween:Play()
        
        closeTween.Completed:Wait()
        blur:Destroy()
        screenGui:Destroy()
    end
    
    button1.MouseButton1Click:Connect(function()
        TweenService:Create(button1, TweenInfo.new(0.1), {Size = UDim2.new(0.46, 0, 0.95, 0)}):Play()
        wait(0.1)
        TweenService:Create(button1, TweenInfo.new(0.1), {Size = UDim2.new(0.48, 0, 1, 0)}):Play()
        
        if config.Callback1 then
            config.Callback1()
        end
        closeNotification()
    end)
    
    button2.MouseButton1Click:Connect(function()
        TweenService:Create(button2, TweenInfo.new(0.1), {Size = UDim2.new(0.46, 0, 0.95, 0)}):Play()
        wait(0.1)
        TweenService:Create(button2, TweenInfo.new(0.1), {Size = UDim2.new(0.48, 0, 1, 0)}):Play()
        
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
