/* Copyright (C) 2010 Marvin Cordes

/* ScriptData
SDName: Boss_Gehennas
SD%Complete: 100
SDComment: 
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "molten_core.h"

#define SPELL_SHADOWBOLT            19728
#define SPELL_RAINOFFIRE            19717
#define SPELL_GEHENNASCURSE         19716
#define NPC_FEUERSCHUPPE            11661

struct MANGOS_DLL_DECL boss_gehennasAI : public ScriptedAI
{
    boss_gehennasAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

		// Initialize Add-Array
		for(uint8 i = 0; i < 2; ++i) 
		{
			pAdds[i] = NULL;
		}

		addreset = NULL;

        Reset();
	}

	ScriptedInstance* m_pInstance;

	Creature* pAdds[2]; //Two adds
	char addreset;

    uint32 ShadowBolt_Timer;
    uint32 RainOfFire_Timer;
    uint32 GehennasCurse_Timer;

    void Reset()
    {
		if (m_pInstance->GetData(TYPE_GEHENNAS) != DONE)
		{
			m_pInstance->SetData(TYPE_GEHENNAS, NOT_STARTED);

			ShadowBolt_Timer = 6000;
			RainOfFire_Timer = 10000;
			GehennasCurse_Timer = 12000;

			// first spawn when creating the instance
			if (m_pInstance->GetData(DATA_GEHENNAS_ADDS_SPAWNED) != DONE)
				addreset = 7;

			if(addreset == 3)
			{
				if (ShadowBolt_Timer == 6000)
					addreset = 7;            // ready to reset adds
			}

			if (addreset == 7)
			{
				// kill adds before respawn - but not on first spawn when creating the instance
				if (m_pInstance->GetData(DATA_GEHENNAS_ADDS_SPAWNED) == DONE)
				{
					for(uint8 i = 0 ; i < 2; ++i)
					{
						if (pAdds[i] && pAdds[i]->isAlive())
						{
							pAdds[i]->setDeathState(JUST_DIED);
							pAdds[i]->RemoveCorpse();
						}
					}
				}
				// spawn the adds
				for(uint8 i = 0; i < 2 ; ++i)
				{
					if(i == 1)
						pAdds[i] = m_creature->SummonCreature(NPC_FEUERSCHUPPE, 905.754, -542.43, -202.798, 3.979,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,90000000);
					else
						pAdds[i] = m_creature->SummonCreature(NPC_FEUERSCHUPPE, 890.95, -539.14, -203.05, 5.445,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,90000000);
					pAdds[i]->SetVisibility(VISIBILITY_ON);
				}
				m_pInstance->SetData(DATA_GEHENNAS_ADDS_SPAWNED,DONE);
				addreset = 0;
			}
		}
    }

	void JustDied(Unit* pKiller)							// instance_molten_core
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GEHENNAS, DONE);
    }


    void UpdateAI(const uint32 diff)
    {
		if(addreset == 0)  // first add spawn is done
		{
			if (ShadowBolt_Timer != 6000)
					addreset = 3;             // ready to check reset                  
		}

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //ShadowBolt_Timer
        if (ShadowBolt_Timer < diff)
        {
            if (Unit* bTarget = SelectUnit(SELECT_TARGET_RANDOM,1))
                DoCastSpellIfCan(bTarget,SPELL_SHADOWBOLT);
            ShadowBolt_Timer = 7000;
        }else ShadowBolt_Timer -= diff;

        //RainOfFire_Timer
        if (RainOfFire_Timer < diff)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCastSpellIfCan(target,SPELL_RAINOFFIRE);

            RainOfFire_Timer = urand(4000, 12000);
        }else RainOfFire_Timer -= diff;

        //GehennasCurse_Timer
        if (GehennasCurse_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(),SPELL_GEHENNASCURSE);
            GehennasCurse_Timer = urand(22000, 30000);
        }else GehennasCurse_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_boss_gehennas(Creature* pCreature)
{
    return new boss_gehennasAI(pCreature);
}

void AddSC_boss_gehennas()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_gehennas";
    newscript->GetAI = &GetAI_boss_gehennas;
    newscript->RegisterSelf();
}
