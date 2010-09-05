/* Copyright (C) 2010 Marvin Cordes

/* ScriptData
SDName: Boss_Majordomo_Executus
SD%Complete: 100
SDComment: 
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "molten_core.h"

enum
{
	FACTION_DARK_IRON_DWARVES	=	54,
	FACTION_MONSTER				=	14,

	NPC_FLAMEWAKER_PRIEST		=	11663,
	NPC_FLAMEWAKER_ELITE		=	11664,

	SAY_AGGRO					=	-1409003,
	SAY_SPAWN					=	-1409004,
	SAY_SLAY					=	-1409005,
	SAY_SPECIAL					=	-1409006,
	SAY_DEFEAT					=	-1409007,

	//Majordomo Speech at Ragnaros
	SAY_SUMMON      			=	-1409008,
	SAY_ARRIVAL_MAJOR			=	-1409010,

	//Ragnaros Answer to Majordomo
	SAY_ARRIVAL_RAG_1			=	-1409009,
	SAY_ARRIVAL_RAG_2			=	-1409011,
	SAY_ARRIVAL_RAG_3			=	-1409012,

	//Majordomo Spells
	SPELL_MAGIC_REFLECTION		=	20619,
	SPELL_DAMAGE_REFLECTION		=	21075,
	SPELL_BLAST_WAVE			=	20229,      // Also used by Flamewaker Elites!
	SPELL_AEGIS					=	20620,	    //This is self casted whenever we are below 50%
	SPELL_TELEPORT_TO_COALS		=	20534,

	//Priest spells
	SPELL_GREATER_HELL			=	25840,      
	SPELL_SHADOW_SHOCK          =   21077,
	SPELL_SHADOW_BOLT			=   22677,

	//Elite spells
	SPELL_FIRE_BLAST			=	20623,      

	//For Intro Handling
	SPELL_VISUAL_TELEPORT       =   19484,

	SPELL_SUMMON_RAGNAROS		=	19774,
	SPELL_RAGE_MERGE			=	20568,
	SPELL_ELEMENTAL_FIRE		=	19773
};

#define GOSSIP_ITEM_DOMO   "Let me talk with your master!"

//Orientation	= 3.541
float PositionOfAdds3[8][3]=
{	
    {760.444, -1183.175, -119.181},		//First Elite, right Side
    {753.009, -1198.237, -118.346},		//Second Elite, right Side
	{746.649, -1154.512, -119.181},		//Third Elite, left Side		
	{729.771, -1153.243, -119.181},		//Fourth Elite, left side
    {761.088, -1174.606, -119.181},		//First Priest, right Side
    {756.907, -1191.007, -119.181},		//Second Priest, right Side
	{753.748, -1159.354, -119.181},		//Third Priest , left Side
	{738.322, -1152.389, -119.181},		//Fourth Pirest, left Side
};



struct MANGOS_DLL_DECL boss_majordomoAI : public ScriptedAI
{
    boss_majordomoAI(Creature* pCreature) : ScriptedAI(pCreature)
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

	Creature* pAdds[8]; //First four elite, second four priests
	char addreset;
	
	Creature* pRagnaros; // for intro handling
 
    uint32 uiMagicReflection_Timer;
    uint32 uiDamageReflection_Timer;
    uint32 uiBlastwave_Timer;
	uint32 uiTeleport_Timer;

	uint32 uiCheckFlamewaker_Timer;

	uint32 uiIntro_Timer;
	uint8 uiIntroCounter;
	uint8 uiWPdone;

	bool bSaySpawn;
	bool bIntroDone;
	bool bMoving;
	bool bSetVisible;
	bool changeShield;



    void Reset()
    {
		if (!m_pInstance)
			return;

		if (m_pInstance->GetData(TYPE_MAJORDOMO) != SPECIAL)
		{
			m_pInstance->SetData(TYPE_MAJORDOMO, NOT_STARTED);

			uiMagicReflection_Timer =  30000;
			uiDamageReflection_Timer = 15000;
			uiBlastwave_Timer = 10000;
			uiTeleport_Timer = 20000;

			uiCheckFlamewaker_Timer = 2000;
			bSaySpawn = false;
			bSetVisible = false;
			changeShield = false;

			// first spawn when creating the instance
			if (m_pInstance->GetData(DATA_DOMO_ADDS_SPAWNED) != DONE)
				addreset = 7;

			if(addreset == 3)
			{
				if (uiBlastwave_Timer == 10000)
					addreset = 7;            // ready to reset adds
			}

			if (addreset == 7)
			{
				// kill adds before respawn - but not on first spawn when creating the instance
				if (m_pInstance->GetData(DATA_DOMO_ADDS_SPAWNED) == DONE)
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
				 if (i < 4)
						pAdds[i] = m_creature->SummonCreature(NPC_FLAMEWAKER_ELITE,PositionOfAdds3[i][0],PositionOfAdds3[i][1],PositionOfAdds3[i][2],3.541,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,90000000);
					else
						pAdds[i] = m_creature->SummonCreature(NPC_FLAMEWAKER_PRIEST,PositionOfAdds3[i][0],PositionOfAdds3[i][1],PositionOfAdds3[i][2],3.541,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,90000000);
					if (pAdds[i])
						// make them invisible as majordomo - IMPLEMENT, THAT THEY DO NOT ATTACK WHILE INVISIBLE!
						pAdds[i]->SetVisibility(VISIBILITY_ON);
				}
				m_pInstance->SetData(DATA_DOMO_ADDS_SPAWNED,DONE);
				addreset = 0;
			}
		}
		else
		{
			//Intro handling
			uiIntro_Timer = 36000;
			uiWPdone = 0;

			bIntroDone = false;
			bMoving = false;
		}
	
    }

	void BeginEvent(Player* pTarget)
	{
		uiIntroCounter = 2;
    }

	void MoveInLineOfSight(Unit* pWho)
    {		
		if (!m_pInstance || m_pInstance->GetData(TYPE_MAJORDOMO) == SPECIAL || m_creature->GetVisibility() == VISIBILITY_OFF)
			return;

		if (!bSaySpawn && !m_creature->getVictim() && pWho->isTargetableForAttack() && ( m_creature->IsHostileTo( pWho )) && pWho->isInAccessablePlaceFor(m_creature))
		{
			DoScriptText(SAY_SPAWN, m_creature);
			bSaySpawn = true;
		}

		if (m_creature->IsWithinDistInMap(pWho, m_creature->GetAttackDistance(pWho)) && m_creature->IsWithinLOSInMap(pWho) 
			&& !(pWho->getFaction()== FACTION_DARK_IRON_DWARVES || pWho->getFaction() == FACTION_MONSTER))
		{
			pWho->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
			AttackStart(pWho);
		}	

    }

    void KilledUnit(Unit* pVictim)
    {
        if (rand()%5)
            DoScriptText(SAY_SLAY, m_creature);
    }
	

    void DamageTaken(Unit* pDoneBy, uint32& uiDamage)
    {
        //reset the health points of majordomo, when his health is too low, because he can't get defeated
        if ((m_creature->GetHealth() - uiDamage)*100 / m_creature->GetMaxHealth() <= 30)
            m_creature->SetHealth(m_creature->GetHealth());
    }       

    void Aggro(Unit* pWho)
    {
        // only aggro , when it is before the ragnaros event
		if (m_pInstance && m_pInstance->GetData(TYPE_MAJORDOMO) != SPECIAL)
		{
			m_pInstance->SetData(TYPE_MAJORDOMO, IN_PROGRESS);

		    for(uint8 i = 0 ; i < 8 ; ++i)
		        if (pAdds[i] && pAdds[i]->isAlive())
		            pAdds[i]->AI()->AttackStart(pWho);
			
            m_creature->CallForHelp(40.0f);
        
		    DoScriptText(SAY_AGGRO, m_creature);
		}
		else
		    return;
    }

	void MovementInform(uint32 uiType, uint32 uiWaypointId)
    {
		if (uiType != POINT_MOTION_TYPE)
			return;

		if (uiWaypointId == 1)
		{
			DoCastSpellIfCan(m_creature,SPELL_SUMMON_RAGNAROS);
			uiWPdone = 1;
			bMoving = false;
		}

        else if (uiWaypointId == 2)
		{
			uiWPdone = 2;
			bMoving = false;
		}
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

    void UpdateAI(const uint32 uiDiff)
    {
		if(addreset == 0)  // first add spawn is done
		{
			if (uiBlastwave_Timer != 10000)
					addreset = 3;             // ready to check reset                
		}

		if (!m_pInstance || m_creature->GetVisibility() == VISIBILITY_OFF)
			return;

		if (!bSetVisible && m_pInstance->GetData(DATA_BOSSES_ARE_DEAD) == DONE && m_pInstance->GetData(DATA_DOMO_ADDS_SPAWNED) == DONE)
		{
			for(uint8 i = 0; i < 8 ; ++i)
				if (pAdds[i])
					pAdds[i]->SetVisibility(VISIBILITY_ON);
			bSetVisible = true;
		}

		if (!bIntroDone)
		{
			switch(uiIntroCounter)
			{
			case 1:
			    
				if (uiIntro_Timer < uiDiff && m_pInstance->GetData(DATA_DOMO_PORTED) != DONE)
				{
				    DoCastSpellIfCan(m_creature,SPELL_VISUAL_TELEPORT);
					m_creature->SetVisibility(VISIBILITY_OFF);
					
					// "teleport" Majordomo to Ragnaros 
					// because nothing will happen or the server will crash, when we relocate him
					// when the grid isn't load at the moment
					Creature* pDomo = m_creature->SummonCreature(12018, 854.975f, -827.593f, -228.504f, 4.99008f, TEMPSUMMON_TIMED_DESPAWN,3600000);
					
					/// make him friendly and talkable
					pDomo->setFaction(35);
					pDomo->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
					pDomo->SetVisibility(VISIBILITY_ON);
					m_pInstance->SetData(DATA_DOMO_PORTED, DONE);
				}
				else 
					uiIntro_Timer -= uiDiff;

				break;

			case 2:
				if (!bMoving && uiWPdone == 0 )
				{
					m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
					m_creature->GetMotionMaster()->Clear();
					m_creature->GetMotionMaster()->MovePoint(1,851.266,-816.847,-230.358);
					bMoving = true;
				}

				if (uiWPdone == 1)
				{
					m_creature->GetMotionMaster()->Clear();
					m_creature->GetMotionMaster()->MovePoint(2,843.145,-813.479,-230.067);
					bMoving = true;
					++uiIntroCounter;

					uiIntro_Timer = 5000;
				}
				break;

			case 3:
				if (uiIntro_Timer < uiDiff)
				{
					m_creature->GetMotionMaster()->Clear();
					m_creature->GetMotionMaster()->MovePoint(3,842,-815,-229);

					DoScriptText(SAY_SUMMON, m_creature);
					pRagnaros = m_creature->SummonCreature(NPC_RAGNAROS, 839.380066f ,-833.359558f, -229.358f, 1.380336f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,7200000);
					pRagnaros->setFaction(35);
					pRagnaros->SetVisibility(VISIBILITY_OFF);

					++uiIntroCounter;
					uiIntro_Timer = 15000;
				}
				else 
					uiIntro_Timer -= uiDiff;

				break;
				
			case 4:
				if (uiIntro_Timer < uiDiff)
				{   
				    if (pRagnaros)
				    {
					    pRagnaros->CastSpell(pRagnaros,SPELL_RAGE_MERGE,false);
					    pRagnaros->SetVisibility(VISIBILITY_ON);
                    }
					++uiIntroCounter;
					uiIntro_Timer = 5000;
				}
				else 
					uiIntro_Timer -= uiDiff;
				break;
				
			case 5:
					if (uiIntro_Timer < uiDiff)
					{
					    if (pRagnaros)
						    DoScriptText(SAY_ARRIVAL_RAG_1, pRagnaros);

						++uiIntroCounter;
						uiIntro_Timer = 17000;
					}
					else 
						uiIntro_Timer -=uiDiff;
					break;

			case 6:
				if (uiIntro_Timer < uiDiff)
				{
					DoScriptText(SAY_ARRIVAL_MAJOR, m_creature);
					++uiIntroCounter;
					uiIntro_Timer = 10000;
				}
				else 
					uiIntro_Timer -= uiDiff;

				break;
				
			case 7:
					if (uiIntro_Timer < uiDiff)
					{   
					    if (pRagnaros)
						    DoScriptText(SAY_ARRIVAL_RAG_2, pRagnaros);

						++uiIntroCounter;
						uiIntro_Timer = 18000;
					}
					else 
						uiIntro_Timer -= uiDiff;
					break;

			case 8:
				if (uiIntro_Timer < uiDiff)
				{
					//kill majordomo
					if (pRagnaros)
					    pRagnaros->CastSpell(m_creature,SPELL_ELEMENTAL_FIRE,false);

					++uiIntroCounter;
					uiIntro_Timer = 1000;
				}
				else 
					uiIntro_Timer -= uiDiff;
				break;

			case 9:
				if (uiIntro_Timer < uiDiff)
				{
					pRagnaros->DealDamage(m_creature, 50000000, NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_FROST, NULL, false);
					DoScriptText(SAY_ARRIVAL_RAG_3, pRagnaros);

					m_pInstance->SetData(DATA_VAR_RAGNAROS_INTRO, DONE);
					pRagnaros->setFaction(91);
					bIntroDone = true;
				}
				else 
					uiIntro_Timer -= uiDiff;
			}
		}

        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim() || m_pInstance->GetData(TYPE_MAJORDOMO) == SPECIAL)
            return;

		if (uiCheckFlamewaker_Timer < uiDiff)
		{
			if (AddsAreDead())
			{
				m_pInstance->SetData(TYPE_MAJORDOMO, SPECIAL);

				uiCheckFlamewaker_Timer = 600000;

				DoScriptText(SAY_DEFEAT, m_creature);
				uiIntroCounter = 1;

				EnterEvadeMode();
				m_creature->setFaction(35);
			}
			uiCheckFlamewaker_Timer = 2000;
		}
		else 
			uiCheckFlamewaker_Timer -= uiDiff;

		//Wenn MajorDomus low hp hat heilt er sich auf 100% wieder hoch
        if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 50)        
            DoCastSpellIfCan(m_creature,SPELL_AEGIS);        

		//abfrage ob domo oder ein casteradd oder ein meleeadd das meleeshield hatten
		if (m_creature->HasAura(SPELL_DAMAGE_REFLECTION) || pAdds[0]->HasAura(SPELL_DAMAGE_REFLECTION)|| pAdds[7]->HasAura(SPELL_DAMAGE_REFLECTION))
			changeShield = true;

		//CASTER SHIELD
        if (uiMagicReflection_Timer < uiDiff)
        {
			if (changeShield == true)
			{
				//Spell buggt, wenn auf Spieler gewirkt geht der Spell auf die Mobs und umgekehrt
				Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);				
				pTarget->CastSpell(m_creature,SPELL_MAGIC_REFLECTION,true);

				for(uint8 i = 0; i < 8 ; ++i)
				{
					pTarget->CastSpell(pAdds[i],SPELL_MAGIC_REFLECTION,true);
				}

				uiDamageReflection_Timer = 15000;
			}
        }
		else 
			uiMagicReflection_Timer -= uiDiff;

		//abfrage ob domo oder ein casteradd oder ein meleeadd das castershield hatten
		if (m_creature->HasAura(SPELL_MAGIC_REFLECTION) || pAdds[0]->HasAura(SPELL_MAGIC_REFLECTION)|| pAdds[7]->HasAura(SPELL_MAGIC_REFLECTION))
			changeShield = false;

		//MELEE SHIELD
		if (uiDamageReflection_Timer < uiDiff)
		{
			if (changeShield == false)
			{
				//Spell buggt, wenn auf Spieler gewirkt geht der Spell auf die Mobs und umgekehrt
				Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);				
				pTarget->CastSpell(m_creature,SPELL_DAMAGE_REFLECTION,true);

				for(uint8 i = 0; i < 8 ; ++i)
				{
					pTarget->CastSpell(pAdds[i],SPELL_DAMAGE_REFLECTION,true);
				}

				uiMagicReflection_Timer = 15000;
			}
		}
		else 
			uiDamageReflection_Timer -= uiDiff;

		//Feuernova
        if (uiBlastwave_Timer < uiDiff)
        {
            DoCastSpellIfCan(m_creature,SPELL_BLAST_WAVE);
            uiBlastwave_Timer = 10000;
        }
		else 
			uiBlastwave_Timer -= uiDiff;

		//Teleport
		if (uiTeleport_Timer < uiDiff)
		{
			Unit* pTarget = NULL;
			if(rand()%2 == 1)
				m_creature->getThreatManager().modifyThreatPercent(m_creature->getVictim(), 80);
			else
				pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);

			if (pTarget)
			{
				pTarget->NearTeleportTo(737, -1176, -118, 3);
				DoCastSpellIfCan(pTarget,SPELL_TELEPORT_TO_COALS);
				DoScriptText(SAY_SPECIAL,m_creature);
				//DMG der COals fehlt noch
			}

			uiTeleport_Timer = 20000 + rand()%5000;
		}
		else 
			uiTeleport_Timer -= uiDiff;

		DoMeleeAttackIfReady();
    }
};


//MELEEE ADD
struct MANGOS_DLL_DECL mob_flamewaker_eliteAI : public ScriptedAI
{
	mob_flamewaker_eliteAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
		Reset();
	}

	ScriptedInstance* m_pInstance;

	uint32 uiBlastwave_Timer;
	uint32 uiFireblast_Timer;


    void Reset()
    {
		uiFireblast_Timer = 5000;
		uiBlastwave_Timer = 10000;
    }


	void Aggro(Unit* pWho)
    {
		m_creature->CallForHelp(20.0f);
	}

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
			return;

		//Fire Blast
		if (uiFireblast_Timer < uiDiff)
		{
			if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))				
				m_creature->CastSpell(pTarget,SPELL_FIRE_BLAST,true);

			uiFireblast_Timer = 15000;
		}
		else
			uiFireblast_Timer -=uiDiff;

		//Blast Wave
		if (uiBlastwave_Timer < uiDiff)
        {
            DoCastSpellIfCan(m_creature,SPELL_BLAST_WAVE);
            uiBlastwave_Timer = 7000 + rand()% 4000;
        }
		else 
			uiBlastwave_Timer -= uiDiff;


        DoMeleeAttackIfReady();
    }
};


//CASTER ADD
struct MANGOS_DLL_DECL mob_flamewaker_healAI : public ScriptedAI
{
	mob_flamewaker_healAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
		Reset();
	}

	ScriptedInstance* m_pInstance;

	uint32 uiGreaterHell_Timer;
	uint32 uiShadowShock_Timer;
	uint32 uiShadowBolt_Timer;


    void Reset()
    {
		uiGreaterHell_Timer = 15000;
		uiShadowShock_Timer = 9000;
		uiShadowBolt_Timer = 2000;
    }		      

	void Aggro(Unit* pWho)
    {
		m_creature->CallForHelp(20.0f);
	}

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

		//Heal
		if (uiGreaterHell_Timer < uiDiff)
		{
			m_creature->InterruptSpell(CURRENT_GENERIC_SPELL);
			Unit* pFriendlyUnit = DoSelectLowestHpFriendly(60.0f,1);
			if (pFriendlyUnit && m_creature->IsWithinDistInMap(pFriendlyUnit,40.0f))
			{
				DoCastSpellIfCan(pFriendlyUnit,SPELL_GREATER_HELL);
			}

			uiGreaterHell_Timer = 10000 + rand()%5000;
		}
		else
			uiGreaterHell_Timer -= uiDiff;

		//Shadow Shock
		if (uiShadowShock_Timer < uiDiff)
		{
			if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))				
				m_creature->CastSpell(pTarget,SPELL_SHADOW_SHOCK ,true);

			uiShadowShock_Timer = 9000;
		}
		else
			uiShadowShock_Timer -= uiDiff;

		//Shadowbolt
		if (uiShadowBolt_Timer < uiDiff)
		{
			if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
				DoCastSpellIfCan(pTarget,SPELL_SHADOW_BOLT);			

			uiShadowBolt_Timer = 2000;
		}
		else
			uiShadowBolt_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_majordomo(Creature* pCreature)
{
    return new boss_majordomoAI(pCreature);
}

CreatureAI* GetAI_mob_flamewaker_heal(Creature* pCreature)
{
    return new mob_flamewaker_healAI(pCreature);
}

CreatureAI* GetAI_mob_flamewaker_elite(Creature* pCreature)
{
    return new mob_flamewaker_eliteAI(pCreature);
}

bool GossipHello_boss_majordomo(Player* pPlayer, Creature* pCreature)
{
    pPlayer->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM_DOMO , GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
    pPlayer->SEND_GOSSIP_MENU(68,pCreature->GetGUID());
    return true;
}

bool GossipSelect_boss_majordomo(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction )
{
	if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
	{
	    ((boss_majordomoAI*)pCreature->AI())->BeginEvent(pPlayer);
		pPlayer->CLOSE_GOSSIP_MENU();
	}
    return true;
}


void AddSC_boss_majordomo()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_majordomo";
    newscript->GetAI = &GetAI_boss_majordomo;
	newscript->pGossipHello = &GossipHello_boss_majordomo;
    newscript->pGossipSelect = &GossipSelect_boss_majordomo;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name = "mob_flamewaker_heal";
    newscript->GetAI = &GetAI_mob_flamewaker_heal;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name = "mob_flamewaker_elite";
    newscript->GetAI = &GetAI_mob_flamewaker_elite;
    newscript->RegisterSelf();
}
