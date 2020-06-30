-- Do not remove this comment, it is part of this trigger: ClassicGlobal
function()
    if not (WeakAuras.PetStatsNextGlobalUpdate) then
        WeakAuras.PetStatsNextGlobalUpdate = time() + 1;
        WeakAuras.PetStatsPreviousGlobalResult = "Waiting for Update!";
        return WeakAuras.CCSPreviousGlobalResult;
    end
    
    if (time() > WeakAuras.PetStatsNextGlobalUpdate) then
        WeakAuras.PetStatsNextGlobalUpdate = time() + 1;
    else
        return "";
    end
    
    local petApBase, petApPos, petApNeg = UnitAttackPower("pet");
    local petAdLow, petAdHigh, _, _, petAdPos, petAdNeg, petAdPerc = UnitDamage("pet");
    
    tblPlayerStats = { }
    tblPlayerStats["ID"] = classID;
    tblPlayerStats["Class"] = playerClass;
    
    tblPetStats = { }
    tblPetStats["AttackSpeed"] = select(1, UnitAttackSpeed("pet"));
    tblPetStats["AttackPower"] = petApBase + petApPos + petApNeg;
    tblPetStats["AttackDamage"] = UnitDamage("pet");
    tblPetStats["PetInRange"] = UnitInRange("pet");
    tblPetStats["PetArmor"] = UnitArmor("pet");
    
end
