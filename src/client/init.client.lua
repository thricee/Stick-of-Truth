local ReplicatedStorage = game:GetService("ReplicatedStorage")

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Knit = require(ReplicatedStorage.Packages.Knit)

Knit.AddControllersDeep(script.controllers)

local startTime = os.clock()
Knit.Start():andThen(function()
    print('Client knit started in ' .. os.clock() - startTime .. 's')
end)