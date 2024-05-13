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
    local evasionDuration = 120
    
    if player:getMainJob() == xi.job.MNK then
        
        evasionIncrease = 80
        evasionDuration = 240

        player:addStatusEffect(xi.effect.COUNTER_BOOST, counterIncrease, 3, counterDuration, 0, 10, 1)
    end 

    player:addStatusEffect(xi.effect.EVASION_BOOST, evasionIncrease, 3, evasionDuration, 0, 10, 1)

    xi.job_utils.monk.useDodge(player, target, ability)
end 

return abilityObject