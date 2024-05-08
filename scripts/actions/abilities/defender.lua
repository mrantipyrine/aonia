-----------------------------------
-- Ability: Defender
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useDefender(player, target, ability)

    -- Increase evasion by 100
    local mods = require("scripts.utils.mods") -- Import the mods table
    target:addMod(mods.EVASION, 100)
end

return abilityObject