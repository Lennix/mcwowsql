/* add Encounter set to done,in_progress and fail to Kirtonos the Herald EventAI */
INSERT INTO creature_ai_scripts (id,creature_id,event_type,event_inverse_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action1_type,action1_param1,action1_param2,action1_param3,COMMENT) VALUES
(1050612,10506,6,0,100,2,0,0,0,0,34,8,3,0,'Kirtonos the Herald - Set Encounter to Done');
UPDATE creature_ai_scripts SET action3_type=34,action3_param1=8,action3_param2=1 WHERE id=1050601 AND creature_id=10506;
UPDATE creature_ai_scripts SET action2_type=34,action2_param1=8,action2_param2=2 WHERE id=1050611 AND creature_id=10506;