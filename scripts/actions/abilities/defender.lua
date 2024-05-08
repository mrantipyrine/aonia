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
    -- Increase evasion by 100 for 120 seconds
    target:addEvasionBuff(100, 120)
end

return abilityObject