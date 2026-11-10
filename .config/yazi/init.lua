-- ~/.config/yazi/init.lua (Yazi 26.9.1)
-- If you already have init.lua, append this function after other UI setup.
-- Keep Yazi's existing icon glyphs, but inherit the filename's row style.
function Entity:icon()
    local icon = th.icon:match(self._file, { hovered = self._file.is_hovered })
    return icon and (icon.text .. " ") or ""
end
