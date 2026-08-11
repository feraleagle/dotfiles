return {
    {
        "stevearc/aerial.nvim",
        opts = function(_, opts)
            -- Auto-open aerial symbols sidebar on supported filetypes
            opts.open_automatic = true

            -- Optional: auto-close aerial if it's the last window remaining
            opts.close_automatic_events = { "unsupported" }

            return opts
        end,
    },
}
