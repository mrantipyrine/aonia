-----------------------------------
-- Wasp Sting
-- Dagger weapon skill
-- Skill level: 5
-- Poisons target. Duration of effect varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Soil Gorget.
-- Aligned with the Soil Belt.
-- Element: None
-- Modifiers: :    DEX:100%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 1.0, 1.0, 1.0 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.dex_wsc = 1.0
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    if damage > 0 and not target:hasStatusEffect(xi.effect.POISON) then
        local duration = (75 + (tp / 1000 * 15)) * applyResistanceAddEffect(player, target, xi.element.WATER, 0)
        target:addStatusEffect(xi.effect.POISON, 1, 0, duration)
    end

    local hp = math.floor(tp / 1000) * 0.9 * player:getMaxHP()
    local main = player:getMainJob()
    local tp = math.random(1000, 2000)
    local level = caster:getMainLvl()
    local haste = (level >= 50 and level * 4 or level * 2) or math.floor(level / 2)
    local duration = 120 

    if main == xi.job.THF then
        if not player:hasStatusEffect(xi.effect.HASTE) then
            player:addStatusEffect(xi.effect.HASTE, haste, 3, duration)
        end
    end      

    if math.random() <= 0.5 then
        player:addTP(tp)
    end

    player:addHP(hp)
    
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
~                                
