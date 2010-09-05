/* Copyright (C) 2010 Marvin Cordes

/* ScriptData
SDName: Boss_Baron_Geddon
SD%Complete: 100
SDComment: geddon muss sein event ansagen
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "molten_core.h"

#include "WorldPacket.h"
#include "Spell.h"

#define	SAY_EMOTE_SERVICE	"Baron Geddon performs one last service for Ragnaros."

enum
{
	SPELL_INFERNO					=	19695,	//he can't move
	SPELL_INFERNO_BLAST				=	21158,
	SPELL_INFERNO_BLAST_ANIMATION	=	5857,
 
	SPELL_IGNITE_MANA				=	19659,	//35 yard radius	
	SPELL_LIVING_BOMB				=	20475,
	SPELL_ARMAGEDDON_ANIMATION		=	20478,  //animation die 8 sekunden anhält
	SPELL_EXPLODE					=   20479,
	SPELL_ARMAGEDDON_EXPLOSION		=   18432,  // spell der die melees killen soll bei armageddon
};


class MANGOS_DLL_DECL BombAura : public Aura
{
    public:
        BombAura(SpellEntry *spell, SpellEffectIndex eff, int32 *bp, Unit *target, Unit *caster) : Aura(spell, eff, bp, target, caster, NULL)
            {}
};


struct MANGOS_DLL_DECL boss_baron_geddonAI : public ScriptedAI
{
    boss_baron_geddonAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

	ScriptedInstance* m_pInstance;

	uint32 uiInferno_Timer;
    uint32 uiInfernoBlast_Timer;
	uint32 uiInfernoBlast_Count;
    uint32 uiIgniteMana_Timer;
    uint32 uiLivingBomb_Timer;
	uint32 uiArmageddon_Timer;

	uint8 killyourself;

	bool bHasPerformedService;
	bool startEXPLOSION;

    void Reset()
    {
		if (m_pInstance && m_pInstance->GetData(TYPE_GEDDON) != DONE)
			m_pInstance->SetData(TYPE_GEDDON, NOT_STARTED);

		uiInferno_Timer = 45000;      //These times are probably wrong
		uiIgniteMana_Timer = 30000;
		uiLivingBomb_Timer = 35000;
		uiArmageddon_Timer = 6500;
		uiInfernoBlast_Timer = 1000;
		
		uiInfernoBlast_Count = 9;

		killyourself = 0;

		bHasPerformedService = false;		
    }

	void Aggro(Unit* pWho)
	{
		if (m_pInstance)
			m_pInstance->SetData(TYPE_GEDDON, IN_PROGRESS);
	}

	void JustDied(Unit* pKiller)							// instance_molten_core
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_GEDDON, DONE);
    }

    void UpdateAI(const uint32 diff)
	{
		Unit* mTank = SelectUnit(SELECT_TARGET_TOPAGGRO, 0);
		if (mTank)
			mTank->SetArmor(0);

		//Geddon bewegt sich nicht bei seinen Blast Waves
		if (uiInfernoBlast_Count < 9)
			m_creature->StopMoving();

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //If geddon's hp below 2% , cast Ammageddon
		if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() <= 2)
         {
			m_creature->InterruptNonMeleeSpells(true);
			m_creature->StopMoving();

			if (!bHasPerformedService)
			{
				DoCastSpellIfCan(m_creature,SPELL_ARMAGEDDON_ANIMATION);	// Armageddon Animation wird ausgelöst
				DoYell(SAY_EMOTE_SERVICE,LANG_UNIVERSAL,NULL);				// Event wird angesagt
				bHasPerformedService = true;
				startEXPLOSION = false;
			}
			if (uiArmageddon_Timer < diff)									//You have 5 seconds to kill him before he explodes like a living bomb, killing anyone in melee range (8500+ damage).
			{
				startEXPLOSION = true;
				uiArmageddon_Timer = 6500;
			}
			else 
				uiArmageddon_Timer -= diff;

			if (startEXPLOSION)
			{
				DoCastSpellIfCan(m_creature,SPELL_ARMAGEDDON_EXPLOSION);
				if (killyourself == 5)
				{
					m_creature->CastSpell(m_creature,SPELL_EXPLODE,true);
				}

				++killyourself;
			}
          
            return;
        }

        if (uiInferno_Timer < diff)
        {
			DoCastSpellIfCan(m_creature, SPELL_INFERNO);
			DoCastSpellIfCan(m_creature, SPELL_INFERNO_BLAST);
			DoCastSpellIfCan(m_creature, SPELL_INFERNO_BLAST_ANIMATION);
            uiInferno_Timer = 45000;
			uiInfernoBlast_Count = 1;
        }
		else 
			uiInferno_Timer -= diff;

        if(uiInfernoBlast_Timer < diff)
        {
            DoCastSpellIfCan(m_creature, SPELL_INFERNO_BLAST_ANIMATION);
			m_creature->CastSpell(m_creature, SPELL_INFERNO_BLAST, true);
			m_creature->StopMoving();
            uiInfernoBlast_Timer = 1000;
			++uiInfernoBlast_Count;
        }
		else if (uiInfernoBlast_Count < 9)
		    uiInfernoBlast_Timer -= diff;
			

        if (uiIgniteMana_Timer < diff)
        {
			DoCastSpellIfCan(m_creature, SPELL_IGNITE_MANA);           
            uiIgniteMana_Timer = 30000;
        }
		else 
			uiIgniteMana_Timer -= diff;

        if (uiLivingBomb_Timer < diff)
        {
            if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
			{
			    //DoCastSpellIfCan(pTarget, SPELL_LIVING_BOMB);
				SpellEntry *spell = (SpellEntry *)GetSpellStore()->LookupEntry(SPELL_LIVING_BOMB);
				for (uint8 i = 0; i < 3; ++i)
				{
					if (!spell->Effect[i])
						continue;

					SpellEffectIndex effIndex = (SpellEffectIndex) i;
					pTarget->AddAura(new BombAura(spell, effIndex, NULL, pTarget, pTarget));
			    }
			}
            uiLivingBomb_Timer = 30000;
		}
		else 
			uiLivingBomb_Timer -= diff;           

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_baron_geddon(Creature* pCreature)
{
    return new boss_baron_geddonAI(pCreature);
}

void AddSC_boss_baron_geddon()
{
    Script* newscript;
    newscript = new Script;
    newscript->Name = "boss_baron_geddon";
    newscript->GetAI = &GetAI_boss_baron_geddon;
    newscript->RegisterSelf();
}
