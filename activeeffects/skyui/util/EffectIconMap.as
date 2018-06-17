class skyui.util.EffectIconMap
{
    function EffectIconMap()
    {
    } // End of the function
    static function lookupIconLabel(a_effectData)
    {
        var _loc2 = a_effectData.archetype;
        var _loc3 = a_effectData.actorValue;
        var _loc7 = "none";
        var _loc6 = skyui.util.EffectIconMap._archetypeMap[_loc2];
        if (_loc6)
        {
            return ({baseLabel: _loc6, emblemLabel: _loc7});
        } // end if
        switch (_loc2)
        {
            case skyui.defines.Magic.ARCHETYPE_VALUEMOD:
            case skyui.defines.Magic.ARCHETYPE_DUALVALUEMOD:
            case skyui.defines.Magic.ARCHETYPE_PEAKVALUEMOD:
            {
                var _loc5 = a_effectData.effectFlags & skyui.defines.Magic.MGEFFLAG_DETRIMENTAL;
                var _loc4 = a_effectData.effectFlags & skyui.defines.Magic.MGEFFLAG_RECOVER;
                if (_loc5)
                {
                    _loc7 = _loc4 ? ("drain") : ("damage");
                    break;
                } // end if
                _loc7 = _loc4 ? ("fortify") : ("restore");
            } 
        } // End of switch
        _loc6 = skyui.util.EffectIconMap._avMap[_loc3];
        if (_loc3 == skyui.defines.Actor.AV_HEALTH)
        {
            var _loc8 = a_effectData.resistType;
            switch (a_effectData.resistType)
            {
                case skyui.defines.Actor.AV_FIRERESIST:
                {
                    _loc6 = "magic_fire";
                    break;
                } 
                case skyui.defines.Actor.AV_FROSTRESIST:
                {
                    _loc6 = "magic_frost";
                    break;
                } 
                case skyui.defines.Actor.AV_ELECTRICRESIST:
                {
                    _loc6 = "magic_shock";
                    break;
                } 
            } // End of switch
        } // end if
        if (!_loc6)
        {
            _loc6 = "default_effect";
        } // end if
        return ({baseLabel: _loc6, emblemLabel: _loc7});
    } // End of the function
    static var _archetypeMap = [null, null, null, null, null, null, null, null, null, null, "conjure", "invisibility", "light", null, null, null, null, "bound_item", "conjure", null, null, "paralysis", null, null, null, "clairvoyance", null, null, null, null, null, null, null, null, null, "cloak", "werewolf", "slow_time", null, "ench_weapon", null, "ethereal", null, null, null, null, "vampire"];
    static var _avMap = [null, null, null, null, null, null, "av_skill_weapon_1h", "av_skill_weapon_2h", "av_skill_archery", "av_skill_block", "av_skill_smithing", "av_skill_armor_heavy", "av_skill_armor_light", "av_skill_pickpocket", "av_skill_lockpicking", "av_skill_sneak", "av_skill_alchemy", "av_skill_persuasion", "av_skill_alteration", "av_skill_conjuration", "av_skill_destruction", "av_skill_illusion", "av_skill_restoration", "av_skill_enchanting", "av_health", "av_magicka", "av_stamina", "av_health_regen", "av_magicka_regen", "av_stamina_regen", "av_speedmult", null, "av_carryweight", null, "av_skill_unarmed", "av_skill_unarmed", null, null, null, "av_resist_damage", "av_resist_poison", "av_resist_fire", "av_resist_shock", "av_resist_frost", "av_resist_magic", "av_resist_disease", null, null, null, null, null, null, null, "paralysis", "invisibility", "av_nighteye", null, "av_waterbreathing", "av_waterwalking", null, null, null, null, "av_ward", null, "av_armorperks", null, null, null, null, null, null, null, null, null, null, null, null, "av_bow_speed", null, null, null, null, "av_absorb", null, "av_weapon_speed", "av_skill_shout", "av_bow_stagger", null, null, null, null, "av_noise", null, null, null, "av_skill_weapon_1h", "av_skill_weapon_2h", "av_skill_archery", "av_skill_block", "av_skill_smithing", "av_skill_armor_heavy", "av_skill_armor_light", "av_skill_pickpocket", "av_skill_lockpicking", "av_skill_sneak", "av_skill_alchemy", "av_skill_persuasion", "av_skill_alteration", "av_skill_conjuration", "av_skill_destruction", "av_skill_illusion", "av_skill_restoration", "av_skill_enchanting", "av_skill_weapon_1h", "av_skill_weapon_2h", "av_skill_archery", "av_skill_block", "av_skill_smithing", "av_skill_armor_heavy", "av_skill_armor_light", "av_skill_pickpocket", "av_skill_lockpicking", "av_skill_sneak", "av_skill_alchemy", "av_skill_persuasion", "av_skill_alteration", "av_skill_conjuration", "av_skill_destruction", "av_skill_illusion", "av_skill_restoration", "av_skill_enchanting", null, null, null, "av_skill_weapon_1h", "av_skill_weapon_2h", "av_skill_archery", "av_skill_block", "av_skill_smithing", "av_skill_armor_heavy", "av_skill_armor_light", "av_skill_pickpocket", "av_skill_lockpicking", "av_skill_sneak", "av_skill_alchemy", "av_skill_persuasion", "av_skill_alteration", "av_skill_conjuration", "av_skill_destruction", "av_skill_illusion", "av_skill_restoration", "av_skill_enchanting", null, null, "av_health_regen", "av_magicka_regen", "av_stamina_regen", null, null, null, null, null, null];
} // End of Class
