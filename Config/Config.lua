local PFR_Config = PFR:NewModule("PFR_Config")

function PFR_Config:OnEnable()
    local LSM = LibStub("LibSharedMedia-3.0")

    -- Create Menu
    local options = {
        type = 'group',
        args = {
            moreoptions={
                name = 'General',
                type = 'group',
                childGroups = "tab",
                args={
                    generalHeader = {
                        type = 'header',
                        name = 'Height & Width',
                        order = 1
                    },
                    height = {
                        type = 'range',
                        order = 2,
                        name = 'Height',
                        desc = 'Adjust the Frame height',
                        width = 'full',
                        min = 72,
                        max = 300,
                        step = 0.1,
                        set = function(_, val)
                            PFR:Update()
                            PFR_DB.height = val
                        end,
                        get = function()
                            return PFR_DB.height
                        end
                    },
                    width = {
                        type = 'range',
                        order = 3,
                        name = 'Width',
                        desc = 'Adjust the Frame height',
                        width = 'full',
                        min = 72,
                        max = 300,
                        step = 0.1,
                        set = function(_, val)
                            PFR:Update()
                            PFR_DB.width = val
                        end,
                        get = function()
                            return PFR_DB.width
                        end
                    }
                }
            }
        }
    }

    -- Register Menu
    LibStub('AceConfig-3.0'):RegisterOptionsTable('Party Raidframe Resize', options)
    local PFR_Config = LibStub('AceConfigDialog-3.0'):AddToBlizOptions('Party Raidframe Resize')

    -- Slash Command Function
    function SlashCommand(msg)
        InterfaceOptionsFrame_OpenToCategory(PFR_Config)
    end

    -- Register Slash Command
    PFR:RegisterChatCommand('PFR', SlashCommand)
end