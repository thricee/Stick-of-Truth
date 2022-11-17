local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

Knit.AddServicesDeep(script.services)

local startTime = os.clock()
Knit.Start({ ServicePromises = false }):andThen(function()
    print('Server knit started in ' .. os.clock() - startTime .. 's')

    local Match = Knit.GetService('Match')
end)    