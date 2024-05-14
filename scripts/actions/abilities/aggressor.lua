-----------------------------------
-- Ability: Aggressor
-- Job: Warrior
-- Adds Regain 
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)

    regainAmount = math.random(10, 25)
    regainDuration = 60

    
    player:addStatusEffect(xi.effect.REGAIN, regainAmount, regainDuration, 0)

    xi.job_utils.warrior.useAggressor(player, target, ability)
end

return abilityObject
