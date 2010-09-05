/* Copyright (C) 2010 Marvin Cordes

/* ScriptData
SDName: Boss_Magmadar
SD%Complete: 75
SDComment: Feuer am boden fehlt und fear einstellungen m¸ssen angepasst werden
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "molten_core.h"

enum
{
    EMOTE_GENERIC_FRENZY_KILL   = -1000001,

    SPELL_FRENZY                = 19451,
    SPELL_PANIC                 = 19408,
    SPELL_LAVABOMB              = 20474,                    //Lavabombe
	SPELL_MAGMASPITE			= 19450,					//Dot
    SPELL_LAVA_BREATH           = 19428                     //Groﬂbrand
};

struct MANGOS_DLL_DECL boss_magmadarAI : public ScriptedAI
{
    boss_magmadarAI(Creature* pCreature) : ScriptedAI(pCreature) 
	{
		m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
		Reset();
	}

	ScriptedInstance* m_pInstance;

    uint32 Frenzy_Timer;
    uint32 Panic_Timer;
    uint32 LavaBreath_Timer;
	uint32 MagmaSpit_Timer;

    void Reset()
    {
        Frenzy_Timer = 30000;
        Panic_Timer = 20000;
        LavaBreath_Timer = 12000;

		MagmaSpit_Timer = 15000; //These times are probally wrong
    }


	void JustDied(Unit* pKiller)							// instance_molten_core
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_MAGMADAR, DONE);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //Frenzy_Timer
        if (Frenzy_Timer < diff)
        {
            DoScriptText(EMOTE_GENERIC_FRENZY_KILL, m_creature);
            DoCastSpellIfCan(m_creature,SPELL_FRENZY);
            Frenzy_Timer = 15000;
        }else Frenzy_Timer -= diff;

        //Panic_Timer
        if (Panic_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(),SPELL_PANIC);
            Panic_Timer = 35000;
        }else Panic_Timer -= diff;

        //Groﬂbrand
        if (LavaBreath_Timer < diff)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCastSpellIfCan(target,SPELL_LAVA_BREATH);

            LavaBreath_Timer = 12000;
        }
		else 
			LavaBreath_Timer -= diff;

		//Magma Spit
		if (MagmaSpit_Timer < diff)
		{
            if (Unit* bTarget = SelectUnit(SELECT_TARGET_RANDOM,1))
			{
				DoCastSpellIfCan(bTarget,SPELL_LAVABOMB);					//Feuerball wird auf eine SPieler geschossen
				m_creature->CastSpell(bTarget,SPELL_MAGMASPITE,true);				//Spieler im Target bekommt Dot ab
			}

			MagmaSpit_Timer = 15000;
		}
		else 
			MagmaSpit_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_magmadar(Creature* pCreature)
{
    return new boss_magmadarAI(pCreature);
}

void AddSC_boss_magmadar()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_magmadar";
    newscript->GetAI = &GetAI_boss_magmadar;
    newscript->RegisterSelf();
}
