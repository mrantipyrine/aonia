-----------------------------------
-- Ability: Chi Blast
-- Releases Chi to attack an enemy.
-- Obtained: Monk Level 41
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    
    local regenAmount = 10
    local regenDuration = 240
   
    if player:getMainJob() == xi.job.MNK then
        caster:addStatusEffect(xi.effect.REGEN, regenAmount, 3, regenDuration, 0, 10, 1)
    end 
 

    return xi.job_utils.monk.useChiBlast(player, target, ability)
end

return abilityObject
