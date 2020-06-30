-- Do not remove this comment, it is part of this trigger: PetStatsGlobal
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
    local petArBase, petArEffArmor, petArArmor, petArPos, petArNeg = UnitArmor("pet");
    
    -- Holds various colors used by the scripts
    tblColors = { }
    tblColors["Red"] = "|cFFFF0000";
    tblColors["Yellow"] = "|cFFFFFF00";
    tblColors["Green"] = "|cFF00FF00";
    tblColors["Blue"] = "|cFF00D1FF";
    tblColors["Purple"] = "|cFFC942FD";
    tblColors["Shadow"] = "|cFFaa00ff";
    
    tblPlayerStats = { }
    tblPlayerStats["ID"] = classID;
    tblPlayerStats["Class"] = playerClass;
    
    tblPetStats = { }
    tblPetStats["AttackSpeed"] = select(1, UnitAttackSpeed("pet"));
    tblPetStats["AttackPower"] = petApBase + petApPos + petApNeg;
    tblPetStats["AttackLowDamage"] = ((petAdLow + petAdPos + petAdNeg) * petAdPerc);
    tblPetStats["AttackHighDamage"] = ((petAdHigh + petAdPos + petAdNeg) * petAdPerc);
    tblPetStats["PetInRange"] = UnitInRange("pet");
    tblPetStats["PetBaseArmor"] = petArBase + petArPos + petArNeg;
    tblPetStats["PetNowArmor"] = petArEffArmor + petArPos + petArNeg;
end

-- Do not remove this comment, it is part of this trigger: PetStatsHunter
function()
    
end
