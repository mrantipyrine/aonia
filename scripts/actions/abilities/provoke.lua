-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-- Restores Health / Gains TP 
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)

    -- Restore 80% of lost HP
    if player:getMainJob() == xi.job.WAR then
        local lostHP = player:getMaxHP() - player:getHP()
        local hpToRestore = math.floor(lostHP * 0.8)
        player:setHP(player:getHP() + hpToRestore)
    end

    tpGain = math.random(250, 500)

    if player:getMainJob() == xi.job.WAR then
        tpGain = tpGain * 2
    end 
 
    player:addTP(tpGain)

end

return abilityObject