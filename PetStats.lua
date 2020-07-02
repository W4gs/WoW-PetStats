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
    local petArBase, petArEffArmor, petArArmor, petArPos = UnitArmor("pet");
    
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
    
    if (UnitExists("pet")) then
        tblPetStats = { }
        tblPetStats["AttackSpeed"] = select(1, UnitAttackSpeed("pet"));
        tblPetStats["AttackPower"] = petApBase + petApPos + petApNeg;
        tblPetStats["AttackLowDamage"] = ((petAdLow + petAdPos + petAdNeg) * petAdPerc);
        tblPetStats["AttackHighDamage"] = ((petAdHigh + petAdPos + petAdNeg) * petAdPerc);
        tblPetStats["PetBaseArmor"] = petArBase + petArPos;
        tblPetStats["PetNowArmor"] = petArEffArmor + petArPos;
    end
end

-- Do not remove this comment, it is part of this trigger: PetStatsHunter
function()
    local RetVal = "";

    if (UnitExists("pet") and tblPetStats) then
        RetVal = "Pet Stats:\n"
        RetVal = RetVal .. "\n";
        RetVal = RetVal .. "Offensive Stats:\n";
        RetVal = RetVal .. "Attack Speed: " .. format("%.2f", tblPetStats["AttackSpeed"]) .. "\n";
        RetVal = RetVal .. "Attack Power: " .. format("%.0f", tblPetStats["AttackPower"]) .. "\n";
        RetVal = RetVal .. "Attack Damage: " .. format("%.0f", tblPetStats["AttackLowDamage"]) .. " - " .. format("%.0f", tblPetStats["AttackHighDamage"]) .. "\n";
        RetVal = RetVal .. "\n";
        RetVal = RetVal .. "Defensive Stats:\n";
        RetVal = RetVal .. "Armor: " .. format("%.0f", tblPetStats["PetNowArmor"]) .. "\n";
    else
        RetVal = "";
    end
    
    WeakAuras.PetStatsPreviousGlobalResult = RetVal;
    
    return RetVal;
end
