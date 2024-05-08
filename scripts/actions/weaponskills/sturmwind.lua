-----------------------------------
-- Sturmwind
-- Great Axe weapon skill
-- Skill level: 70
-- Delivers a two-hit attack. Attack varies with TP.
-- Will stack with Sneak Attack, but only the first hit.
-- Aligned with the Soil Gorget & Aqua Gorget.
-- Aligned with the Soil Belt & Aqua Belt.
-- Element: None
-- Modifiers: STR:60%
-- 100%TP    200%TP    300%TP
-- 1.0       2.0       3.5
-----------------------------------
llocal weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 1.0, 1.0, 1.0 }
    params.str_wsc = 0.3
    params.atkVaries = { 1.0, 2.0, 3.5 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.str_wsc = 0.6
    end

    -- Add stun effect
    local stunChance = 1.0 -- 100% chance to stun
    local stunDuration = 5 -- Duration of stun in seconds

    -- Add critical hit chance
    local critChance = 1.0 -- 100% chance to crit

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    
    -- Check if stun occurs
    if math.random() < stunChance then
        target:addStatusEffect(EFFECT_STUN, 1, stunDuration, 0)
    end

    -- Check if critical hit occurs
    if math.random() < critChance then
        criticalHit = true
    end

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject