-----------------------------------
-- Ability: Defender
-- Job: Warrior
-- Adds Max HP 
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.warrior.useDefender(player, target, ability)

    local regainAmount = 55
    local regainDuration = 120

    if player:getMainJob() == xi.job.WAR then
        maxHP = maxHP * 2
        maxHPDuration = maxHPDuration * 2
    end
    

    player:addStatusEffect(xi.mod.DEF, 100, 3, regainDuration, 0)
    player:addStatusEffect(xi.effect.REGEN, regenAmount, 3, regenDuration, 0, 10, 1)

    -- Increase Max HP and Restore 80% missing  
    layer:addStatusEffect(xi.effect.MAX_HP_BOOST, maxHP, 1, maxHPDuration)
    
    local lostHP = player:getMaxHP() - player:getHP()
    local hpToRestore = math.floor(lostHP * 0.8)
    player:setHP(player:getHP() + hpToRestore)

end

return abilityObject