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

    --- If Mob has less than 10% HP there is a 10% to kill it
    --- This only applies to mobs under level 80

    if player:getMainJob() == xi.job.THF then
        if mobLevel >= 80 then 
            if target:getHP() > 0.1 then
                if math.random(0, 100) >= 10 then
                    target:addHP(-target:getHP())
                end
            end 
        end
    end 

    -- The Amount of HP and TP to Mug
    local hpSteal = target:getHP() - math.random(target:getHP() * 0.1 , target:getHP() * 0.2) 
    local tpSteal = target:getTP() - math.random(target:getTP() * 0.1, target:getTP() * 0.2)
    local lostTP = 3000 - player:getTP()  

    player:addHP(hpDrain)
    player:addTP(lostTP)
   
    -- player:addHP(targetHP)
    target:addTP(-tpDrain)
    target:addHP(-hpDrain)

    return xi.job_utils.thief.useMug(player, target, ability, action)
end

return abilityObject
