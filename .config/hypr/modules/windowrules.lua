hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name = "vesktop-special-workspace",
    match = {
        class = "^(vesktop|Vesktop)$",
    },
    workspace = "special:communicate",
})

hl.window_rule({
    name = "obs-special-workspace",
    match = {
        class = "^(com.obsproject.Studio|obs)$",
    },
    workspace = "special:record",
})

hl.window_rule({
    name = "tauon-special-workspace",
    match = {
        class = "^tauonmb$",
    },
    workspace = "special:music",
})

for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "HDMI-A-1",
    })

    hl.workspace_rule({
        workspace = tostring(i + 10),
        monitor = "DP-3",
    })
end
