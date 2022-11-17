local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Packages = ReplicatedStorage.Packages
local Knit = require(Packages.Knit)
local Roact = require(Packages.Roact)

local Interface = Knit.CreateController{
    Name = 'Interface'
}

function Interface:KnitInit()
    --[[local StartMatch = Roact.createElement('ScreenGui', {}, {
        ReadyButton = Roact.createElement('TextButton', {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.75),
            Size = UDim2.fromScale(0.1, 0.05),

            [Roact.Event.MouseButton1Click] = function()
                print('Clicked.')
            end
        })
    })

    Roact.mount(StartMatch, Players.LocalPlayer.PlayerGui)]]
end

return Interface