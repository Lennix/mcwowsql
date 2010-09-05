/* Copyright (C) 2010 Marvin Cordes

/* ScriptData
SDName: Instance_Molten_Core
SD%Complete: 100%           
SDComment: Place Holder
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "molten_core.h"

// RUNES
bool GOHello_go_runes_of_moltencore(Player* pPlayer, GameObject* pGo)
{
    if (ScriptedInstance* pInstance = (ScriptedInstance*)pGo->GetInstanceData())
    {
		switch(pGo->GetEntry())
		{
		case 176951:	//Rune of Koro
			pInstance->SetData(TYPE_RuneKoro, DONE);
			break;

		case 176952:	//Rune of Zeth
			pInstance->SetData(TYPE_RuneZeth, DONE);
			break;

		case 176953:	//Rune of Mazj
			pInstance->SetData(TYPE_RuneMazj, DONE);
			break;

		case 176954:	//Rune of Theri
			pInstance->SetData(TYPE_RuneTheri, DONE);
			break;

		case 176955:	//Rune of Blaz
			pInstance->SetData(TYPE_RuneBlaz, DONE);
			break;

		case 176956:	//Rune of Kress
			pInstance->SetData(TYPE_RuneKress, DONE);
			break;

		case 176957:	//Rune of Mohn
			pInstance->SetData(TYPE_RuneMohn, DONE);
			break;
		}
		return true;
    }

    return false;
}

// CORE HOUND PACKS
#define SPELL_SAEGEBISS			19771
#define NPC_COREHOUND			11671

struct MANGOS_DLL_DECL CoreHoundTriggerAI : public ScriptedAI
{
    CoreHoundTriggerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
		SetCombatMovement(false);
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

        Reset();
    }

	ScriptedInstance* m_pInstance;

	Creature* pAdds[5];

	bool GetCoreHounds;

	uint32 CoreHound_Timer[5];
	uint32 Saegebiss_Timer[5];
	uint8 AddCounter;

	void Reset()
	{
		for (uint8 i = 0; i < 5; ++i)
			CoreHound_Timer[i] = 12000;

		for (uint8 i = 0; i < 5; ++i)
			Saegebiss_Timer[i] = 10000;

		AddCounter = 0;

		GetCoreHounds = false;
	}


	void UpdateAI(const uint32 diff)
    {
		m_creature->CallForHelp(15.0f);

		if (GetCoreHounds == false)
		{
			//Kernhunde einlesen, 5 pro Pack
			std::list<Creature*> pList;          
			GetCreatureListWithEntryInGrid(pList,m_creature,NPC_COREHOUND,20.0f);
			for(std::list<Creature*>::iterator i = pList.begin(); i != pList.end(); ++i)
			{
				if (AddCounter < 5)
				{
					pAdds[AddCounter] = *i;

					++AddCounter;
				}
			}

			GetCoreHounds = true;
		}

		for (uint8 i = 0; i < 5; ++i)
		{
			if (pAdds[i] && pAdds[i]->isInCombat())
				pAdds[i]->CallForHelp(15.0f);				
		}

		for (uint8 i = 0; i < 5; ++i)
		{
			if (Saegebiss_Timer[i] < diff)
			{
				Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
				if (pTarget)
					pAdds[i]->CastSpell(pTarget,SPELL_SAEGEBISS,true);

				Saegebiss_Timer[i] = 10000 + rand()%5000;
			}
			else
				Saegebiss_Timer[i] -= diff;
		}

		//Timer setzen sobald ein kernhund stirbt
		for (uint8 i = 0; i < 5; ++i)
		{
			if (pAdds[i] && pAdds[i]->isDead() && CoreHound_Timer[i] > 10000)
				CoreHound_Timer[i] = 10000;
		}

		for (uint8 i = 0; i < 5; ++i)
		{
			if (CoreHound_Timer[i] <= 10000)
			{
				if (CoreHound_Timer[i] < diff)
				{
					if (pAdds[0]->isAlive() || pAdds[1]->isAlive() || pAdds[2]->isAlive() ||pAdds[3]->isAlive() ||pAdds[4]->isAlive())
					{
						pAdds[i]->setDeathState(ALIVE);
						pAdds[i]->SetHealthPercent(100);

						Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);
						pAdds[i]->AI()->AttackStart(pTarget);
					}
					else
					{
						m_creature->setDeathState(JUST_DIED);
						m_creature->SetHealthPercent(0);
					}

					CoreHound_Timer[i] = 12000;
				}
				else
					CoreHound_Timer[i] -= diff;
			}
		}
	}			
};

struct MANGOS_DLL_DECL instance_molten_core : public ScriptedInstance
{
    instance_molten_core(Map* pMap) : ScriptedInstance(pMap) {Initialize();};



    uint32 m_auiEncounter[MAX_ENCOUNTER];
	uint32 m_auiObject[MAX_OBJECT];
    std::string strInstData;

    uint64 m_uiLucifronGUID, m_uiMagmadarGUID, m_uiGehennasGUID, m_uiGarrGUID, m_uiGeddonGUID, m_uiShazzrahGUID, m_uiSulfuronGUID, m_uiGolemaggGUID, m_uiMajorDomoGUID, m_uiRagnarosGUID, m_uiFlamewakerPriestGUID, m_uiDomoTrigger;
    uint64 m_uiRuneKoroGUID, m_uiRuneZethGUID, m_uiRuneMazjGUID, m_uiRuneTheriGUID, m_uiRuneBlazGUID, m_uiRuneKressGUID, m_uiRuneMohnGUID, m_uiFirelordCacheGUID;

	//Boss Add reset
	uint32 m_uiGehennasAddsSpawned;
	uint32 m_uiDomosAddsSpawned;
	uint32 m_uiGarrAddsSpawned;
	uint32 m_uiSulfuronAddsSpawned;
	uint32 m_uiGolemaggAddsSpawned;
	uint32 m_uiLucifronAddsSpawned;

	// Ragnaros Event
	uint32 m_uiDomoPorted;
	uint32 m_uiVarRagnarosIntro;
	
	// additional MajorDomo - Not Yet Implemented

    void Initialize()
    {
        memset(&m_auiEncounter, 0, sizeof(m_auiEncounter));
		memset(&m_auiObject, 0, sizeof(m_auiObject));

        m_uiLucifronGUID = 0;
        m_uiMagmadarGUID = 0;
        m_uiGehennasGUID = 0;
        m_uiGarrGUID = 0;
        m_uiGeddonGUID = 0;
        m_uiShazzrahGUID = 0;
        m_uiSulfuronGUID = 0;
        m_uiGolemaggGUID = 0;
        m_uiMajorDomoGUID = 0;
        m_uiRagnarosGUID = 0;
        m_uiFlamewakerPriestGUID = 0;

		m_uiDomoTrigger = 0;

		m_uiDomosAddsSpawned = 0;
		m_uiGehennasAddsSpawned = 0;
		m_uiGarrAddsSpawned = 0;
		m_uiSulfuronAddsSpawned = 0;
		m_uiGolemaggAddsSpawned = 0;
		m_uiLucifronAddsSpawned = 0;

		m_uiDomoPorted		 = 0;
		m_uiVarRagnarosIntro = 0;

        m_uiRuneKoroGUID = 0;
        m_uiRuneZethGUID = 0;
        m_uiRuneMazjGUID = 0;
        m_uiRuneTheriGUID = 0;
        m_uiRuneBlazGUID = 0;
        m_uiRuneKressGUID = 0;
        m_uiRuneMohnGUID = 0;

        m_uiFirelordCacheGUID = 0;

    }


    bool IsEncounterInProgress() const
    {
        return false;
    }

    void OnObjectCreate(GameObject* pGo)
    {
        switch(pGo->GetEntry())
        {
            case 176951:                                    //Sulfuron
				if (m_auiObject[0] == DONE)
					pGo->SetGoState(GO_STATE_READY);
				else
					m_uiRuneKoroGUID = pGo->GetGUID();
                break;
            case 176952:                                    //Geddon
				if (m_auiObject[1] == DONE)
					pGo->SetGoState(GO_STATE_READY);
				else
					 m_uiRuneZethGUID = pGo->GetGUID();
                break;
            case 176953:                                    //Shazzrah
				if (m_auiObject[2] == DONE)
					pGo->SetGoState(GO_STATE_READY);
				else
					m_uiRuneMazjGUID = pGo->GetGUID();
                break;
            case 176954:                                    //Golemagg
				if (m_auiObject[3] == DONE)
					pGo->SetGoState(GO_STATE_READY);
				else
					m_uiRuneTheriGUID = pGo->GetGUID();
                break;
            case 176955:                                    //Garr
				if (m_auiObject[4] == DONE)
					pGo->SetGoState(GO_STATE_READY);
				else
					m_uiRuneBlazGUID = pGo->GetGUID();
                break;
            case 176956:                                    //Magmadar
				if (m_auiObject[5] == DONE)
					pGo->SetGoState(GO_STATE_READY);
				else
					m_uiRuneKressGUID = pGo->GetGUID();
                break;
            case 176957:                                    //Gehennas
				if (m_auiObject[6] == DONE)
					pGo->SetGoState(GO_STATE_READY);
				else
					m_uiRuneMohnGUID = pGo->GetGUID();
                break;
            case 179703:
                m_uiFirelordCacheGUID = pGo->GetGUID();     //majordomo event chest
                break;

        }
    }

    void OnCreatureCreate(Creature* pCreature)
    {
        switch(pCreature->GetEntry())
        {
            case NPC_LUCIFRON:
                m_uiLucifronGUID = pCreature->GetGUID();
                break;
            case NPC_MAGMADAR:
                m_uiMagmadarGUID = pCreature->GetGUID();
                break;
            case NPC_GEHENNAS:
                m_uiGehennasGUID = pCreature->GetGUID();
                break;
            case NPC_GARR:
                m_uiGarrGUID = pCreature->GetGUID();
                break;
            case NPC_GEDDON:
                m_uiGeddonGUID = pCreature->GetGUID();
                break;
            case NPC_SHAZZRAH:
                m_uiShazzrahGUID = pCreature->GetGUID();
                break;
            case NPC_SULFURON:
                m_uiSulfuronGUID = pCreature->GetGUID();
                break;
            case NPC_GOLEMAGG:
                m_uiGolemaggGUID = pCreature->GetGUID();
                break;
            case NPC_DOMO:
                m_uiMajorDomoGUID = pCreature->GetGUID();
                break;
            case NPC_RAGNAROS:
                m_uiRagnarosGUID = pCreature->GetGUID();
                break;
            case NPC_FLAMEWAKERPRIEST:
                m_uiFlamewakerPriestGUID = pCreature->GetGUID();
                break;
			case NPC_DOMOTRIGGER:
				m_uiDomoTrigger = pCreature->GetGUID();

				if (CanSpawnMajorDomo() == true && m_auiEncounter[8] != SPECIAL && m_uiMajorDomoGUID == 0)
				{
					// Major Domus spawnt mit seinen Adds
					pCreature->SummonCreature(NPC_DOMO, 754.281, -1168.326, -118.71, 3.56, TEMPSUMMON_DEAD_DESPAWN, 600000);
				}
				if (m_auiEncounter[8] == SPECIAL && m_uiDomoPorted == DONE && m_uiMajorDomoGUID == 0 && m_uiVarRagnarosIntro != DONE)
				{
					// Major Domus spawnt bei Ragnaros, um ihn zu beschwören
					 Creature* pTempDomo = pCreature->SummonCreature(12018, 854.975f, -827.593f, -228.504f, 4.99008f, TEMPSUMMON_TIMED_DESPAWN,3600000);
					 pTempDomo->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
					 pTempDomo->setFaction(35);
				}
				if (m_uiVarRagnarosIntro == DONE  && m_auiEncounter[9] != DONE && m_uiRagnarosGUID == 0)
				{
					// Ragnaros spawnt, Event ist zu Ende
					pCreature->SummonCreature(NPC_RAGNAROS, 839.380066f ,-833.359558f, -229.358f, 1.380336f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,7200000);
				}
				break;
        }
    }

    void SetData(uint32 uiType, uint32 uiData)
    {
        switch(uiType)
        {
            case TYPE_SULFURON:
                m_auiEncounter[0] = uiData;
                break;
            case TYPE_GEDDON:
                m_auiEncounter[1] = uiData;
                break;
            case TYPE_SHAZZRAH:
                m_auiEncounter[2] = uiData;
                break;
            case TYPE_GOLEMAGG:
                m_auiEncounter[3] = uiData;
                break;
            case TYPE_GARR:
                m_auiEncounter[4] = uiData;
                break;
            case TYPE_MAGMADAR:
                m_auiEncounter[5] = uiData;
                break;
            case TYPE_GEHENNAS:
                m_auiEncounter[6] = uiData;
                break;
            case TYPE_LUCIFRON:
                m_auiEncounter[7] = uiData;
                break;
            case TYPE_MAJORDOMO:
                m_auiEncounter[8] = uiData;
				if(m_auiEncounter[8] == SPECIAL)
					DoRespawnGameObject(m_uiFirelordCacheGUID);
                break;
            case TYPE_RAGNAROS:
                m_auiEncounter[9] = uiData;
                break;

			// Boss Add reset
			case DATA_DOMO_ADDS_SPAWNED:
				 m_uiDomosAddsSpawned = uiData;
				break;
			case DATA_GEHENNAS_ADDS_SPAWNED:
				 m_uiGehennasAddsSpawned = uiData;
				break;
			case DATA_GARR_ADDS_SPAWNED:
				 m_uiGarrAddsSpawned = uiData;
				break;
			case DATA_SULFURON_ADDS_SPAWNED:
				 m_uiSulfuronAddsSpawned = uiData;
				break;
			case DATA_GOLEMAGG_ADDS_SPAWNED:
				 m_uiGolemaggAddsSpawned = uiData;
				break;
			case DATA_LUCIFRON_ADDS_SPAWNED:
				 m_uiLucifronAddsSpawned = uiData;
				break;

			// Ragnaros Event
			case DATA_DOMO_PORTED:
				 m_uiDomoPorted = uiData;
				break;
			case DATA_VAR_RAGNAROS_INTRO:
				 m_uiVarRagnarosIntro = uiData;
				break;

			// Runes
            case TYPE_RuneKoro:
                m_auiObject[0] = uiData;
				if (GameObject* pGo = instance->GetGameObject(m_uiRuneKoroGUID))
					pGo->SetGoState(GO_STATE_READY);
				break;
		    case TYPE_RuneZeth:
                m_auiObject[1] = uiData;
				if (GameObject* pGo = instance->GetGameObject(m_uiRuneZethGUID))
					pGo->SetGoState(GO_STATE_READY);
                break;
            case TYPE_RuneMazj:
                m_auiObject[2] = uiData;
				if (GameObject* pGo = instance->GetGameObject(m_uiRuneMazjGUID))
					pGo->SetGoState(GO_STATE_READY);
                break;
            case TYPE_RuneTheri:
                m_auiObject[3] = uiData;
				if (GameObject* pGo = instance->GetGameObject(m_uiRuneTheriGUID))
					pGo->SetGoState(GO_STATE_READY);
                break;
            case TYPE_RuneBlaz:
                m_auiObject[4] = uiData;
				if (GameObject* pGo = instance->GetGameObject(m_uiRuneBlazGUID))
					pGo->SetGoState(GO_STATE_READY);
                break;
            case TYPE_RuneKress:
                m_auiObject[5] = uiData;
				if (GameObject* pGo = instance->GetGameObject(m_uiRuneKressGUID))
                    pGo->SetGoState(GO_STATE_READY);
                break;
            case TYPE_RuneMohn:
                m_auiObject[6] = uiData;
				if (GameObject* pGo = instance->GetGameObject(m_uiRuneMohnGUID))
					pGo->SetGoState(GO_STATE_READY);
                break;
        }

		if (CanSpawnMajorDomo() == true && m_auiEncounter[8] != SPECIAL && m_uiMajorDomoGUID == 0)   
		{  
			if (Creature* pDomo = instance->GetCreature(m_uiDomoTrigger))
			{
			pDomo->SummonCreature(NPC_DOMO, 754.281, -1168.326, -118.71, 3.56, TEMPSUMMON_DEAD_DESPAWN, 600000); //MajorDomo spawn
			DoScriptText(SAY_MajorDomo_SPAWN, pDomo);
			}
		}


        if (uiData == DONE )
        {
            OUT_SAVE_INST_DATA;

            std::ostringstream saveStream;
            saveStream << m_auiEncounter[0] << " " << m_auiEncounter[1] << " " << m_auiEncounter[2] << " "
                << m_auiEncounter[3] << " " << m_auiEncounter[4] << " " << m_auiEncounter[5] << " "
                << m_auiEncounter[6] << " " << m_auiEncounter[7] << " " << m_auiEncounter[8] << " "
                << m_auiEncounter[9] << " " << m_auiObject[0] << " " << m_auiObject[1] << " "				// Runes added
				<< m_auiObject[2] << " " << m_auiObject[3] << " " << m_auiObject[4] << " "
				<< m_auiObject[5] << " " << m_auiObject[6] << " " << m_uiDomoPorted	 << " "
				<< m_uiVarRagnarosIntro << " ";

            strInstData = saveStream.str();

            SaveToDB();
            OUT_SAVE_INST_DATA_COMPLETE;
        }
    }


	bool CanSpawnMajorDomo()
	{
		return ( m_auiEncounter[0] && m_auiEncounter[1] && m_auiEncounter[2] && m_auiEncounter[3] &&
			m_auiEncounter[4] && m_auiEncounter[5] && m_auiEncounter[6] && m_auiObject[0] &&				// Runes added
			m_auiObject[1] && m_auiObject[2] && m_auiObject[3] && m_auiObject[4] && 
			m_auiObject[5] && m_auiObject[6]);
	}



    const char* Save()

	{
        return strInstData.c_str();
    }	
		
	

    uint32 GetData(uint32 uiType)
    {

        switch(uiType)
        {
            case TYPE_SULFURON:
                return m_auiEncounter[0];
            case TYPE_GEDDON:
                return m_auiEncounter[1];
            case TYPE_SHAZZRAH:
                return m_auiEncounter[2];
            case TYPE_GOLEMAGG:
                return m_auiEncounter[3];
            case TYPE_GARR:
                return m_auiEncounter[4];
            case TYPE_MAGMADAR:
                return m_auiEncounter[5];
            case TYPE_GEHENNAS:
                return m_auiEncounter[6];
            case TYPE_LUCIFRON:
                return m_auiEncounter[7];
            case TYPE_MAJORDOMO:
                return m_auiEncounter[8];
            case TYPE_RAGNAROS:
                return m_auiEncounter[9];

			// Boss Add reset
			case DATA_DOMO_ADDS_SPAWNED:
				return m_uiDomosAddsSpawned;
			case DATA_GEHENNAS_ADDS_SPAWNED:
				return m_uiGehennasAddsSpawned;
			case DATA_GARR_ADDS_SPAWNED:
				return m_uiGarrAddsSpawned;
			case DATA_SULFURON_ADDS_SPAWNED:
				 return m_uiSulfuronAddsSpawned;
			case DATA_GOLEMAGG_ADDS_SPAWNED:
				 return m_uiGolemaggAddsSpawned;
			case DATA_LUCIFRON_ADDS_SPAWNED:
				 return m_uiLucifronAddsSpawned;

			// Ragnaros Event
			case DATA_DOMO_PORTED:
				return m_uiDomoPorted;
			case DATA_VAR_RAGNAROS_INTRO:
				return m_uiVarRagnarosIntro;
	
		    // Runes
			case TYPE_RuneKoro:
                return m_auiObject[0];
		    case TYPE_RuneZeth:
                return m_auiObject[1];
            case TYPE_RuneMazj:
                return m_auiObject[2];
            case TYPE_RuneTheri:
                return m_auiObject[3];
            case TYPE_RuneBlaz:
                return m_auiObject[4];
            case TYPE_RuneKress:
                return m_auiObject[5];
            case TYPE_RuneMohn:
                return m_auiObject[6];
        }
        return 0;
    }

    uint64 GetData64(uint32 uiData)
    {
        switch(uiData)
        {
            case DATA_SULFURON:
                return m_uiSulfuronGUID;
            case DATA_GOLEMAGG:
                return m_uiGolemaggGUID;
            case DATA_GARR:
                return m_uiGarrGUID;
            case DATA_MAJORDOMO:
                return m_uiMajorDomoGUID;
        }

        return 0;
    }

    void Load(const char* chrIn)
    {
        if (!chrIn)
        {
            OUT_LOAD_INST_DATA_FAIL;
            return;
        }

        OUT_LOAD_INST_DATA(chrIn);

        std::istringstream loadStream(chrIn);

        loadStream >> m_auiEncounter[0] >> m_auiEncounter[1] >> m_auiEncounter[2] >> m_auiEncounter[3]
            >> m_auiEncounter[4] >> m_auiEncounter[5] >> m_auiEncounter[6] >> m_auiEncounter[7]
			>> m_auiEncounter[8] >> m_auiEncounter[9] >> m_auiObject[0] >> m_auiObject[1]						//Runes added
			>> m_auiObject[2] >> m_auiObject[3] >> m_auiObject[4] >> m_auiObject[5]
			>> m_auiObject[6] >> m_uiDomoPorted >> m_uiVarRagnarosIntro;

        for(uint8 i = 0; i < MAX_ENCOUNTER; ++i)
            if (m_auiEncounter[i] == IN_PROGRESS)           // Do not load an encounter as "In Progress" - reset it instead.
                m_auiEncounter[i] = NOT_STARTED;

        OUT_LOAD_INST_DATA_COMPLETE;

    }
};

InstanceData* GetInstance_instance_molten_core(Map* pMap)

{
    return new instance_molten_core(pMap);
}

CreatureAI* GetAI_CoreHoundTrigger(Creature* pCreature)
{
    return new CoreHoundTriggerAI(pCreature);
}

void AddSC_instance_molten_core()
{
    Script *newscript;

	newscript = new Script;
    newscript->Name = "go_runes_of_moltencore";
    newscript->pGOHello = &GOHello_go_runes_of_moltencore;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "instance_molten_core";
    newscript->GetInstanceData = &GetInstance_instance_molten_core;
    newscript->RegisterSelf();

	newscript = new Script;
    newscript->Name = "CoreHoundTrigger";
    newscript->GetAI = &GetAI_CoreHoundTrigger;
    newscript->RegisterSelf();
}





