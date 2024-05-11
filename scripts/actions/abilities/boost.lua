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

    local tpGain = math.random(100, 200)
    local strIncrease = 5

    if player:getMainJob() == xi.job.MNK then
        strIncrease = 15
        tpGain = math.random(500, 1500)
    end 

    player:addStatusEffect(xi.effect.STR_BOOST, strIncrease * 2, 3, duration, 0, 10, 1)
    player:addTP(tpGain)

end

return abilityObject