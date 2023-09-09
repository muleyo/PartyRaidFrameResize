PFR_Core = PFR:NewModule("PFR_Core")

function PFR_Core:OnEnable()
    function PFR:Update(self)
        if self:IsForbidden() then return end
        if InCombatLockdown() then return end
        local name = self:GetName()

        if name and name:match("^CompactPartyFrameMember") then
            self:SetWidth(PFR_DB.width)
            self:SetHeight(PFR_DB.height)
            self.statusText:ClearAllPoints()
            self.statusText:SetPoint("CENTER", self, "CENTER")
            self.centerStatusIcon:ClearAllPoints()
            self.centerStatusIcon:SetPoint("CENTER", self, "CENTER")
        elseif name and name:match("^CompactPartyFramePet") then
            self:SetWidth(PFR_DB.width)
        end
    end

    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
    eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
    eventFrame:SetScript("OnEvent", function(_, event)
        local partyFrames = {
            CompactPartyFrameMember1,
            CompactPartyFrameMember2,
            CompactPartyFrameMember3,
            CompactPartyFrameMember4,
            CompactPartyFrameMember5
        }

        if event == "PLAYER_REGEN_DISABLED" then
            CompactPartyFrame:UnregisterEvent("GROUP_ROSTER_UPDATE")
            for i = 1, #partyFrames do
                partyFrames[i]:UnregisterEvent("UNIT_PET")
            end
        else
            CompactPartyFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
            for i = 1, #partyFrames do
                partyFrames[i]:RegisterEvent("UNIT_PET")
                PFR:Update(partyFrames[i])
            end
        end
    end)

    hooksecurefunc("CompactUnitFrame_UpdateAll", function(self)
        PFR:Update(self)
    end)
end
