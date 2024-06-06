-----------------------------------
-- Spell: Water
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)

    local duration = 180
    local player = caster -- Assuming 'caster' is the player object

    local mainJob = player:getMainJob()
    local subJob = player:getSubJob()
    local mainLvl = player:getMainLvl()

    local effect, power

    if mainJob == xi.job.RDM or subJob == xi.job.RDM then
        effect = xi.effect.ENBLIZZARD
        power = math.random(1, mainJob == xi.job.RDM and mainLvl * 5 or mainLvl / 4)
    elseif mainJob == xi.job.BLM or mainJob == xi.job.WHM or subJob == xi.job.BLM or subJob == xi.job.WHM then
        effect = xi.effect.ICESPIKES
        power = math.random(1, mainJob == xi.job.BLM or mainJob == xi.job.WHM and mainLvl * 50 or mainLvl / 4)
    else
        return nil
    end
    
    player:addStatusEffect(effect, power, 3, duration)

    if mainJob == xi.job.BLM and math.random() <= 0.30 then
       xi.spells.damage.useDamageSpell(caster, target, spell)
       xi.spells.damage.useDamageSpell(caster, target, spell)
    end 

    return xi.spells.damage.useDamageSpell(caster, target, spell)
end

return spellObject
