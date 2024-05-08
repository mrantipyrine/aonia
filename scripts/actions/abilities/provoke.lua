-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(user, target, ability)
    local storeTpBonus = 4 -- Store TP bonus
    local storeTpDuration = 120 -- Duration in seconds

    -- Add Store TP +4 effect
    if player then
        player:addStatusEffect(xi.effect.STORE_TP, storeTpBonus, 3, storeTpDuration, 0, 10, 1)
    else
        log('Player object is nil!')
    end
       
    -- Restore 80% of max health
        local healthRestore = user:getMaxHP() * 0.8
        user:setHP(user:getHP() + healthRestore)
end

return abilityObject
