-----------------------------------
-- Ability: Flee
-- Increases movement speed.
-- Obtained: Thief Level 25
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    
    regenDuration = 60 
    regenAmount = 30
    if player:getMainJob() == xi.job.THF then
       regenDuration = regenDuration * 10
    end

    player:addStatusEffect(xi.effect.REGEN, regenAmount, 3, regenDuration, 0, 10, 1)
    xi.job_utils.thief.useFlee(player, target, ability)
end

return abilityObject
