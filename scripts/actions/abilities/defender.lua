-----------------------------------
-- Ability: Defender
-- Job: Warrior
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useDefender(player, target, ability)

    local maxHP = 55
    local maxHPDuration = 120

    if player:getMainJob() == xi.job.WAR then
        maxHP = maxHP * 2
        maxHPDuration = maxHPDuration * 2
    end
    
    -- Increase Max HP and Restore 80% missing  
    player:addStatusEffect(xi.effect.MAX_HP_BOOST, maxHP, 1, maxHPDuration)
    
    local lostHP = player:getMaxHP() - player:getHP()
    local hpToRestore = math.floor(lostHP * 0.8)
    player:setHP(player:getHP() + hpToRestore)

end

return abilityObject