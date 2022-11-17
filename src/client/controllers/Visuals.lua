local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")


if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Packages = ReplicatedStorage.Packages
local Knit = require(Packages.Knit)
local Spring = require(Packages.Spring)
local Roact = require(Packages.Roact)

local Visuals = Knit.CreateController{ 
    Name = 'Visuals'
}

function Visuals:KnitInit()
    print('Knit started.')
    local function FighterAdded(Fighter: Model)
        local Client = Players.LocalPlayer

        local PointLight = Instance.new('PointLight')
        PointLight.Color = Color3.new(0, 1, 0)
        PointLight.Range = 0

        local HighlightCylinder = Instance.new('CylinderHandleAdornment')
        HighlightCylinder.Color3 = Color3.fromRGB(1, 255, 94)
        HighlightCylinder.Transparency = 0.1
        HighlightCylinder.CFrame = CFrame.Angles(math.rad(90), 0, 0)
        HighlightCylinder.Height = 0.5
        HighlightCylinder.InnerRadius = 0
        HighlightCylinder.Radius = 0
        HighlightCylinder.SizeRelativeOffset = Vector3.new(0, -2.75, 0)
        HighlightCylinder.Parent = Fighter

        local FirstSpring = Spring.new(0)
        local SecondSpring = Spring.new(0)

        FirstSpring.Position = HighlightCylinder.Radius
        SecondSpring.Position = HighlightCylinder.InnerRadius
        

        local FighterRoot = Fighter.PrimaryPart

        RunService.Heartbeat:Connect(function()
            HighlightCylinder.Adornee = FighterRoot
            PointLight.Parent = FighterRoot

            local Distance = Client:DistanceFromCharacter(FighterRoot.Position)
            if Distance and Distance <= 25 then
                FirstSpring.Speed = 15
                SecondSpring.Speed = 9

                FirstSpring.Target = 25
                SecondSpring.Target = 23

                PointLight.Range = FirstSpring.Position
                HighlightCylinder.Radius = FirstSpring.Position
                HighlightCylinder.InnerRadius = SecondSpring.Position
            else
                FirstSpring.Speed = 5
                SecondSpring.Speed = 10

                FirstSpring.Target = 0
                SecondSpring.Target = 0

                PointLight.Range = FirstSpring.Position
                HighlightCylinder.Radius = FirstSpring.Position
                HighlightCylinder.InnerRadius = SecondSpring.Position
            end
        end)
    end

    for _, v in pairs(CollectionService:GetTagged('Fighter')) do
        FighterAdded(v)
    end

    CollectionService:GetInstanceAddedSignal('Fighter'):Connect(FighterAdded)
end

return Visuals