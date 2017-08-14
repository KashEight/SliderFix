if not Steam then
    return
end

function doScript(script)
    local baseScript = script:lower()
    local hook_files = {
        ["core/lib/managers/menu/items/coremenuitemslider"] = CoreMenuItemSlider.lua
    }
    if hook_files[baseScript] then
        local fileName = ModPath .. "lua/" .. hook_files[baseScript]
        if io.file_is_readable(fileName) then
            log("[Info] SliderFix was successfully loaded!")
            dofile(fileName)
        else
            log("[Error] BLT could not open" .. fileName .. ".")
        end
    else
        log("[Error] Unregistered script called: " .. baseScript)
    end
end

if RequiredScript then
    doScript(RequiredScript)
end