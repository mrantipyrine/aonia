-----------------------------------
-- Ability: Defender
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

local function adjustAttributes(player)
    -- Increase evasion by 50 and defense by 50
    player:addMod(xi.mod.EVASION, 50)
    player:addMod(xi.mod.DEFENSE, 50)
end

local function removeAttributes(player)
    -- Remove the adjustments made to evasion and defense
    player:addMod(xi.mod.EVASION, -50)
    player:addMod(xi.mod.DEFENSE, -50)
end


abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useDefender(player, target, ability)

    adjustAttributes(player)
    
    xi.timers.createTimer(player, "defemder_cleanup", xi.timer.TYPE_ABILITY, ability:getDuration(), function()
        removeAttributes(player) end)

   ---    adjustAttributes(player)
   ---  xi.scheduler.scheduleFunction(removeAttributes, 120) -

return abilityObject