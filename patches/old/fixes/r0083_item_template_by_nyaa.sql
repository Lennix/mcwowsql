/* disenchanting possible with any lvl item, atm using 2.x version; fix to work for 1.12 */
update item_template set RequiredDisenchantSkill=1 where RequiredDisenchantSkill > 0;