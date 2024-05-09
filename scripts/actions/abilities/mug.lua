-----------------------------------
-- Ability: Mug
-- Steal gil from enemy.
-- Obtained: Thief Level 35
-- Recast Time: 5:00
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability, action)



    
    local agiMod = player:getStat(xi.mod.AGI) * math.random(0.3, 0.8)


    local lostHP = player:getMaxHP() - player:getHP()
    local lostTP = 3000 - player:getTP()  

    local dexMod = player:getStat(xi.mod.DEX) * 0.8
    
    local hpDrain =  target:getHP()  * dexMod     

    player:setHP(player:getHP() + hpDrain)

   
    --local targetTP = target:getTP() 

    --hpDrain = targetHP * dexMod    

    --tpDrain = targetTP / agiMod 

    --player:setTP(player:getTP() + tpDrain)



    -- player:addHP(targetHP)
    target:addTP(-tpDrain)
    target:addHP(-hpDrain)

    return xi.job_utils.thief.useMug(player, target, ability, action)
end

return abilityObject
