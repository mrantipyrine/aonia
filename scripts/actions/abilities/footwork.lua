local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

local function removeAttackIncrease(player)
    -- Remove the attack increase
    player:addMod(xi.mod.ATTACK, -150)  -- Assuming the attack was increased by 150
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useFootwork(player, target, ability)

    -- Add Haste II
    local hasteDuration = 60 -- Duration in seconds
    local hasteAmount = 30 -- Haste amount (in percentage)
    player:addStatusEffect(xi.effect.HASTE_II, hasteAmount, 3, hasteDuration, 0, 10, 1)

    -- Increase attack by 150
    player:addMod(xi.mod.ATTACK, 150)

    -- Set up a timer to remove the attack increase after 90 seconds
    local removeDuration = 90 -- 90 seconds
    xi.timers.createTimer(player, "remove_attack_bonus", xi.timer.TYPE_ABILITY, removeDuration, function()
        removeAttackIncrease(player)
    end)
end

return abilityObject
