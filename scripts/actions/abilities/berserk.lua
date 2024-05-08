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

    -- Grant the defense bonus
    local defenseBonus = 30
    local defenseDuration = 150 -- 2 minutes and 30 seconds in seconds
    player:addMod(xi.mod.DEFENSE, defenseBonus, defenseDuration)

    local hasteDuration = 180 -- 3 minutes in seconds
    player:addStatusEffect(xi.effect.HASTE, 30, 3, hasteDuration, 0, 10, 1)

end

return abilityObject
