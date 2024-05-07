-----------------------------------
-- Ability: Focus
-- Enhances user's accuracy.
-- Obtained: Monk Level 25
-- Recast Time: 5:00
-- Duration: 2:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useFocus(player, target, ability)

    -- Set a flag to indicate whether Focus is active
    player:setTempData("focus_active", true)

    -- Set a timer to remove the flag when Focus expires
    xi.timers.createTimer(player, "focus_timer", xi.timer.TYPE_ABILITY, 120, function()
        player:setTempData("focus_active", false)
    end)
end

abilityObject.onWeaponSkillAttempt = function(player, target, ability, weaponskill)
    -- Check if Focus is active
    local focusActive = player:getTempData("focus_active")

    -- Check if player is engaged with a target and in range
    local engaged = player:isEngaged()
    local inRange = player:isInWeaponSkillRange(target)

    -- Check for a 10% chance
    local chance = math.random()
    local chanceThreshold = 0.8

    -- If Focus is active, player is engaged, and in range, and the weapon skill is Raging Fist, and the chance is met, allow the use of the weapon skill
    if focusActive and engaged and inRange and weaponskill == xi.weapon_skill.RAGING_FIST and chance <= chanceThreshold then
        return true
    else
        return false
    end
end

return abilityObject