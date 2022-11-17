local CollectionService = game:GetService("CollectionService")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild('Packages')

local Timer = require(Packages.Timer)
local Knit = require(Packages.Knit)

local Match = Knit.CreateService{
    Name = "Match";
    Client = {};
}

function Match:KnitInit()
    local Matches: Folder = workspace:FindFirstChild('Matches')
    self.Directory = Matches

end

function Match:Initialize(MatchSettings: {MatchID: string, Enemies: {Model}})

    --[[
        Enemy<Model>: {
            Settings<ModuleScript>: {
                [Require]
                Health<number>
                Level<number> -- Level effects damage output
            }
        }

        ReplicatedStorage<ReplicatedStorage>: {
            EnemyAttacks<Folder>: {
                ENEMY_NAME<ModuleScript>: {
                    [Require]
                    Attacks<table>: {
                        [1]<function>(PlayerTeam<table>, CurrentLevel<number>)
                    }
                }
            }
        }
    ]]

    --[[local Tagged = CollectionService:GetTagged(shared.FighterTag)

    enemyModel:GetAttributeChangedSignal('Ready'):Connect(function()
        if not enemyModel:GetAttribute('Ready') then
            print('Starting timer for ' .. Options.Cooldown .. ' seconds!')
            local EnemyTimer = Timer.new(Options.Cooldown)
            EnemyTimer.Tick:ConnectOnce(function()
                print('Timer has ended, enemy is ready to be defeated!')
                enemyModel:SetAttribute('Ready', true)
            end)

            EnemyTimer:Start()
        end
    end)

    if not table.find(Tagged, enemyModel) then
        CollectionService:AddTag(enemyModel, shared.FighterTag)
    end
    
    for option, value in pairs(Options) do
        enemyModel:SetAttribute(option, value)
    end

    local enemyRootPart = enemyModel.PrimaryPart]]
end

return Match