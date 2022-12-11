PFR_Core = PFR:NewModule("PFR_Core")

function PFR_Core:OnEnable()
    function PFR:Update()
        for i = 1, 5 do
            _G["CompactPartyFrameMember" .. i]:SetWidth(PFR_DB.width)
            _G["CompactPartyFrameMember" .. i]:SetHeight(PFR_DB.height)
            _G["CompactPartyFrameMember" .. i .. "StatusText"]:ClearAllPoints()
            _G["CompactPartyFrameMember" .. i .. "StatusText"]:SetPoint("CENTER", _G["CompactPartyFrameMember" .. i], "CENTER")
            _G["CompactPartyFrameMember" .. i .. "CenterStatusIcon"]:ClearAllPoints()
            _G["CompactPartyFrameMember" .. i .. "CenterStatusIcon"]:SetPoint("CENTER", _G["CompactPartyFrameMember" .. i], "CENTER")
        end
    end

    -- Register Events
    PFR:RegisterEvent("ADDON_LOADED", "Update")
    PFR:RegisterEvent("PLAYER_LOGIN", "Update")
    PFR:RegisterEvent("VARIABLES_LOADED", "Update")
    PFR:RegisterEvent("PLAYER_ENTERING_WORLD", "Update")
    PFR:RegisterEvent("GROUP_ROSTER_UPDATE", "Update")
    PFR:RegisterEvent("COMPACT_UNIT_FRAME_PROFILES_LOADED", "Update")

    -- Call function on exiting EditMode
    hooksecurefunc(C_EditMode, "OnEditModeExit", function()
        PFR:Update()
    end)
end