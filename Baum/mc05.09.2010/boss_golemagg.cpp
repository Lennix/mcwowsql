/* Copyright (C) 2010 Marvin Cordes

/* ScriptData
SDName: Boss_Golemagg
SD%Complete: 100
SDComment: corerager könnten noch was sagen wenn sie wieder full life bekommen
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "molten_core.h"

#define SAY_EMOTE_LOWHP  "Core Rager refuses to die while its master is in trouble"

enum
{
    SPELL_MAGMASPLASH       = 13879,
    SPELL_PYROBLAST         = 20228,
    SPELL_EARTHQUAKE        = 19798,
    SPELL_ENRAGE            = 19953,

    // Core Rager
    SPELL_MANGLE            = 19820,
	GOLEMAGG_BUFF           = 20553,

	NPC_CORERAGER			= 11672
};

struct MANGOS_DLL_DECL boss_golemaggAI : public ScriptedAI
{
    boss_golemaggAI(Creature* pCreature) : ScriptedAI(pCreature)
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

    uint32 m_uiPyroblastTimer;
    uint32 m_uiEarthquakeTimer;
    uint32 m_uiBuffTimer;
    bool m_bEnraged;

    void Reset()
    {
		if (m_pInstance->GetData(TYPE_GOLEMAGG) != DONE)
		{
			m_pInstance->SetData(TYPE_GOLEMAGG, NOT_STARTED);

			m_uiPyroblastTimer = 7*IN_MILLISECONDS;              // These timers are probably wrong
			m_uiEarthquakeTimer = 3*IN_MILLISECONDS;
			m_uiBuffTimer = 2.5*IN_MILLISECONDS;
			m_bEnraged = false;

			m_creature->CastSpell(m_creature, SPELL_MAGMASPLASH, true);

			// first spawn when creating the instance
			if (m_pInstance->GetData(DATA_GOLEMAGG_ADDS_SPAWNED) != DONE)
				addreset = 7;

			if(addreset == 3)
			{
				if (m_uiPyroblastTimer == 7000)
					addreset = 7;            // ready to reset adds
			}

			if (addreset == 7)
			{
				// kill adds before respawn - but not on first spawn when creating the instance
				if (m_pInstance->GetData(DATA_GOLEMAGG_ADDS_SPAWNED) == DONE)
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
						pAdds[i] = m_creature->SummonCreature(NPC_CORERAGER, 785, -974, -207, 5.9,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,90000000);
					else
						pAdds[i] = m_creature->SummonCreature(NPC_CORERAGER, 783, -1017, -205, 5.9,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,90000000);
					pAdds[i]->SetVisibility(VISIBILITY_ON);
				}
				m_pInstance->SetData(DATA_GOLEMAGG_ADDS_SPAWNED,DONE);
				addreset = 0;
			}
		}
    }

    void JustDied(Unit* pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GOLEMAGG, DONE);
    }

	void Aggro(Unit* pWho)
    {
		m_creature->CallForHelp(30.0f);
	}

    void UpdateAI(const uint32 uiDiff)
    {

		if(addreset == 0)  // first add spawn is done
		{
			if (m_uiPyroblastTimer != 7000)
					addreset = 3;             // ready to check reset                  
		}

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // Pyroblast
        if (m_uiPyroblastTimer < uiDiff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                DoCastSpellIfCan(pTarget, SPELL_PYROBLAST);

            m_uiPyroblastTimer = 7*IN_MILLISECONDS;
        }
        else
            m_uiPyroblastTimer -= uiDiff;

        // Enrage
        if (!m_bEnraged && m_creature->GetHealthPercent() < 10.0f)
        {
            DoCastSpellIfCan(m_creature, SPELL_ENRAGE);
            m_bEnraged = true;
        }

        // Earthquake
        if (m_bEnraged)
        {
            if (m_uiEarthquakeTimer < uiDiff)
            {
                DoCastSpellIfCan(m_creature->getVictim(), SPELL_EARTHQUAKE);
                m_uiEarthquakeTimer = 3*IN_MILLISECONDS;
            }
            else
                m_uiEarthquakeTimer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }
};

struct MANGOS_DLL_DECL mob_core_ragerAI : public ScriptedAI
{
    mob_core_ragerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    uint32 m_uiMangleTimer;
	uint32 GolemaggBuffTimer;

    void Reset()
    {
        m_uiMangleTimer = 7*IN_MILLISECONDS;                 // These times are probably wrong
		GolemaggBuffTimer = 20000;
    }

    void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
    {
        if (m_creature->GetHealthPercent() < 50.0f)
        {
            if (m_pInstance)
            {
                if (Creature* pGolemagg = m_pInstance->instance->GetCreature(m_pInstance->GetData64(DATA_GOLEMAGG)))
                {
                    if (pGolemagg->isAlive())
                    {
                        DoYell(SAY_EMOTE_LOWHP,LANG_UNIVERSAL,NULL);
                        m_creature->SetHealth(m_creature->GetMaxHealth());
                    }
                    else
                        uiDamage = m_creature->GetHealth();
                }
            }
        }
    }

	void Aggro(Unit* pWho)
    {
		m_creature->CallForHelp(30.0f);
	}

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // Mangle
        if (m_uiMangleTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_MANGLE);
            m_uiMangleTimer = 10*IN_MILLISECONDS;
        }
        else
            m_uiMangleTimer -= uiDiff;

		//Golemagg Buff
		if (GolemaggBuffTimer < uiDiff) // Timer wird einmalig beim Pull runtergezählt, danach instant!
		{
			if (Creature* pGolemagg = m_pInstance->instance->GetCreature(m_pInstance->GetData64(DATA_GOLEMAGG)))
			{
				if (m_creature->IsWithinDistInMap(pGolemagg, 50.0f) && !m_creature->HasAura(GOLEMAGG_BUFF))
					if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
						pTarget->CastSpell(pTarget,GOLEMAGG_BUFF,true);	
 
				if (!m_creature->IsWithinDistInMap(pGolemagg, 50.0f) && m_creature->HasAura(GOLEMAGG_BUFF))
					m_creature->RemoveAllAuras();
			}
		}
		else
			GolemaggBuffTimer -=uiDiff;

		//Wenn Golemagg stirbt, werden die Adds getötet
		if(m_pInstance->GetData(TYPE_GOLEMAGG) == DONE)
		{
			m_creature->setDeathState(JUST_DIED);
			m_creature->SetHealth(0);
		}

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_golemagg(Creature* pCreature)
{
    return new boss_golemaggAI(pCreature);
}

CreatureAI* GetAI_mob_core_rager(Creature* pCreature)
{
    return new mob_core_ragerAI(pCreature);
}

void AddSC_boss_golemagg()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_golemagg";
    newscript->GetAI = &GetAI_boss_golemagg;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_core_rager";
    newscript->GetAI = &GetAI_mob_core_rager;
    newscript->RegisterSelf();
}
