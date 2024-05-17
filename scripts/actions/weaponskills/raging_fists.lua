local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {
        numHits = 5,
        ftpMod = {1.0, 1.5, 2.0},
        str_wsc = 0.2,
        dex_wsc = 0.2
    }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitfTP = true
        params.ftpMod = {1.0, 2.1875, 3.75}
        params.str_wsc = 0.3
        params.dex_wsc = 0.3
    end

    local function executeWeaponSkill()
        return xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    end

    local damage1, criticalHit1, tpHits1, extraHits1 = executeWeaponSkill()
    local damage2, criticalHit2, tpHits2, extraHits2

    if math.random(0, 100) <= 10 then
        damage2, criticalHit2, tpHits2, extraHits2 = executeWeaponSkill()
    else
        damage2, criticalHit2, tpHits2, extraHits2 = 0, false, 0, 0
    end

    local totalDamage = damage1 + damage2
    local totalCriticalHit = criticalHit1 or criticalHit2
    local totalTpHits = tpHits1 + tpHits2
    local totalExtraHits = extraHits1 + extraHits2

    return totalTpHits, totalExtraHits, totalCriticalHit, totalDamage
end

return weaponskillObject