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

    local strIncrease = 40
    local strDuration = 25 -- Duration in seconds

    -- Increase strength
    player:addStatusEffect(xi.effect.VSTR_BOOST, strIncrease, 3, strDuration, 0, 10, 1)

    -- Grant 500 TP
    player:addTP(500)
end


return abilityObject