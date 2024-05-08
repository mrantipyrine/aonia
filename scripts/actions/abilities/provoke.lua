-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(user, target, ability)
    local tpRestore = 0
    local healthRestore = 0
    
    -- Check if the main job is Warrior
    if user:getMainJob() == 'WAR' then
        tpRestore = 700
        healthRestore = user:getMaxHP() * 0.8
        print("Main job is Warrior. TP Restore:", tpRestore, "Health Restore:", healthRestore)
    -- Check if Warrior is a subjob
    elseif user:getSubJob() == 'WAR' then
        tpRestore = 350
        healthRestore = user:getMaxHP() * 0.45
        print("Subjob is Warrior. TP Restore:", tpRestore, "Health Restore:", healthRestore)
    end
    
    -- Restore TP
    user:addTP(tpRestore)
    
    -- Restore health
    user:setHP(user:getHP() + healthRestore)
    print("TP Restored:", tpRestore, "HP Restored:", healthRestore)
end

return abilityObject