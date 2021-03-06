﻿class skyui.defines.Actor
{
    function Actor()
    {
    } // End of the function
    static var AV_NONE = 4294967295.000000;
    static var AV_AGGRESSION = 0;
    static var AV_CONFIDENCE = 1;
    static var AV_ENERGY = 2;
    static var AV_MORALITY = 3;
    static var AV_MOOD = 4;
    static var AV_ASSISTANCE = 5;
    static var AV_ONEHANDED = 6;
    static var AV_TWOHANDED = 7;
    static var AV_MARKSMAN = 8;
    static var AV_BLOCK = 9;
    static var AV_SMITHING = 10;
    static var AV_HEAVYARMOR = 11;
    static var AV_LIGHTARMOR = 12;
    static var AV_PICKPOCKET = 13;
    static var AV_LOCKPICKING = 14;
    static var AV_SNEAK = 15;
    static var AV_ALCHEMY = 16;
    static var AV_SPEECHCRAFT = 17;
    static var AV_ALTERATION = 18;
    static var AV_CONJURATION = 19;
    static var AV_DESTRUCTION = 20;
    static var AV_ILLUSION = 21;
    static var AV_RESTORATION = 22;
    static var AV_ENCHANTING = 23;
    static var AV_HEALTH = 24;
    static var AV_MAGICKA = 25;
    static var AV_STAMINA = 26;
    static var AV_HEALRATE = 27;
    static var AV_MAGICKARATE = 28;
    static var AV_STAMINARATE = 29;
    static var AV_SPEEDMULT = 30;
    static var AV_INVENTORYWEIGHT = 31;
    static var AV_CARRYWEIGHT = 32;
    static var AV_CRITCHANCE = 33;
    static var AV_MELEEDAMAGE = 34;
    static var AV_UNARMEDDAMAGE = 35;
    static var AV_MASS = 36;
    static var AV_VOICEPOINTS = 37;
    static var AV_VOICERATE = 38;
    static var AV_DAMAGERESIST = 39;
    static var AV_POISONRESIST = 40;
    static var AV_FIRERESIST = 41;
    static var AV_ELECTRICRESIST = 42;
    static var AV_FROSTRESIST = 43;
    static var AV_MAGICRESIST = 44;
    static var AV_DISEASERESIST = 45;
    static var AV_PERCEPTIONCONDITION = 46;
    static var AV_ENDURANCECONDITION = 47;
    static var AV_LEFTATTACKCONDITION = 48;
    static var AV_RIGHTATTACKCONDITION = 49;
    static var AV_LEFTMOBILITYCONDITION = 50;
    static var AV_RIGHTMOBILITYCONDITION = 51;
    static var AV_BRAINCONDITION = 52;
    static var AV_PARALYSIS = 53;
    static var AV_INVISIBILITY = 54;
    static var AV_NIGHTEYE = 55;
    static var AV_DETECTLIFERANGE = 56;
    static var AV_WATERBREATHING = 57;
    static var AV_WATERWALKING = 58;
    static var AV_IGNORECRIPPLEDLIMBS = 59;
    static var AV_FAME = 60;
    static var AV_INFAMY = 61;
    static var AV_JUMPINGBONUS = 62;
    static var AV_WARDPOWER = 63;
    static var AV_RIGHTITEMCHARGE = 64;
    static var AV_ARMORPERKS = 65;
    static var AV_SHIELDPERKS = 66;
    static var AV_WARDDEFLECTION = 67;
    static var AV_VARIABLE01 = 68;
    static var AV_VARIABLE02 = 69;
    static var AV_VARIABLE03 = 70;
    static var AV_VARIABLE04 = 71;
    static var AV_VARIABLE05 = 72;
    static var AV_VARIABLE06 = 73;
    static var AV_VARIABLE07 = 74;
    static var AV_VARIABLE08 = 75;
    static var AV_VARIABLE09 = 76;
    static var AV_VARIABLE10 = 77;
    static var AV_BOWSPEEDBONUS = 78;
    static var AV_FAVORACTIVE = 79;
    static var AV_FAVORSPERDAY = 80;
    static var AV_FAVORSPERDAYTIMER = 81;
    static var AV_LEFTITEMCHARGE = 82;
    static var AV_ABSORBCHANCE = 83;
    static var AV_BLINDNESS = 84;
    static var AV_WEAPONSPEEDMULT = 85;
    static var AV_SHOUTRECOVERYMULT = 86;
    static var AV_BOWSTAGGERBONUS = 87;
    static var AV_TELEKINESIS = 88;
    static var AV_FAVORPOINTSBONUS = 89;
    static var AV_LASTBRIBEDINTIMIDATED = 90;
    static var AV_LASTFLATTERED = 91;
    static var AV_MOVEMENTNOISEMULT = 92;
    static var AV_BYPASSVENDORSTOLENCHECK = 93;
    static var AV_BYPASSVENDORKEYWORDCHECK = 94;
    static var AV_WAITINGFORPLAYER = 95;
    static var AV_ONEHANDEDMOD = 96;
    static var AV_TWOHANDEDMOD = 97;
    static var AV_MARKSMANMOD = 98;
    static var AV_BLOCKMOD = 99;
    static var AV_SMITHINGMOD = 100;
    static var AV_HEAVYARMORMOD = 101;
    static var AV_LIGHTARMORMOD = 102;
    static var AV_PICKPOCKETMOD = 103;
    static var AV_LOCKPICKINGMOD = 104;
    static var AV_SNEAKMOD = 105;
    static var AV_ALCHEMYMOD = 106;
    static var AV_SPEECHCRAFTMOD = 107;
    static var AV_ALTERATIONMOD = 108;
    static var AV_CONJURATIONMOD = 109;
    static var AV_DESTRUCTIONMOD = 110;
    static var AV_ILLUSIONMOD = 111;
    static var AV_RESTORATIONMOD = 112;
    static var AV_ENCHANTINGMOD = 113;
    static var AV_ONEHANDEDSKILLADVANCE = 114;
    static var AV_TWOHANDEDSKILLADVANCE = 115;
    static var AV_MARKSMANSKILLADVANCE = 116;
    static var AV_BLOCKSKILLADVANCE = 117;
    static var AV_SMITHINGSKILLADVANCE = 118;
    static var AV_HEAVYARMORSKILLADVANCE = 119;
    static var AV_LIGHTARMORSKILLADVANCE = 120;
    static var AV_PICKPOCKETSKILLADVANCE = 121;
    static var AV_LOCKPICKINGSKILLADVANCE = 122;
    static var AV_SNEAKSKILLADVANCE = 123;
    static var AV_ALCHEMYSKILLADVANCE = 124;
    static var AV_SPEECHCRAFTSKILLADVANCE = 125;
    static var AV_ALTERATIONSKILLADVANCE = 126;
    static var AV_CONJURATIONSKILLADVANCE = 127;
    static var AV_DESTRUCTIONSKILLADVANCE = 128;
    static var AV_ILLUSIONSKILLADVANCE = 129;
    static var AV_RESTORATIONSKILLADVANCE = 130;
    static var AV_ENCHANTINGSKILLADVANCE = 131;
    static var AV_LEFTWEAPONSPEEDMULT = 132;
    static var AV_DRAGONSOULS = 133;
    static var AV_COMBATHEALTHREGENMULT = 134;
    static var AV_TWOHANDEDPOWERMOD = 136;
    static var AV_MARKSMANPOWERMOD = 137;
    static var AV_BLOCKPOWERMOD = 138;
    static var AV_SMITHINGPOWERMOD = 139;
    static var AV_HEAVYARMORPOWERMOD = 140;
    static var AV_LIGHTARMORPOWERMOD = 141;
    static var AV_PICKPOCKETPOWERMOD = 142;
    static var AV_LOCKPICKINGPOWERMOD = 143;
    static var AV_SNEAKPOWERMOD = 144;
    static var AV_ALCHEMYPOWERMOD = 145;
    static var AV_SPEECHCRAFTPOWERMOD = 146;
    static var AV_ALTERATIONPOWERMOD = 147;
    static var AV_CONJURATIONPOWERMOD = 148;
    static var AV_DESTRUCTIONPOWERMOD = 149;
    static var AV_ILLUSIONPOWERMOD = 150;
    static var AV_RESTORATIONPOWERMOD = 151;
    static var AV_ENCHANTINGPOWERMOD = 152;
    static var AV_DRAGONREND = 153;
    static var AV_ATTACKDAMAGEMULT = 154;
    static var AV_HEALRATEMULT = 155;
    static var AV_MAGICKARATEMULT = 156;
    static var AV_STAMINARATEMULT = 157;
    static var AV_WEREWOLFPERKS = 158;
    static var AV_VAMPIREPERKS = 159;
    static var AV_GRABACTOROFFSET = 160;
    static var AV_GRABBED = 161;
    static var AV_DEPRECATED05 = 162;
    static var AV_REFLECTDAMAGE = 163;
} // End of Class
