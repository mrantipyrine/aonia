-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(user, target, ability)
    local hasteDuration = 180 -- Haste duration in seconds
    local hasteAmount = 30 -- Haste amount (percentage)

    -- Add haste effect
    user:addStatusEffect(xi.effect.HASTE, hasteAmount, 3, hasteDuration, 0, 10, 1)

    -- Restore 80% of max health
    local healthRestore = user:getMaxHP() * 0.8
    user:setHP(user:getHP() + healthRestore)
end

return abilityObject