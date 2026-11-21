
local function move_all(workspace)
    return function()
        local current = hl.get_active_workspace()
        if not current then return end

        -- Detect current monitor's workspace range
        local offset = current.id >= 11 and 10 or 0

        local target

        if workspace == "e+1" then
            target = current.id + 1

        elseif workspace == "e-1" then
            target = current.id - 1

        else
            target = tonumber(workspace)
            if not target then return end

            target = target + offset
        end

        -- Keep workspace inside current monitor's range
        if target < offset + 1
            or target > offset + 10
            or target == current.id then
            return
        end

        -- Get all windows from current workspace
        local windows = hl.get_windows({
            workspace = current
        })

        -- Move all windows to target workspace
        for _, window in ipairs(windows) do
            hl.dispatch(hl.dsp.window.move({
                window = window,
                workspace = target,
                follow = true,
            }))
        end
    end
end

return move_all
