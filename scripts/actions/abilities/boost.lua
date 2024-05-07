-----------------------------------
-- Ability: Boost
-- Enhances user's next attack.
-- Obtained: Monk Level 5
-- Recast Time: 0:15
-- Duration: 3:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useBoost(player, target, ability)

    -- Restore 80% of lost HP
    local lostHP = player:getMaxHP() - player:getHP()
    local hpToRestore = math.floor(lostHP * 0.8)
    player:setHP(player:getHP() + hpToRestore)
end

return abilityObjectreturn abilityObject