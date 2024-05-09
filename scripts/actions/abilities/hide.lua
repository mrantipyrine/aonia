-----------------------------------
-- Ability: Hide
-- User becomes invisible.
-- Obtained: Thief Level 45
-- Recast Time: 5:00
-- Duration: Random
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)

    evasionIncrease = 20
    evasionDuration = 120 -- 2 minutes in seconds
    
    if player:getMainJob() == xi.job.THF then
        player:addStatusEffect(xi.effect.HUNDRED_FISTS, 1, 35, 0)
    end

    xi.job_utils.thief.useHide(player, target, ability)
end

return abilityObject
