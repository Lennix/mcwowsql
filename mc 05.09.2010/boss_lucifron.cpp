/* Copyright (C) 2010 Marvin Cordes

/* ScriptData
SDName: Boss_Lucifron
SD%Complete: 100
SDComment:
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "molten_core.h"

#define SPELL_IMPENDINGDOOM 19702
#define SPELL_LUCIFRONCURSE 19703
#define SPELL_SHADOWSHOCK   20603

#define NPC_FEUERSCHUPPENBESCHUETZER 12119

struct MANGOS_DLL_DECL boss_lucifronAI : public ScriptedAI
{
    boss_lucifronAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

		//Initialize Add-Array
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

    uint32 ImpendingDoom_Timer;
    uint32 LucifronCurse_Timer;
    uint32 ShadowShock_Timer;

    void Reset()
    {
		if (m_pInstance->GetData(TYPE_LUCIFRON) != DONE)
		{
			m_pInstance->SetData(TYPE_LUCIFRON, NOT_STARTED);

			ImpendingDoom_Timer = 10000;                        //Initial cast after 10 seconds so the debuffs alternate
			LucifronCurse_Timer = 20000;                        //Initial cast after 20 seconds
			ShadowShock_Timer = 6000;                           //6 seconds

			// first spawn when creating the instance
			if (m_pInstance->GetData(DATA_LUCIFRON_ADDS_SPAWNED) != DONE)
				addreset = 7;

			if(addreset == 3)
			{
				if (ImpendingDoom_Timer == 10000)
					addreset = 7;            // ready to reset adds
			}

			if (addreset == 7)
			{
				// kill adds before respawn - but not on first spawn when creating the instance
				if (m_pInstance->GetData(DATA_LUCIFRON_ADDS_SPAWNED) == DONE)
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
					{
						pAdds[i] = m_creature->SummonCreature(NPC_FEUERSCHUPPENBESCHUETZER, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ()+20, 0.0f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,90000000);
						pAdds[i]->SetCreatorGUID(56606);
					}
					else
					{
						pAdds[i] = m_creature->SummonCreature(NPC_FEUERSCHUPPENBESCHUETZER, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ()+20, 0.0f,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,90000000);
						pAdds[i]->SetCreatorGUID(56607);
					}
					pAdds[i]->SetVisibility(VISIBILITY_ON);
				}
				m_pInstance->SetData(DATA_LUCIFRON_ADDS_SPAWNED,DONE);
				addreset = 0;
			}

			if (pAdds[0] && pAdds[0]->isAlive())
				pAdds[0]->GetMotionMaster()->MoveFollow(m_creature, 0, 0);
			if (pAdds[1] && pAdds[1]->isAlive())
				pAdds[1]->GetMotionMaster()->MoveFollow(m_creature, 0, 0);
		}
    }

		
	void JustDied(Unit* pKiller)							// instance_molten_core
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_LUCIFRON, DONE);
    }

    void UpdateAI(const uint32 diff)
    {
		if(addreset == 0)  // first add spawn is done
		{
			if (ImpendingDoom_Timer == 10000)
					addreset = 3;             // ready to check reset                  
		}

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //Impending doom timer
        if (ImpendingDoom_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(),SPELL_IMPENDINGDOOM);
            ImpendingDoom_Timer = 20000;
        }else ImpendingDoom_Timer -= diff;

        //Lucifron's curse timer
        if (LucifronCurse_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(),SPELL_LUCIFRONCURSE);
            LucifronCurse_Timer = 15000;
        }else LucifronCurse_Timer -= diff;

        //Shadowshock
        if (ShadowShock_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(),SPELL_SHADOWSHOCK);
            ShadowShock_Timer = 6000;
        }else ShadowShock_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_boss_lucifron(Creature* pCreature)
{
    return new boss_lucifronAI(pCreature);
}

void AddSC_boss_lucifron()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_lucifron";
    newscript->GetAI = &GetAI_boss_lucifron;
    newscript->RegisterSelf();
}
