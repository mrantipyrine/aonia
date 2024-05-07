-----------------------------------
-- Ability: Counterstance
-- Increases chance to counter but lowers defense.
-- Obtained: Monk Level 45
-- Recast Time: 5:00
-- Duration: 5:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

local function adjustKickDamage(player)
    -- Increase kick attacks damage by 40%
    player:addMod(xi.mod.KICK_DAMAGE, 0.4)
end

abilityObject.onUseAbility = function(player, target, ability)
    -- Adjust kick damage for Counterstance
    adjustKickDamage(player)
end

return abilityObject
