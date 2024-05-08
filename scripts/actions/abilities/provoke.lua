-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    local doubleAttackBonus = 1 -- Double Attack bonus
    local doubleAttackDuration = 120 -- Duration in seconds

    -- Add Double Attack +1 effect
    if player then
        player:addStatusEffect(xi.effect.DOUBLE_ATTACK, doubleAttackBonus, 3, doubleAttackDuration, 0, 10, 1)
    else
        log('Player object is nil!')
    end
   
    -- Restore 80% of max health
    local healthRestore = user:getMaxHP() * 0.8
    user:setHP(user:getHP() + healthRestore)

end

return abilityObject
