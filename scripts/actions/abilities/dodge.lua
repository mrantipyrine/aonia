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
    
    if player:getMainJob() == xi.job.MNK then
        
        local counterIncrease = player:getMainJob() * 10
        local evasionIncrease = player:getMainLvl() * 2
        local duration = 240

        player:addStatusEffect(xi.effect.EVASION_BOOST, evasionIncrease, 3, duration, 0, 10, 1)
        player:addStatusEffect(xi.effect.COUNTER_BOOST, counterIncrease, 3, duration, 0, 10, 1)
    end 

    xi.job_utils.monk.useDodge(player, target, ability)
end 

return abilityObject