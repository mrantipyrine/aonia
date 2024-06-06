-----------------------------------
--   Spell: Poison
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)

    if equippedBody == 12485 then
        return xi.spells.damage.useDamageSpell(caster, target, thunder)
    end 

    return xi.spells.enfeebling.useEnfeeblingSpell(caster, target, spell)
end

return spellObject
