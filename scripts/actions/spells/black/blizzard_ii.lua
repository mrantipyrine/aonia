-----------------------------------
-- Spell: Thunder II
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    --local mainJob = player:getMainJob()
    --local subJob = player:getSubJob()
    --local hasBuff = player:hasStatusEffect(xi.effect.ICE_SPIKES)
    --local randomValue = math.random()

    local params = {}
    params.main = player:getMainJob()
    params.sub = player:getSubJob()
    params.buffStatus = caster:hasStatusEffect(xi.effect.ICE_SPIKES)
    params.random = math.random()

    -- 30% increased chance to triple cast if player has Shock Spikes. 
    -- This makes rotations fun
    -- Extend this with items 
    if params.buffStatus then
        -- maybe if X item is equipped then X chance to quad cast 
        -- maybe if elemental resistance is > X then quad cast chance
        if params.main == xi.job.BLM then
            if params.random <= 0.30 then
                xi.spells.damage.useDamageSpell(caster, target, spell)
            end
        elseif params.random <= 0.10 then
            xi.spells.damage.useDamageSpell(caster, target, spell)
            xi.spells.damage.useDamageSpell(caster, target, spell)
        end
    end

    return xi.spells.damage.useDamageSpell(caster, target, spell)
end

return spellObject
