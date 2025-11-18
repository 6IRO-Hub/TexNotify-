local TexNotify = {}

function TexNotify:Show(config)
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    if playerGui:FindFirstChild("TexNotifyGui") then
        playerGui:FindFirstChild("TexNotifyGui"):Destroy()
    end
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "TexNotifyGui"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = playerGui
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "NotificationFrame"
    mainFrame.Size = UDim2.new(0, 450, 0, 0)
    mainFrame.Position = UDim2.new(1, -470, 0, 30)
    mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 18)
    uiCorner.Parent = mainFrame
    
    local shadowFrame = Instance.new("Frame")
    shadowFrame.Size = UDim2.new(1, 30, 1, 30)
    shadowFrame.Position = UDim2.new(0, -15, 0, -15)
    shadowFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    shadowFrame.BackgroundTransparency = 0.8
    shadowFrame.BorderSizePixel = 0
    shadowFrame.ZIndex = 0
    shadowFrame.Parent = mainFrame
    
    local shadowCorner = Instance.new("UICorner")
    shadowCorner.CornerRadius = UDim.new(0, 18)
    shadowCorner.Parent = shadowFrame
    
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Color = Color3.fromRGB(88, 101, 242)
    uiStroke.Thickness = 2.5
    uiStroke.Transparency = 0.2
    uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uiStroke.Parent = mainFrame
    
    local topGlow = Instance.new("Frame")
    topGlow.Size = UDim2.new(1, 0, 0, 5)
    topGlow.Position = UDim2.new(0, 0, 0, 0)
    topGlow.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    topGlow.BorderSizePixel = 0
    topGlow.ZIndex = 3
    topGlow.Parent = mainFrame
    
    local topGlowCorner = Instance.new("UICorner")
    topGlowCorner.CornerRadius = UDim.new(0, 18)
    topGlowCorner.Parent = topGlow
    
    local topGlowGradient = Instance.new("UIGradient")
    topGlowGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 160, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(88, 101, 242)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 160, 255))
    }
    topGlowGradient.Rotation = 0
    topGlowGradient.Parent = topGlow
    
    local bgGradient = Instance.new("UIGradient")
    bgGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(18, 18, 25)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 22))
    }
    bgGradient.Rotation = 135
    bgGradient.Parent = mainFrame
    
    local particleContainer = Instance.new("Frame")
    particleContainer.Size = UDim2.new(1, 0, 1, 0)
    particleContainer.BackgroundTransparency = 1
    particleContainer.ClipsDescendants = true
    particleContainer.ZIndex = 1
    particleContainer.Parent = mainFrame
    
    for i = 1, 8 do
        local particle = Instance.new("Frame")
        particle.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
        particle.Position = UDim2.new(math.random(0, 100) / 100, 0, math.random(0, 100) / 100, 0)
        particle.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        particle.BackgroundTransparency = 0.7
        particle.BorderSizePixel = 0
        particle.Parent = particleContainer
        
        local particleCorner = Instance.new("UICorner")
        particleCorner.CornerRadius = UDim.new(1, 0)
        particleCorner.Parent = particle
        
        spawn(function()
            while particle and particle.Parent do
                local randomX = math.random(-20, 20) / 100
                local randomY = math.random(-20, 20) / 100
                local currentX = particle.Position.X.Scale
                local currentY = particle.Position.Y.Scale
                local newX = math.clamp(currentX + randomX, 0, 1)
                local newY = math.clamp(currentY + randomY, 0, 1)
                
                TweenService:Create(particle, TweenInfo.new(math.random(2, 4), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    Position = UDim2.new(newX, 0, newY, 0),
                    BackgroundTransparency = math.random(5, 9) / 10
                }):Play()
                wait(math.random(2, 4))
            end
        end)
    end
    
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, -44, 1, -44)
    contentFrame.Position = UDim2.new(0, 22, 0, 22)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ZIndex = 2
    contentFrame.Parent = mainFrame
    
    local iconContainer = Instance.new("Frame")
    iconContainer.Size = UDim2.new(0, 56, 0, 56)
    iconContainer.Position = UDim2.new(0, 0, 0, 0)
    iconContainer.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    iconContainer.BorderSizePixel = 0
    iconContainer.ZIndex = 2
    iconContainer.Parent = contentFrame
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 14)
    iconCorner.Parent = iconContainer
    
    local iconGradient = Instance.new("UIGradient")
    iconGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 160, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(88, 101, 242))
    }
    iconGradient.Rotation = 135
    iconGradient.Parent = iconContainer
    
    local iconStroke = Instance.new("UIStroke")
    iconStroke.Color = Color3.fromRGB(120, 130, 255)
    iconStroke.Thickness = 2
    iconStroke.Transparency = 0.5
    iconStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    iconStroke.Parent = iconContainer
    
    if config.Image and config.Image ~= "" then
        local iconImage = Instance.new("ImageLabel")
        iconImage.Size = UDim2.new(0.85, 0, 0.85, 0)
        iconImage.Position = UDim2.new(0.075, 0, 0.075, 0)
        iconImage.BackgroundTransparency = 1
        iconImage.Image = "rbxassetid://" .. tostring(config.Image)
        iconImage.ScaleType = Enum.ScaleType.Fit
        iconImage.ZIndex = 3
        iconImage.Parent = iconContainer
        
        local imageCorner = Instance.new("UICorner")
        imageCorner.CornerRadius = UDim.new(0, 12)
        imageCorner.Parent = iconImage
    else
        local iconLabel = Instance.new("TextLabel")
        iconLabel.Size = UDim2.new(1, 0, 1, 0)
        iconLabel.BackgroundTransparency = 1
        iconLabel.Text = "I"
        iconLabel.Font = Enum.Font.GothamBold
        iconLabel.TextSize = 32
        iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        iconLabel.ZIndex = 3
        iconLabel.Parent = iconContainer
    end
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -76, 0, 26)
    titleLabel.Position = UDim2.new(0, 68, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = config.Name or "Notification"
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 19
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextYAlignment = Enum.TextYAlignment.Top
    titleLabel.ZIndex = 2
    titleLabel.Parent = contentFrame
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Size = UDim2.new(1, -76, 0, 44)
    descLabel.Position = UDim2.new(0, 68, 0, 30)
    descLabel.BackgroundTransparency = 1
    descLabel.Text = config.Description or "Description"
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextSize = 15
    descLabel.TextColor3 = Color3.fromRGB(205, 205, 220)
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.TextYAlignment = Enum.TextYAlignment.Top
    descLabel.TextWrapped = true
    descLabel.ZIndex = 2
    descLabel.Parent = contentFrame
    
    local separatorLine = Instance.new("Frame")
    separatorLine.Size = UDim2.new(1, 0, 0, 1)
    separatorLine.Position = UDim2.new(0, 0, 1, -52)
    separatorLine.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
    separatorLine.BackgroundTransparency = 0.5
    separatorLine.BorderSizePixel = 0
    separatorLine.ZIndex = 2
    separatorLine.Parent = contentFrame
    
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(1, 0, 0, 40)
    buttonFrame.Position = UDim2.new(0, 0, 1, -48)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.ZIndex = 2
    buttonFrame.Parent = contentFrame
    
    local button1 = Instance.new("TextButton")
    button1.Size = UDim2.new(0.48, 0, 1, 0)
    button1.Position = UDim2.new(0, 0, 0, 0)
    button1.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    button1.BorderSizePixel = 0
    button1.Text = config.Button1 or "OK"
    button1.Font = Enum.Font.GothamBold
    button1.TextSize = 15
    button1.TextColor3 = Color3.fromRGB(255, 255, 255)
    button1.AutoButtonColor = false
    button1.ZIndex = 2
    button1.Parent = buttonFrame
    
    local button1Corner = Instance.new("UICorner")
    button1Corner.CornerRadius = UDim.new(0, 11)
    button1Corner.Parent = button1
    
    local button1Gradient = Instance.new("UIGradient")
    button1Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(118, 131, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(88, 101, 242))
    }
    button1Gradient.Rotation = 90
    button1Gradient.Parent = button1
    
    local button1Stroke = Instance.new("UIStroke")
    button1Stroke.Color = Color3.fromRGB(120, 130, 255)
    button1Stroke.Thickness = 1.5
    button1Stroke.Transparency = 0.6
    button1Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    button1Stroke.Parent = button1
    
    local button2 = Instance.new("TextButton")
    button2.Size = UDim2.new(0.48, 0, 1, 0)
    button2.Position = UDim2.new(0.52, 0, 0, 0)
    button2.BackgroundColor3 = Color3.fromRGB(40, 40, 52)
    button2.BorderSizePixel = 0
    button2.Text = config.Button2 or "Cancel"
    button2.Font = Enum.Font.GothamBold
    button2.TextSize = 15
    button2.TextColor3 = Color3.fromRGB(225, 225, 235)
    button2.AutoButtonColor = false
    button2.ZIndex = 2
    button2.Parent = buttonFrame
    
    local button2Corner = Instance.new("UICorner")
    button2Corner.CornerRadius = UDim.new(0, 11)
    button2Corner.Parent = button2
    
    local button2Stroke = Instance.new("UIStroke")
    button2Stroke.Color = Color3.fromRGB(65, 65, 80)
    button2Stroke.Thickness = 1.5
    button2Stroke.Transparency = 0.4
    button2Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    button2Stroke.Parent = button2
    
    local function closeNotification()
        if not mainFrame or not mainFrame.Parent then return end
        
        local closeTween = TweenService:Create(mainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 450, 0, 0),
            Position = UDim2.new(1, -470, 0, 30)
        })
        closeTween:Play()
        TweenService:Create(mainFrame, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
        closeTween.Completed:Wait()
        if screenGui and screenGui.Parent then
            screenGui:Destroy()
        end
    end
    
    button1.MouseButton1Click:Connect(function()
        if config.Callback1 then
            pcall(function()
                config.Callback1()
            end)
        end
        closeNotification()
    end)
    
    button2.MouseButton1Click:Connect(function()
        if config.Callback2 then
            pcall(function()
                config.Callback2()
            end)
        end
        closeNotification()
    end)
    
    button1.MouseEnter:Connect(function()
        TweenService:Create(button1, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Color3.fromRGB(108, 121, 255),
            Size = UDim2.new(0.49, 0, 1, 0)
        }):Play()
        TweenService:Create(button1Stroke, TweenInfo.new(0.2), {Transparency = 0.3}):Play()
    end)
    
    button1.MouseLeave:Connect(function()
        TweenService:Create(button1, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Color3.fromRGB(88, 101, 242),
            Size = UDim2.new(0.48, 0, 1, 0)
        }):Play()
        TweenService:Create(button1Stroke, TweenInfo.new(0.2), {Transparency = 0.6}):Play()
    end)
    
    button2.MouseEnter:Connect(function()
        TweenService:Create(button2, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Color3.fromRGB(50, 50, 62),
            Size = UDim2.new(0.49, 0, 1, 0)
        }):Play()
        TweenService:Create(button2Stroke, TweenInfo.new(0.2), {Transparency = 0.2}):Play()
    end)
    
    button2.MouseLeave:Connect(function()
        TweenService:Create(button2, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Color3.fromRGB(40, 40, 52),
            Size = UDim2.new(0.48, 0, 1, 0)
        }):Play()
        TweenService:Create(button2Stroke, TweenInfo.new(0.2), {Transparency = 0.4}):Play()
    end)
    
    spawn(function()
        while mainFrame and mainFrame.Parent do
            for i = 0, 1, 0.008 do
                if not mainFrame or not mainFrame.Parent then break end
                topGlowGradient.Offset = Vector2.new(i * 2.5, 0)
                wait(0.025)
            end
        end
    end)
    
    spawn(function()
        while iconContainer and iconContainer.Parent do
            TweenService:Create(iconContainer, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Rotation = 5
            }):Play()
            wait(2)
            if not iconContainer or not iconContainer.Parent then break end
            TweenService:Create(iconContainer, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Rotation = -5
            }):Play()
            wait(2)
        end
    end)
    
    local openTween = TweenService:Create(mainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 450, 0, 175)
    })
    openTween:Play()
    
    TweenService:Create(iconContainer, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0.2), {
        Size = UDim2.new(0, 56, 0, 56)
    }):Play()
    
    spawn(function()
        wait(tonumber(config.Duration) or 5)
        if mainFrame and mainFrame.Parent then
            closeNotification()
        end
    end)
end

return TexNotify
