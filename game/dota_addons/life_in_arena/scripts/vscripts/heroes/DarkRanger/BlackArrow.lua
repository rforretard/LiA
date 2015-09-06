function AddModifier(event)
	local target = event.target
	if not target:IsBuilding() --сколько проверок то
	and not target:IsMechanical() 
	and not target:IsHero() 
	and not target:IsIllusion() 
	and not target:HasModifier("modifier_kill")
	and not string.find(target:GetName(),"megaboss") then 
		event.ability:ApplyDataDrivenModifier(event.caster, target, "modifier_dark_ranger_black_arrow_spawn", nil)
	end

end

function BlackArrow(event)
	local target = event.unit
	local caster = event.caster
	local lifetime = event.ability:GetSpecialValueFor("lifetime")

	local creep = CreateUnitByName(target:GetUnitName(), target:GetAbsOrigin(), false, caster, caster, caster:GetTeamNumber())
	creep:SetControllableByPlayer(caster:GetPlayerID(), true)
	creep:AddNewModifier(caster, event.ability, "modifier_kill", {duration = lifetime})
	creep:MakeIllusion()
end

function SpendMana(event)
	local caster = event.caster
	local ability = event.ability
	local mana = ability:GetSpecialValueFor("mana")
	if not caster:HasModifier("dark_ranger_fury") then
		caster:SpendMana(mana, ability)
	end
end