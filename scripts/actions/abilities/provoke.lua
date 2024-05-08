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

    local attackIncrease = 100
    local attackDuration = 25 -- Duration in seconds

    -- Increase attack power
    player:addMod(xi.mod.ATTACK, attackIncrease)

    -- Set up a timer to remove the attack increase after the duration
    xi.timers.createTimer(player, "ability_duration", xi.timer.TYPE_ABILITY, attackDuration, function()
        player:addMod(xi.mod.ATTACK, -attackIncrease)
    end)
end

return abilityObject