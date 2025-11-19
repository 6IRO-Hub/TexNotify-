local TexNotify = {}

local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

function TexNotify:Show(config)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "TexNotifyGui"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = PlayerGui
    
    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Name = "NotificationFrame"
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.Position = UDim2.new(1, 20, 0, 20)
    NotificationFrame.Size = UDim2.new(0, 280, 0, 0)
    NotificationFrame.ClipsDescendants = true
    NotificationFrame.Parent = ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = NotificationFrame
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(80, 80, 100)
    UIStroke.Thickness = 2
    UIStroke.Transparency = 0.5
    UIStroke.Parent = NotificationFrame
    
    local Glow = Instance.new("ImageLabel")
    Glow.Name = "Glow"
    Glow.BackgroundTransparency = 1
    Glow.Position = UDim2.new(0, -15, 0, -15)
    Glow.Size = UDim2.new(1, 30, 1, 30)
    Glow.Image = "rbxassetid://5028857084"
    Glow.ImageColor3 = Color3.fromRGB(100, 100, 255)
    Glow.ImageTransparency = 0.7
    Glow.ZIndex = 0
    Glow.Parent = NotificationFrame
    
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.Name = "ImageLabel"
    ImageLabel.BackgroundTransparency = 1
    ImageLabel.Position = UDim2.new(0, 12, 0, 12)
    ImageLabel.Size = UDim2.new(0, 45, 0, 45)
    ImageLabel.Image = "rbxassetid://" .. tostring(config.Image or "")
    ImageLabel.Parent = NotificationFrame
    
    local ImageCorner = Instance.new("UICorner")
    ImageCorner.CornerRadius = UDim.new(0, 8)
    ImageCorner.Parent = ImageLabel
    
    local ImageStroke = Instance.new("UIStroke")
    ImageStroke.Color = Color3.fromRGB(255, 255, 255)
    ImageStroke.Thickness = 1.5
    ImageStroke.Transparency = 0.8
    ImageStroke.Parent = ImageLabel
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 65, 0, 12)
    TitleLabel.Size = UDim2.new(1, -75, 0, 18)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = config.Name or "Notification"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 15
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = NotificationFrame
    
    local DescriptionLabel = Instance.new("TextLabel")
    DescriptionLabel.Name = "DescriptionLabel"
    DescriptionLabel.BackgroundTransparency = 1
    DescriptionLabel.Position = UDim2.new(0, 65, 0, 32)
    DescriptionLabel.Size = UDim2.new(1, -75, 0, 25)
    DescriptionLabel.Font = Enum.Font.Gotham
    DescriptionLabel.Text = config.Description or ""
    DescriptionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    DescriptionLabel.TextSize = 12
    DescriptionLabel.TextWrapped = true
    DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescriptionLabel.TextYAlignment = Enum.TextYAlignment.Top
    DescriptionLabel.Parent = NotificationFrame
    
    local ButtonContainer = Instance.new("Frame")
    ButtonContainer.Name = "ButtonContainer"
    ButtonContainer.BackgroundTransparency = 1
    ButtonContainer.Position = UDim2.new(0, 12, 0, 65)
    ButtonContainer.Size = UDim2.new(1, -24, 0, 32)
    ButtonContainer.Parent = NotificationFrame
    
    local buttonCount = 0
    if config.Button1 then buttonCount = buttonCount + 1 end
    if config.Button2 then buttonCount = buttonCount + 1 end
    
    local totalHeight = 69
    if buttonCount > 0 then
        totalHeight = 107
    end
    
    local function createButton(text, index, buttonName)
        local buttonWidth = (256 - (buttonCount - 1) * 6) / buttonCount
        local Button = Instance.new("TextButton")
        Button.Name = "Button" .. index
        Button.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        Button.Position = UDim2.new(0, (buttonWidth + 6) * (index - 1), 0, 0)
        Button.Size = UDim2.new(0, buttonWidth, 0, 32)
        Button.Font = Enum.Font.GothamBold
        Button.Text = text
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 12
        Button.AutoButtonColor = false
        Button.Parent = ButtonContainer
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 8)
        ButtonCorner.Parent = Button
        
        local ButtonStroke = Instance.new("UIStroke")
        ButtonStroke.Color = Color3.fromRGB(100, 100, 120)
        ButtonStroke.Thickness = 1
        ButtonStroke.Transparency = 0.6
        ButtonStroke.Parent = Button
        
        Button.MouseEnter:Connect(function()
            TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 80)}):Play()
        end)
        
        Button.MouseLeave:Connect(function()
            TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}):Play()
        end)
        
        Button.MouseButton1Click:Connect(function()
            if config.Callback and type(config.Callback) == "function" then
                pcall(function()
                    config.Callback(buttonName)
                end)
            end
            
            local specificCallback = config[buttonName .. "Callback"]
            if specificCallback and type(specificCallback) == "function" then
                pcall(specificCallback)
            end
            
            TweenService:Create(NotificationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Position = UDim2.new(1, 20, 0, 20)
            }):Play()
            task.wait(0.3)
            ScreenGui:Destroy()
        end)
        
        return Button
    end
    
    local currentButton = 1
    if config.Button1 then
        createButton(config.Button1, currentButton, "Button1")
        currentButton = currentButton + 1
    end
    if config.Button2 then
        createButton(config.Button2, currentButton, "Button2")
    end
    
    if config.Sound then
        pcall(function()
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://" .. tostring(config.Sound)
            Sound.Volume = 0.5
            Sound.Parent = SoundService
            Sound:Play()
            task.delay(5, function()
                Sound:Destroy()
            end)
        end)
    end
    
    local SizeUpTween = TweenService:Create(NotificationFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 280, 0, totalHeight)
    })
    
    local SlideInTween = TweenService:Create(NotificationFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -300, 0, 20)
    })
    
    SizeUpTween:Play()
    SizeUpTween.Completed:Wait()
    SlideInTween:Play()
    
    if buttonCount == 0 then
        task.wait(config.Duration or 5)
        
        local SlideOutTween = TweenService:Create(NotificationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 20, 0, 20)
        })
        
        SlideOutTween:Play()
        SlideOutTween.Completed:Wait()
        ScreenGui:Destroy()
    end
end

return TexNotify
