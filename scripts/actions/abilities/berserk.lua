-----------------------------------
-- Ability: Berserk
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useBerserk(player, target, ability)

    -- Grant the attack bonus
    local attackBonus = 30
    local attackDuration = 150 -- 2 minutes and 30 seconds in seconds
    player:addMod(xi.mod.ATTACK, attackBonus, attackDuration)

    -- Apply the Haste effect instead of Advancing March
    local hasteDuration = 300 -- 2 minutes and 30 seconds in seconds
    player:addStatusEffect(xi.effect.HASTE, 30, 3, hasteDuration, 0, 10, 1)
end

return abilityObject
