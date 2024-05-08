-----------------------------------
-- Ability: Focus
-- Enhances user's accuracy.
-- Obtained: Monk Level 25
-- Recast Time: 5:00
-- Duration: 2:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Generate a random TP value between 1000 and 3000

    if player:getMainJob() == xi.job.MNK then
        local tpGain = math.random(1000, 3000)
    else 
        local tpGain = math.random(250, 1000)
    end 
    -- Grant TP to the player
    player:addTP(tpGain)
end

return abilityObject