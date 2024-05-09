-----------------------------------
-- Ability: Dodge
-- Enhances user's evasion.
-- Obtained: Monk Level 15
-- Recast Time: 5:00
-- Duration: 2:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Increase evasion by 50 for 2 minutes

    local evasionIncrease = 20
    local evasionDuration = 120 -- 2 minutes in seconds
    
    if player:getMainJob() == xi.job.MNK then
        evasionIncrease = math.random(10,20) * 2
    end 

    player:addStatusEffect(xi.effect.EVASION_BOOST, evasionIncrease, 3, evasionDuration, 0, 10, 1)

    -- Enhance counter ability by +5 for 2 minutes
    local counterIncrease = 5
    local counterDuration = 120 -- 2 minutes in seconds
    player:addStatusEffect(xi.effect.COUNTER_BOOST, counterIncrease, 3, counterDuration, 0, 10, 1)
end 

return abilityObject