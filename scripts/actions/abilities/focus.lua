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

    -- If Focus is active and the weapon skill is Raging Fist, allow the use of the weapon skill
    if focusActive and weaponskill == xi.weapon_skill.RAGING_FIST then
        return true
    else
        return false
    end
end

return abilityObject