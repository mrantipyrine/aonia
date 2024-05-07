-----------------------------------
-- Ability: Footwork
-- Makes kicks your primary mode of attack.
-- Obtained: Monk Level 65
-- Recast Time: 5:00
-- Duration: 1:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useFootwork(player, target, ability)

    -- Add Haste II
    local hasteDuration = 60 -- Duration in seconds
    local hasteAmount = 30 -- Haste amount (in percentage)
    player:addStatusEffect(xi.effect.HASTE_II, hasteAmount, 3, hasteDuration, 0, 10, 1)

    -- Increase attack by 150
    player:addMod(xi.mod.ATTACK, 150)
end

return abilityObject