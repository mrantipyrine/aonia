-----------------------------------
--   Spell: Poison
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)

    if equippedBody == 12485 then
        xi.spells.enfeebling.useEnfeeblingSpell(caster, target, virus)
    end 

    return xi.spells.enfeebling.useEnfeeblingSpell(caster, target, spell)
end

return spellObject
