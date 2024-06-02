-----------------------------------
-- Spell: Stone
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

    local effect
    local power

    if mainJob == xi.job.RDM then
        effect = xi.effect.ENSTONE
        power = math.random(1, mainLvl)
    elseif subJob == xi.job.RDM then
        effect = xi.effect.ENSTONE
        power = math.random(1, mainLvl / 4)
    elseif mainJob == xi.job.BLM then
        effect = xi.effect.STONESKIN
        power = math.random(1, mainLvl)
    elseif subJob == xi.job.BLM then
        effect = xi.effect.STONESKIN
        power = math.random(1, mainLvl / 4)
    else
        return
    end

    player:addStatusEffect(effect, power, 3, duration)

    local result = xi.spells.damage.useDamageSpell(caster, target, spell)
    
    if mainJob == xi.job.BLM and math.random() <= 0.99 then
        xi.spells.damage.useDamageSpell(caster, target, spell)
    end
end

return spellObject