-----------------------------------
-- Ability: Defender
-- Job: Warrior
-----------------------------------
local abilityObject = {}

-- Function to add evasion buff
local function addEvasionBuff(target, amount, duration)
    -- Initialize evasion attribute if it's not already defined
    target.evasion = target.evasion or 0
    -- Increase evasion by the specified amount
    target.evasion = target.evasion + amount
    -- Schedule a timer to remove the evasion buff after the specified duration
    Timer.after(duration, function() target.evasion = target.evasion - amount end)
end

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useDefender(player, target, ability)
    -- Increase evasion by 100 for 120 seconds
    addEvasionBuff(target, 100, 120)
end

return abilityObject
