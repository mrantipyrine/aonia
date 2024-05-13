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

    local tpGain = 250
    local counterIncrease = 10
    local counterDuration = 240 

    if player:getMainJob() == xi.job.MNK then
        tpGain = 1000
        player:addStatusEffect(xi.effect.COUNTER_BOOST, counterIncrease, 3, counterDuration, 0, 10, 1)
    end 
    -- Grant TP to the player
    player:addTP(tpGain)
end

return abilityObject