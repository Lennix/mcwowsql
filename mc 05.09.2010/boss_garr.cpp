/* Copyright (C) 2010 Marvin Cordes

/* ScriptData
SDName: Boss_Garr
+SD%Complete: 98
+SDComment:  immolate geht nicht
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "molten_core.h"

enum
{
    NPC_FIRESWORN               =   12099,

	//his own spells
	SPELL_ANTI_MAGIC_PULS		=	19492,
	SPELL_MAGMA_SHACKLES		=	19496,
	SPELL_FRENZY				=	19516, //Stacking enrage (stacks to 10 times)

	//spells of his adds
	SPELL_ERUPTION				=	19497,
	SPELL_IMMOLATE				=	20294,
    SPELL_MASSIVE_ERUPTION      =   20483,
	SPELL_SEPERATION_ANXIETY	=	23492, // if distance between adds and gaar is over 50 yards

	SPELL_BANISH1				=	710,
	SPELL_BANISH2				=	18647
};




float PositionOfAdds[8][4]=
{	
    {695.167, -503.595, -214.493, 5.7814},		
    {699.049, -498.853, -214.335, 5.7059},		
	{685.026, -504.096, -214.37, 6.02004},				
	{683.891, -496.467, -213.892, 6.0200},		
    {688.558, -490.401, -213.735, 6.0200},		
    {693.239, -489.648, -213.659, 5.6466},		
	{697.286, -491.508, -213.895, 5.7820},		
	{689.588, -506.433, -214.498, 6.1073},		
};

struct MANGOS_DLL_DECL boss_garrAI : public ScriptedAI
{
    boss_garrAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

		// Initialize Add-Array
		for(uint8 i = 0; i < 8; ++i) 
		{
			pAdds[i] = NULL;
		}

		addreset = NULL;

		Reset();
	}

	ScriptedInstance* m_pInstance;

	Creature* pAdds[8];
	char addreset;

    uint32 uiAntiMagicPulse_Timer;
    uint32 uiMagmaShackles_Timer;
	uint32 uiSupremeModus_Timer;
	uint32 uiSMadd_Timer;
	uint32 uiAddExplode_Timer;
	uint32 uiBanish_Timer;

	uint8 FrenzyCounter;
	uint8 AddKillCounter;
	uint8 RandomAdd;

	bool GarrUnder50;

    void Reset()
    {
		if (m_pInstance->GetData(TYPE_GARR) != DONE)
		{
			m_pInstance->SetData(TYPE_GARR, NOT_STARTED);

			m_creature->RemoveAllAuras();

			uiAntiMagicPulse_Timer = 10000;      //These times are probably wrong
			uiMagmaShackles_Timer = 15000;
			uiSupremeModus_Timer = 4000;
			uiSMadd_Timer = 180000;
			uiAddExplode_Timer = 15000;
			uiBanish_Timer = 10000;

			FrenzyCounter = 0;
			AddKillCounter = 0;

			GarrUnder50 = false;

			// first spawn when creating the instance
			if (m_pInstance->GetData(DATA_GARR_ADDS_SPAWNED) != DONE)
				addreset = 7;

			if(addreset == 3)
			{
				if (uiAntiMagicPulse_Timer == 10000)
					addreset = 7;            // ready to reset adds
			}

			if (addreset == 7)
			{
				// kill adds before respawn - but not on first spawn when creating the instance
				if (m_pInstance->GetData(DATA_GARR_ADDS_SPAWNED) == DONE)
				{
					for(uint8 i = 0 ; i < 8; ++i)
					{
						if (pAdds[i] && pAdds[i]->isAlive())
						{
							pAdds[i]->setDeathState(JUST_DIED);
							pAdds[i]->RemoveCorpse();
						}
					}
				}
				// spawn the adds
				for(uint8 i = 0; i < 8 ; ++i)
				{
					pAdds[i] = m_creature->SummonCreature(NPC_FIRESWORN, PositionOfAdds[i][0],PositionOfAdds[i][1],PositionOfAdds[i][2],PositionOfAdds[i][3],TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,90000000);
					pAdds[i]->SetVisibility(VISIBILITY_ON);
				}
				m_pInstance->SetData(DATA_GARR_ADDS_SPAWNED,DONE);
				addreset = 0;
			}
		}
    }

    void Aggro(Unit* pWho)
    {
		m_creature->CallForHelp(20.0f);

		if (m_pInstance)
			m_pInstance->SetData(TYPE_GARR, IN_PROGRESS);
    }

	void JustDied(Unit* pKiller)							// instance_molten_core
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GARR, DONE);
    }

	bool AddsAreDead()
	{
		for(uint8 i = 0; i < 8 ; ++i)
		{
			if (pAdds[i] && pAdds[i]->isAlive())
				return false;
		}
		return true;
	}

	void frenzy()
	{
		for(uint8 i = 0 ; i < 8; ++i)
		{
			if (pAdds[i] && pAdds[i]->isDead())
			{
				++AddKillCounter;
			}
		}

		if(AddKillCounter > FrenzyCounter)
		{
			DoCastSpellIfCan(m_creature,SPELL_FRENZY);
			++FrenzyCounter;
			AddKillCounter = 0;
		}
		else
			AddKillCounter = 0;
	}


    void UpdateAI(const uint32 diff)
    {
		frenzy();
		if(addreset == 0)  // first add spawn is done
		{
			if (uiAntiMagicPulse_Timer != 10000)
					addreset = 3;             // ready to check reset                 
		}

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //AntiMagicPulse_Timer
        if (uiAntiMagicPulse_Timer < diff)
        {
            DoCastSpellIfCan(m_creature,SPELL_ANTI_MAGIC_PULS);
            //14-18 seconds until we should cast this agian
            uiAntiMagicPulse_Timer = 10000;
        }
		else 
			uiAntiMagicPulse_Timer -= diff;

        //MagmaShackles_Timer
        if (uiMagmaShackles_Timer < diff)
        {
            DoCastSpellIfCan(m_creature,SPELL_MAGMA_SHACKLES);

			uiMagmaShackles_Timer = 8000 + rand()%4000;
        }
		else 
			uiMagmaShackles_Timer -= diff;

		//SupremeModus - wenn alle Adds tot sind
		if(AddsAreDead())
		{
			if (uiSupremeModus_Timer < diff)
			{
				DoCastSpellIfCan(m_creature,SPELL_SEPERATION_ANXIETY);
				uiSupremeModus_Timer = 4000;
			}
			else 
				uiSupremeModus_Timer -= diff;

			if (uiSMadd_Timer < diff)
			{
				m_creature->SummonCreature(11665,0.0f,0.0f,0.0f,0.0f,TEMPSUMMON_TIMED_DESPAWN,300000); 
				uiSMadd_Timer = 180000;
			}
			else 
				uiSMadd_Timer -= diff;				
		}

		//Befiehlt einem Firesworn zu explodieren, wenn dieser sich zu nahe an Garr befindet - hier 20 yards - check alle 15 sekunden
		if (uiAddExplode_Timer < diff)
		{
			RandomAdd = rand()%8;
			if (pAdds[RandomAdd] && pAdds[RandomAdd]->isAlive())
				if (m_creature->IsWithinDistInMap(pAdds[RandomAdd], 20.0f))
				{
					pAdds[RandomAdd]->CastSpell(pAdds[RandomAdd],SPELL_MASSIVE_ERUPTION,true);
				}

			uiAddExplode_Timer = 15000;
		}
		else 
			uiAddExplode_Timer -= diff;

        //If garr's hp below 50% , release all adds, wird nur 1 mal released
		if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() <= 50 && GarrUnder50 == false)
		{
			for(uint8 i = 0 ; i < 8; ++i)
			{
				GarrUnder50 = true;
				if (pAdds[i] && pAdds[i]->isAlive())
				{
					pAdds[i]->RemoveAllAuras();
				}
			}
		}

		//Garr opfert ein Add nach dem anderen wenn sie nicht schnell genug gebanished werden
		if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() <= 50)
		{
			if (uiBanish_Timer < diff)
			{
				for(uint8 i = 0 ; i < 8; ++i)
				{
					if (pAdds[i] && pAdds[i]->isAlive())
						if (!pAdds[i]->HasAura(SPELL_BANISH1) && !pAdds[i]->HasAura(SPELL_BANISH2))
							pAdds[i]->CastSpell(pAdds[i],SPELL_MASSIVE_ERUPTION,true);
				}
				uiBanish_Timer = 10000;
			}
			else
				uiBanish_Timer -= diff;
		}

        DoMeleeAttackIfReady();
    }
};

// FIRESWORN ADDS (8)

struct MANGOS_DLL_DECL mob_fireswornAI : public ScriptedAI
{
	mob_fireswornAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
		Reset();
	}

	ScriptedInstance* m_pInstance;
 
    uint32 uiImmolate_Timer;

	Creature* pGarr;

	bool explode;


    void Reset()
    {
        uiImmolate_Timer = 4000;      //These times are probably wrong
		explode = false;
    }

    void DamageTaken(Unit *pDoneBy,uint32 &uiDamage)
     {
		 if (uiDamage >= m_creature->GetHealth() && explode == false)
        {
            uiDamage = 0;
			explode = true;
			m_creature->CastSpell(m_creature,SPELL_ERUPTION,true);
			m_creature->setDeathState(JUST_DIED);
			m_creature->SetHealth(0);
        }
    }

	void Aggro(Unit* pWho)
    {
		m_creature->CallForHelp(20.0f);
	}

    void UpdateAI(const uint32 diff)
    {
		std::list<Creature*> gGarr;											//Liste für Trennungsangst notwendig
        GetCreatureListWithEntryInGrid(gGarr,m_creature,NPC_GARR,20.0f);
        if (!gGarr.empty())
        {
            std::list<Creature*>::iterator i = gGarr.begin();
            pGarr = (*i);			
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //Immolate_Timer
        if (uiImmolate_Timer < diff)
        {
			if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
				DoCastSpellIfCan(pTarget,SPELL_IMMOLATE);

            uiImmolate_Timer = 10000;
        }
		else 
			uiImmolate_Timer -= diff;

		//TrennungsAngst wenn Add von Garr zu weit weggezogen wird
		if (pGarr)
		{
			if (!m_creature->IsWithinDistInMap(pGarr, 70.0f) && !m_creature->HasAura(SPELL_SEPERATION_ANXIETY))
				DoCastSpellIfCan(m_creature,SPELL_SEPERATION_ANXIETY);
 
			if (m_creature->IsWithinDistInMap(pGarr, 70.0f) && m_creature->HasAura(SPELL_SEPERATION_ANXIETY))
				m_creature->RemoveAllAuras();

        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_garr(Creature* pCreature)
{
    return new boss_garrAI(pCreature);
}

CreatureAI* GetAI_mob_firesworn(Creature* pCreature)
{
    return new mob_fireswornAI(pCreature);
}

void AddSC_boss_garr()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_garr";
    newscript->GetAI = &GetAI_boss_garr;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_firesworn";
    newscript->GetAI = &GetAI_mob_firesworn;
    newscript->RegisterSelf();
}
