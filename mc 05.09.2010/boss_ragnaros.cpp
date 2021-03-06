/* Copyright (C) 2010 Marvin Cordes

/* ScriptData
SDName: Boss_Ragnaros
SD%Complete: 100
SDComment:
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "molten_core.h"

#define SAY_REINFORCEMENTS1         -1409013
#define SAY_REINFORCEMENTS2         -1409014
#define SAY_HAND                    -1409015
#define SAY_WRATH                   -1409016
#define SAY_KILL                    -1409017
#define SAY_MAGMABURST              -1409018

#define SPELL_HANDOFRAGNAROS        19780
#define SPELL_WRATHOFRAGNAROS       20566
#define SPELL_LAVABURST             21158

#define SPELL_MAGMABURST            20565                   //Ranged attack

#define SPELL_SONSOFFLAME_DUMMY     21108                   //Server side effect
#define SPELL_RAGSUBMERGE           21107                   //Stealth aura
#define SPELL_RAGEMERGE             20568
#define SPELL_MELTWEAPON            21388
#define SPELL_ELEMENTALFIRE         20564

#define SPELL_FIREBALL				19411
#define SPELL_FIRENOVA				21154

#define ADD_1X 848.740356
#define ADD_1Y -816.103455
#define ADD_1Z -229.74327
#define ADD_1O 2.615287

#define ADD_2X 852.560791
#define ADD_2Y -849.861511
#define ADD_2Z -228.560974
#define ADD_2O 2.836073

#define ADD_3X 808.710632
#define ADD_3Y -852.845764
#define ADD_3Z -227.914963
#define ADD_3O 0.964207

#define ADD_4X 786.597107
#define ADD_4Y -821.132874
#define ADD_4Z -226.350128
#define ADD_4O 0.949377

#define ADD_5X 796.219116
#define ADD_5Y -800.948059
#define ADD_5Z -226.010361
#define ADD_5O 0.560603

#define ADD_6X 821.602539
#define ADD_6Y -782.744109
#define ADD_6Z -226.023575
#define ADD_6O 6.157440

#define ADD_7X 844.924744
#define ADD_7Y -769.453735
#define ADD_7Z -225.521698
#define ADD_7O 4.4539958

#define ADD_8X 839.823364
#define ADD_8Y -810.869385
#define ADD_8Z -229.683182
#define ADD_8O 4.693108

#define LAVABURST_TRIGGER	384727
#define CASTERKICK_TRIGGER	384728


struct MANGOS_DLL_DECL boss_ragnarosAI : public ScriptedAI
{
    boss_ragnarosAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);
		m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
		Reset();
    }
	ScriptedInstance* m_pInstance;

    uint32 WrathOfRagnaros_Timer;
	uint32 CasterKick_Timer;
    uint32 HandOfRagnaros_Timer;
    uint32 LavaBurst_Timer;
    uint32 MagmaBurst_Timer;
    uint32 ElementalFire_Timer;
    uint32 Submerge_Timer;
    uint32 Attack_Timer;
    Creature *Summoned;
    bool HasYelledMagmaBurst;
    bool HasSubmergedOnce;
    bool WasBanished;
    bool HasAura;

	bool SecondTankFound;
	bool eAddsspawned;

	Unit* sTank;

	Creature* eAdds[8];

    void Reset()
    {
        WrathOfRagnaros_Timer = 25000;
		CasterKick_Timer = 30000;
        HandOfRagnaros_Timer = 25000;
        LavaBurst_Timer = 10000;
        MagmaBurst_Timer = 2000;
        ElementalFire_Timer = 3000;
        Submerge_Timer = 180000;
        Attack_Timer = 90000;
        HasYelledMagmaBurst = false;
        HasSubmergedOnce = false;
        WasBanished = false;

		SecondTankFound = false;
		eAddsspawned = false;

        m_creature->CastSpell(m_creature,SPELL_MELTWEAPON,true);
        HasAura = true;
    }

	bool AddsAreDead()
	{
		if (eAddsspawned == true)
		{
			for(uint8 i = 0; i < 8 ; ++i)
			{
				if (eAdds[i] && eAdds[i]->isAlive())
					return false;
			}
			return true;
		}
	}

	void JustDied(Unit* pKiller)							// instance_molten_core
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_RAGNAROS, DONE);
    }

    void KilledUnit(Unit* victim)
    {
        if (urand(0, 4))
            return;

        DoScriptText(SAY_KILL, m_creature);
    }


	// F�r CasterKick relevant, wenn der Feuerball einschl�gt = Kick
	void SpellHitTarget(Unit* pCaster, const SpellEntry* pSpell)
    {
        if (pSpell->Id == SPELL_FIREBALL)
		{
            Creature* KickTrigger =	m_creature->SummonCreature(CASTERKICK_TRIGGER,pCaster->GetPositionX(), pCaster->GetPositionY(), pCaster->GetPositionZ(),0.0f,TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN,900000);
			KickTrigger->CastSpell(KickTrigger,SPELL_WRATHOFRAGNAROS,true);
			KickTrigger->ForcedDespawn();
		}
    }

    void UpdateAI(const uint32 diff)
    {
        if (WasBanished && Attack_Timer < diff || WasBanished && AddsAreDead())
        {
            //Become unbanished again
			m_creature->SetVisibility(VISIBILITY_ON);
            m_creature->setFaction(14);
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            DoCastSpellIfCan(m_creature,SPELL_RAGEMERGE);
            WasBanished = false;

			eAddsspawned = false;
        } 
		else 
		{
			if (WasBanished)
			{
            Attack_Timer -= diff;
            //Do nothing while banished
            return;
			}
		}

        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //Melee Kick (Wrath of Ragnaros)
        if (WrathOfRagnaros_Timer < diff)
        {
            DoCastSpellIfCan(m_creature,SPELL_WRATHOFRAGNAROS);

            if (urand(0, 1))
                DoScriptText(SAY_WRATH, m_creature);

            WrathOfRagnaros_Timer = 25000;
        }
		else
			WrathOfRagnaros_Timer -= diff;

		//Caster Kick (Wrath of Ragnaros)
		if (CasterKick_Timer < diff)
		{
			Unit* pCaster = SelectUnit(SELECT_TARGET_RANDOM,0);
			if (pCaster && pCaster->getPowerType() == POWER_MANA)			// Handelt es sich bei dem Ziel um eine Mana-Klasse
			{
				m_creature->CastSpell(pCaster,SPELL_FIREBALL,true);			// Feuerball l�st den Spellhit f�r Kick aus
				pCaster->CastSpell(pCaster,SPELL_FIRENOVA,true);

				CasterKick_Timer = 20000 + rand()%10000;
			}
		}
		else
			CasterKick_Timer -= diff;

        //HandOfRagnaros_Timer
        if (HandOfRagnaros_Timer < diff)
        {
            DoCastSpellIfCan(m_creature,SPELL_HANDOFRAGNAROS);

            if (urand(0, 1))
                DoScriptText(SAY_HAND, m_creature);

            HandOfRagnaros_Timer = 25000;
        }
		else 
			HandOfRagnaros_Timer -= diff;

        //Lava Explosion
        if (LavaBurst_Timer < diff)
        {
			Creature* pTarget = NULL;
			std::list<Creature*> LBT;          
			GetCreatureListWithEntryInGrid(LBT,m_creature,LAVABURST_TRIGGER,100.0f);
			if (!LBT.empty())
            {
				std::list<Creature*>::iterator i = LBT.begin();
                advance(i, (rand()%LBT.size()));
                pTarget = (*i);

				Unit* fu = SelectUnit(SELECT_TARGET_RANDOM,0);
				pTarget->CastSpell(fu,SPELL_LAVABURST,true);

				pTarget->CastSpell(pTarget,23971,true);
				LavaBurst_Timer = 10000;
			}
        }
		else 
			LavaBurst_Timer -= diff;


        //ElementalFire_Timer
        if (ElementalFire_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(),SPELL_ELEMENTALFIRE);
            ElementalFire_Timer = urand(10000, 14000);
        }
		else 
			ElementalFire_Timer -= diff;

        //Submerge_Timer
        if (!WasBanished && Submerge_Timer < diff)
        {
            //Creature spawning and ragnaros becomming unattackable
            //is not very well supported in the core
            //so added normaly spawning and banish workaround and attack again after 90 secs.

            m_creature->InterruptNonMeleeSpells(false);
            //Root self
            DoCastSpellIfCan(m_creature,23973);
            m_creature->setFaction(35);
			m_creature->SetVisibility(VISIBILITY_OFF);
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            m_creature->HandleEmoteCommand(EMOTE_ONESHOT_SUBMERGE);

            if (!HasSubmergedOnce)
            {
                DoScriptText(SAY_REINFORCEMENTS1, m_creature);

                // summon 8 elementals
                for(int i = 0; i < 8; ++i)
                {
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                    {
                        if (eAdds[i] = m_creature->SummonCreature(12143,pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(),0.0f,TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN,900000))
                            eAdds[i]->AI()->AttackStart(pTarget);
                    }	
                }

                HasSubmergedOnce = true;
                WasBanished = true;
                DoCastSpellIfCan(m_creature,SPELL_RAGSUBMERGE);
                Attack_Timer = 90000;

				eAddsspawned = true;
            }
            else
            {
                DoScriptText(SAY_REINFORCEMENTS2, m_creature);

                for(int i = 0; i < 8; ++i)
                {
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                    {
                        if (eAdds[i] = m_creature->SummonCreature(12143,pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(),0.0f,TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN,900000))
                            eAdds[i]->AI()->AttackStart(pTarget);
                    }
                }

                WasBanished = true;
                DoCastSpellIfCan(m_creature,SPELL_RAGSUBMERGE);
                Attack_Timer = 90000;

				eAddsspawned = true;
            }

            Submerge_Timer = 180000;
        }
		else 
			Submerge_Timer -= diff;

        //Ist der Maintank an Ragnaros dran (getVictim sucht den Spieler mit der meisten Aggro)
        if (m_creature->IsWithinDistInMap(m_creature->getVictim(), ATTACK_DISTANCE))
        {
            //Make sure our attack is ready and we arn't currently casting
            if (m_creature->isAttackReady() && !m_creature->IsNonMeleeSpellCasted(false))
            {	
				m_creature->getVictim()->SetArmor(0);							//feueresi wird ben�tigt
				m_creature->AttackerStateUpdate(m_creature->getVictim());
				m_creature->resetAttackTimer();
            }
        }
        else
        {
			m_creature->getThreatManager().modifyThreatPercent(m_creature->getVictim(),-100);
			for(int i = 0; i < 1000; ++i)
			{
				// Ist ein anderer Tank an Ragnaros dran
				sTank = SelectUnit(SELECT_TARGET_RANDOM,0);				
				if (m_creature->IsWithinDistInMap(sTank, ATTACK_DISTANCE))
				{
					SecondTankFound = true;
					m_creature->getThreatManager().modifyThreatPercent(sTank,100);
					break;
				}

				if (SecondTankFound == true)
					break;
			}

			if (SecondTankFound == true)
			{
				SecondTankFound = false; 

				//Make sure our attack is ready and we arn't currently casting
				if (m_creature->isAttackReady() && !m_creature->IsNonMeleeSpellCasted(false))
				{
					sTank->SetArmor(0);						//feueresi wird ben�tigt
					m_creature->AttackerStateUpdate(sTank);
					m_creature->resetAttackTimer();
				}
			}
			else
			{
				//MagmaBurst_Timer
				if (MagmaBurst_Timer < diff)
				{
					if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
						DoCastSpellIfCan(pTarget,SPELL_MAGMABURST);

					if (!HasYelledMagmaBurst)
					{
						DoScriptText(SAY_MAGMABURST, m_creature);
						HasYelledMagmaBurst = true;
					}

					MagmaBurst_Timer = 2500;
				}
				else
					MagmaBurst_Timer -= diff;
			}
		}
    }
};
CreatureAI* GetAI_boss_ragnaros(Creature* pCreature)
{
    return new boss_ragnarosAI(pCreature);
}

void AddSC_boss_ragnaros()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_ragnaros";
    newscript->GetAI = &GetAI_boss_ragnaros;
    newscript->RegisterSelf();
}
