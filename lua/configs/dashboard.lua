require('dashboard').setup({
    theme = 'hyper',
    config = {
        week_header = {
            enable = true,
        },
        project = {
            enable = false,
        },
        packages = {
            enable = false,
        },
        change_to_vcs_root = true,
        shortcut = {
            {
                desc = '󰏓 Recent Projects',
                group = 'DiagnosticHint',
                action = 'Telescope projects',
                key = 'r',
            }
        },
    },
})
