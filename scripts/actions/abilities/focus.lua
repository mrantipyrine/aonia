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
    -- Generate a random TP value between 1000 and 3000

    local tpGain = math.random(250, 500)

    local strIncrease = math.random(10, 45)
  
    if player:getMainJob() == xi.job.MNK then
        tpGain = tpGain * math.random(1, 5)
        player:addStatusEffect(xi.effect.STR_BOOST, strIncrease * 2, 3, duration, 0, 10, 1)
    end 

    -- Grant TP to the player
    player:addTP(tpGain)
end

return abilityObject