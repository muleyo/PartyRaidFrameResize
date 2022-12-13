PFR_Core = PFR:NewModule("PFR_Core")

function PFR_Core:OnEnable()
    function PFR:Update(self)
        if self:IsForbidden() then return end
		local name = self:GetName()

        if name and name:match("CompactPartyFrame") then
            self:SetWidth(PFR_DB.width)
            self:SetHeight(PFR_DB.height)
            self.statusText:ClearAllPoints()
            self.statusText:SetPoint("CENTER", self, "CENTER")
            self.centerStatusIcon:ClearAllPoints()
            self.centerStatusIcon:SetPoint("CENTER", self, "CENTER")
        end
    end

    hooksecurefunc("CompactUnitFrame_UpdateAll", function(self)
        PFR:Update(self)
    end)
end