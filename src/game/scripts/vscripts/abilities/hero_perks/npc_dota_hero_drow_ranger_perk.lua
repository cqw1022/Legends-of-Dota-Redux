--------------------------------------------------------------------------------------------------------
--
--		Hero: Drow Ranger
--		Perk: Gust also disarms enemies when cast by Drow Ranger. 
--
--------------------------------------------------------------------------------------------------------
LinkLuaModifier( "modifier_npc_dota_hero_drow_ranger_perk", "abilities/hero_perks/npc_dota_hero_drow_ranger_perk.lua" ,LUA_MODIFIER_MOTION_NONE )
--------------------------------------------------------------------------------------------------------
if npc_dota_hero_drow_ranger_perk == nil then npc_dota_hero_drow_ranger_perk = class({}) end
--------------------------------------------------------------------------------------------------------
--		Modifier: modifier_npc_dota_hero_drow_ranger_perk				
--------------------------------------------------------------------------------------------------------
if modifier_npc_dota_hero_drow_ranger_perk == nil then modifier_npc_dota_hero_drow_ranger_perk = class({}) end
--------------------------------------------------------------------------------------------------------
function modifier_npc_dota_hero_drow_ranger_perk:IsPassive()
	return true
end
--------------------------------------------------------------------------------------------------------
function modifier_npc_dota_hero_drow_ranger_perk:IsHidden()
	return true
end
--------------------------------------------------------------------------------------------------------
-- Add additional functions
--------------------------------------------------------------------------------------------------------
function perkDrowRanger(filterTable)
  local parent_index = filterTable["entindex_parent_const"]
  local caster_index = filterTable["entindex_caster_const"]
  local ability_index = filterTable["entindex_ability_const"]
  if not parent_index or not caster_index or not ability_index then
    return true
  end
  local parent = EntIndexToHScript( parent_index )
  local caster = EntIndexToHScript( caster_index )
  local ability = EntIndexToHScript( ability_index )
  if ability then
    if caster:HasModifier("modifier_npc_dota_hero_drow_ranger_perk") then
      if ability:GetName() == "drow_ranger_wave_of_silence" then
        local modifierDuration = filterTable["duration"]
        parent:AddNewModifier(caster,ability,"modifier_disarmed",{duration = modifierDuration})
      end
    end  
  end
end
