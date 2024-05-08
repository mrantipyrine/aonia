-----------------------------------
-- Ability: Defender
-- Job: Warrior
-----------------------------------
local abilityObject = {}


abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useDefender(player, target, ability)
    
    local evasionIncrease = 50
    local evasionDuration = 300 -- 2 minutes in seconds
    player:addStatusEffect(xi.effect.EVASION_BOOST, evasionIncrease, 3, evasionDuration, 0, 10, 1)

end

return abilityObject