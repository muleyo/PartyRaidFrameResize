PFR = LibStub("AceAddon-3.0"):NewAddon("PFR", "AceEvent-3.0", "AceConsole-3.0")

function PFR:OnInitialize()
    -- Database Default profile
    local defaults = {
        profile = {
          width = 144,
          height = 72
        }
    }

    -- Register Database
    self.db = LibStub("AceDB-3.0"):New("PFRDB", defaults, true)

    -- Assign DB to a global variable
    PFR_DB = self.db.profile
end