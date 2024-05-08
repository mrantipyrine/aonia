-----------------------------------
-- Ability: Provoke
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(user, target, ability)
    --Leave blank.
    
    -- Restore 80% of lost HP
    local lostHP = player:getMaxHP() - player:getHP()
    local hpToRestore = math.floor(lostHP * 0.8)
    player:setHP(player:getHP() + hpToRestore)

    -- Grant 500 TP
    player:addStatusEffect(xi.effect.HASTE_II, hasteAmount, 3, hasteDuration, 0, 10, 1)

end



return abilityObject
