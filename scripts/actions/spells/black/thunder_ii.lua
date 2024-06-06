-----------------------------------
-- Spell: Thunder II
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local mainJob = caster:getMainJob()
    local subJob = caster:getSubJob()
    local hasShockSpikes = caster:hasStatusEffect(xi.effect.SHOCK_SPIKES)
    local randomValue = math.random()

    if hasShockSpikes then
        if mainJob == xi.job.BLM then
            if randomValue <= 0.30 then
                xi.spells.damage.useDamageSpell(caster, target, spell)
                xi.spells.damage.useDamageSpell(caster, target, spell)
            end
        elseif randomValue <= 0.10 then
            xi.spells.damage.useDamageSpell(caster, target, spell)
        end
    end

    return xi.spells.damage.useDamageSpell(caster, target, spell)
end

return spellObject
