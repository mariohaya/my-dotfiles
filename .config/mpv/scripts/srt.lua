--- Automatically loads all .srt files in directory
mp.register_event("file-loaded", function()
    local utils = require 'mp.utils'
    local path = mp.get_property("path")
    if not path then return end

    local dir = mp.get_property("working-directory")
    local files = utils.readdir(dir, "files")

    if files then
        for _, file in ipairs(files) do
            if file:match("%.srt$") then
                mp.commandv("sub-add", dir .. "/" .. file)
            end
        end
    end
end)

