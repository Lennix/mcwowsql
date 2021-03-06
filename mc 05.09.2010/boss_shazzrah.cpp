/* Copyright (C) 2010 Marvin Cordes

/* ScriptData
SDName: Boss_Shazzrah
SD%Complete: 100%
SDComment: need test
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "molten_core.h"

enum
{
    SPELL_ARCANEEXPLOSION           = 19712,
    SPELL_SHAZZRAHCURSE             = 19713,
    SPELL_DEADENMAGIC               = 19714,
    SPELL_COUNTERSPELL              = 19715,
    SPELL_GATE_DUMMY                = 23138                 // effect spell: 23139
};

struct MANGOS_DLL_DECL boss_shazzrahAI : public ScriptedAI
{
    boss_shazzrahAI(Creature* pCreature) : ScriptedAI(pCreature) 
	{
		m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
		Reset();
	}

	ScriptedInstance* m_pInstance;

    uint32 ArcaneExplosion_Timer;
    uint32 ShazzrahCurse_Timer;
    uint32 DeadenMagic_Timer;
    uint32 Countspell_Timer;
    uint32 Blink_Timer;

    void Reset()
    {
        ArcaneExplosion_Timer = 6000;                       //These times are probably wrong
        ShazzrahCurse_Timer = 10000;
        DeadenMagic_Timer = 24000;
        Countspell_Timer = 15000;
        Blink_Timer = 30000;
    }

	
	void JustDied(Unit* pKiller)							// instance_molten_core
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SHAZZRAH, DONE);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        //ArcaneExplosion_Timer
        if (ArcaneExplosion_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(),SPELL_ARCANEEXPLOSION);
            ArcaneExplosion_Timer = urand(5000, 9000);
        }else ArcaneExplosion_Timer -= diff;

        //ShazzrahCurse_Timer
        if (ShazzrahCurse_Timer < diff)
        {
            Unit* target = NULL;
            target = SelectUnit(SELECT_TARGET_RANDOM,0);
            if (target) DoCastSpellIfCan(target,SPELL_SHAZZRAHCURSE);

            ShazzrahCurse_Timer = urand(25000, 30000);
        }else ShazzrahCurse_Timer -= diff;

        //DeadenMagic_Timer
        if (DeadenMagic_Timer < diff)
        {
            DoCastSpellIfCan(m_creature,SPELL_DEADENMAGIC);
            DeadenMagic_Timer = 35000;
        }else DeadenMagic_Timer -= diff;

        //Countspell_Timer
        if (Countspell_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(),SPELL_COUNTERSPELL);
            Countspell_Timer = urand(16000, 20000);
        }else Countspell_Timer -= diff;

        //Blink_Timer
        if (Blink_Timer < diff)
        {
            // Teleporting him to a random gamer and casting Arcane Explosion after that.
            DoCastSpellIfCan(m_creature, SPELL_GATE_DUMMY, CAST_TRIGGERED);

            // manual, until added effect of dummy properly
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,1))
                m_creature->NearTeleportTo(pTarget->GetPositionX(), pTarget->GetPositionY(), pTarget->GetPositionZ(), m_creature->GetOrientation());

            DoCastSpellIfCan(m_creature, SPELL_ARCANEEXPLOSION);

            DoResetThreat();

            Blink_Timer = 45000;
        }else Blink_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_boss_shazzrah(Creature* pCreature)
{
    return new boss_shazzrahAI(pCreature);
}

void AddSC_boss_shazzrah()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_shazzrah";
    newscript->GetAI = &GetAI_boss_shazzrah;
    newscript->RegisterSelf();
}
