-----------------------------------
-- Spell: Blizzard II
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local main = player:getMainJob()
    local sub = player:getSubJob()
    local buffStatus = player:hasStatusEffect(xi.effect.ICE_SPIKES)
    local random = math.random()

    if buffStatus and main == xi.job.BLM then
        if random <= 0.30 then
            xi.spells.damage.useDamageSpell(caster, target, spell)  
        end 
    end 

    return xi.spells.damage.useDamageSpell(caster, target, spell)
end

return spellObject

