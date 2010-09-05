/* Copyright (C) 2010 Marvin Cordes

/* ScriptData
SDName: Boss_Sulfuron_Harbringer
+SD%Complete: 100
+SDComment: 
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "molten_core.h"

enum
{
	NPC_FLAMEWAKER_PRIEST		=	11662,

	SPELL_DARK_STRIKE			=	19777,
	SPELL_DEMORALIZING_SHOUT	=	19778,
	SPELL_INSPIRE				=	19779,
	SPELL_HAND_OF_RAGNAROS		=	19780,
	SPELL_FLAME_SPEAR			=	19781
};

float PositionOfAdds2[4][4]=
{	
    {588.948, -1177.29, -195.424, 0.5759},		
    {608.382, -1178.97, -195.87, 2.21657},		
	{594.125, -1178.11, -195.706, 0.8901},				
	{613.861, -1178.12, -195.602, 2.5307},			
};

struct MANGOS_DLL_DECL boss_sulfuronAI : public ScriptedAI
{
    boss_sulfuronAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

		// Initialize Add-Array
		for(uint8 i = 0; i < 4; ++i) 
		{
			pAdds[i] = NULL;
		}

		addreset = NULL;

		Reset();
   }

	ScriptedInstance* m_pInstance;

	Creature* pAdds[4];
	char addreset;

    uint32 uiDemoralizingShout_Timer;
    uint32 uiInspire_Timer;
    uint32 uiKnockdown_Timer;
    uint32 uiFlamespear_Timer;


    void Reset()
    {
		if (m_pInstance->GetData(TYPE_SULFURON) != DONE)
		{
			m_pInstance->SetData(TYPE_SULFURON, NOT_STARTED);

			uiDemoralizingShout_Timer = 15000;
			uiInspire_Timer = 13000;
			uiKnockdown_Timer = 6000;
			uiFlamespear_Timer = 2000;

			// first spawn when creating the instance
			if (m_pInstance->GetData(DATA_SULFURON_ADDS_SPAWNED) != DONE)
				addreset = 7;

			if(addreset == 3)
			{
				if (uiKnockdown_Timer == 6000)
					addreset = 7;            // ready to reset adds
			}

			if (addreset == 7)
			{
				// kill adds before respawn - but not on first spawn when creating the instance
				if (m_pInstance->GetData(DATA_SULFURON_ADDS_SPAWNED) == DONE)
					{
					for(uint8 i = 0 ; i < 4; ++i)
					{
						if (pAdds[i] && pAdds[i]->isAlive())
						{
							pAdds[i]->setDeathState(JUST_DIED);
							pAdds[i]->RemoveCorpse();
						}
					}
				}
				// spawn the adds
				for(uint8 i = 0; i < 4 ; ++i)
				{
					pAdds[i] = m_creature->SummonCreature(NPC_FLAMEWAKER_PRIEST, PositionOfAdds2[i][0],PositionOfAdds2[i][1],PositionOfAdds2[i][2],PositionOfAdds2[i][3],TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,90000000);
					// make them invisible as majordomo - IMPLEMENT, THAT THEY DO NOT ATTACK WHILE INVISIBLE!
					pAdds[i]->SetVisibility(VISIBILITY_ON);
				}
				m_pInstance->SetData(DATA_SULFURON_ADDS_SPAWNED,DONE);
				addreset = 0;
			}
		}
    }

    void Aggro(Unit* pWho)
	{
		if(m_pInstance)
			m_pInstance->SetData(TYPE_SULFURON, IN_PROGRESS);
	}

	void JustDied(Unit* pKiller)							// instance_molten_core
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SULFURON, DONE);
    }

    void UpdateAI(const uint32 diff)
    {
		if(addreset == 0)  // first add spawn is done
		{
			if (uiKnockdown_Timer != 6000)
					addreset = 3;             // ready to check reset                
		}

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (uiDemoralizingShout_Timer < diff)
        {
			DoCastSpellIfCan(m_creature,SPELL_DEMORALIZING_SHOUT);
            uiDemoralizingShout_Timer = 15000 + rand()%5000;
        }
		else 
			uiDemoralizingShout_Timer -= diff;

        if (uiInspire_Timer < diff)
        {
            Creature* pTarget = NULL;
            std::list<Creature*> pList = DoFindFriendlyMissingBuff(45.0f,SPELL_INSPIRE);
            if (!pList.empty())
            {
                std::list<Creature*>::iterator i = pList.begin();
                advance(i, (rand()%pList.size()));
                pTarget = (*i);
            }

            if (pTarget)
				DoCastSpellIfCan(pTarget,SPELL_INSPIRE);

            DoCastSpellIfCan(m_creature,SPELL_INSPIRE);
            uiInspire_Timer = 20000 + rand()%6000;
        }
		else 
			uiInspire_Timer -= diff;


        //Knockdown_Timer
        if (uiKnockdown_Timer < diff)
        {
            DoCastSpellIfCan(m_creature,SPELL_HAND_OF_RAGNAROS);
            uiKnockdown_Timer = urand(12000, 15000);
        }
		else 
			uiKnockdown_Timer -= diff;

        if (uiFlamespear_Timer < diff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
				DoCastSpellIfCan(pTarget,SPELL_FLAME_SPEAR);
            uiFlamespear_Timer = 12000 + rand()%4000;
        }
		else 
			uiFlamespear_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};


enum
{	
	//Adds Spells
	SPELL_HEAL					=	19775,
	SPELL_SHADOW_WORD_PAIN		=	19776,
	SPELL_IMMOLATE				=	20294
};

struct MANGOS_DLL_DECL mob_flamewaker_priestAI : public ScriptedAI
{
    mob_flamewaker_priestAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

	ScriptedInstance* m_pInstance;

    uint32 uiHeal_Timer;
    uint32 uiShadowWordPain_Timer;
    uint32 uiImmolate_Timer;
	uint32 uiDarkstrike_Timer;

    void Reset()
    {
		uiHeal_Timer = 15000 + rand()%15000;     
        uiShadowWordPain_Timer = 2000;
        uiImmolate_Timer = 8000;
		uiDarkstrike_Timer=10000;       //These times are probably wrong
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //Casting Heal on Sulfuron or other Guards if target is in range
        if (uiHeal_Timer < diff)
        {
			Unit* pFriendlyUnit = DoSelectLowestHpFriendly(60.0f,1); 
			if (pFriendlyUnit && m_creature->IsWithinDistInMap(pFriendlyUnit,30.0f))
				DoCastSpellIfCan(pFriendlyUnit,SPELL_HEAL);
                       
            uiHeal_Timer = 15000 + rand()%5000;
        }
		else 
			uiHeal_Timer -= diff;

        if (uiShadowWordPain_Timer < diff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
				DoCastSpellIfCan(pTarget,SPELL_SHADOW_WORD_PAIN);
            uiShadowWordPain_Timer = 18000 + rand()%8000;
        }
		else
			uiShadowWordPain_Timer -= diff;

        if (uiImmolate_Timer < diff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
				DoCastSpellIfCan(pTarget,SPELL_IMMOLATE);
            uiImmolate_Timer = 15000 + rand()%10000;
        }
		else 
			uiImmolate_Timer -= diff;

        if (uiDarkstrike_Timer < diff)
        {
            DoCastSpellIfCan(m_creature, SPELL_DARK_STRIKE);
            uiDarkstrike_Timer = 15000 + rand()%3000;
        } 
		else
			uiDarkstrike_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_sulfuron(Creature* pCreature)
{
    return new boss_sulfuronAI(pCreature);
}

CreatureAI* GetAI_mob_flamewaker_priest(Creature* pCreature)
{
    return new mob_flamewaker_priestAI(pCreature);
}

void AddSC_boss_sulfuron()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_sulfuron";
    newscript->GetAI = &GetAI_boss_sulfuron;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_flamewaker_priest";
    newscript->GetAI = &GetAI_mob_flamewaker_priest;
    newscript->RegisterSelf();
}
