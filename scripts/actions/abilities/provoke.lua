-----------------------------------
-- Ability: Provoke
-- Job: Warrior
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

    -- Randomly generate values for VIT and STR increases
    local vitIncrease = 10
    -- Duration for both VIT boosts
    local duration = 25 -- Duration in seconds

    if player:getMainJob() == xi.job.WAR then
        vitIncrease = math.random(10, 30) * 2
    end 
        
    player:addStatusEffect(xi.effect.VIT_BOOST, vitIncrease, 3, duration, 0, 10, 1)
    
    -- WAR Only 
    local currentHP = player:getHP()
    local maxHP = player:getMaxHP()

    -- Calculate 80% of the maximum HP
    local eightyPercentMaxHP = maxHP * 0.8

    if player:getMainJob() == xi.job.WAR then
    -- Check if the current HP is above 80% of the maximum HP
        if currentHP > eightyPercentMaxHP then
        -- Player's health is above 80%, grant 1000 TP
            player:addTP(1000)
        else 
            player:addTP(500)
        end 
    else
        player:addTP(250)
    end
end

return abilityObject