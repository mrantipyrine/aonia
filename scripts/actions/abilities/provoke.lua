-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Restore 80% missing health
    local missingHP = player:getMaxHP() - player:getHP()
    local hpToRestore = math.floor(missingHP * 0.8)
    player:addHP(hpToRestore)

    local vitIncrease = 20
    local vitDuration = 25 -- Duration in seconds

    -- Increase strength
    player:addStatusEffect(xi.effect.VIT_BOOST, vitIncrease, 3, vitDuration, 0, 10, 1)

    player:addTP(500)
end

return abilityObject