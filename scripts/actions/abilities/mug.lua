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
        if target:getMainLvl() >= 80 then
            if target:getHP() > 0.2 then
                if math.random(0, 100) >= 20 then
                    target:addHP(-target:getHP())
                end
            end
        end
    end

    -- The Amount of HP and TP to Mug
    local hpSteal = math.random(300, 800)
    local tpSteal = math.random(1000, 1500)

    -- If main job above 40 then more HP and TP 
    if player:getMainLvl() > 40 then
        hpSteal = math.random(500, 1100)
        tpSteal = math.random(1500, 2000)
    end

    player:addHP(hpSteal)
    player:addTP(tpSteal)

    target:addTP(-tpSteal)
    target:addHP(-hpSteal)

    return xi.job_utils.thief.useMug(player, target, ability, action)
end

return abilityObject