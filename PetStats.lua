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
end
