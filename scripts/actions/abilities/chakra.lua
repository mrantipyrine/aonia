local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

local function increaseAttack(player)
    -- Increase attack by 100
    player:addMod(xi.mod.ATTACK, 100)
end

local function removeAttackIncrease(player)
    -- Remove the attack increase
    player:addMod(xi.mod.ATTACK, -100)
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Increase attack by 100
    increaseAttack(player)

    -- Set up a timer to remove the attack increase after 1 minute
    local duration = 60 -- 1 minute in seconds
    xi.timers.createTimer(player, "ability_duration", xi.timer.TYPE_ABILITY, duration, function()
        removeAttackIncrease(player)
    end)
end

return abilityObject