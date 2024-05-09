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
    if player:getMainJob() == xi.job.THF then
        xi.job_utils.thief.useWarcry(player, target, ability)
    end 
    xi.job_utils.thief.useHide(player, target, ability)
end

return abilityObject
