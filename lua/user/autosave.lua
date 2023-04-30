local status_ok, autosave = pcall(require, "/home/yyo/.config/nvim/lua/user/autosave")
-- local status_ok, autosave = pcall(require, "autosave")
if not status_ok then
    -- vim.notify("autosave not found!")
    return
end

local M = {}
autosave.setup({
    enabled = true,
    -- execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
    execution_message = "",
    events = {
        "InsertLeave",
        "TextChanged",
    },
    conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 0,
    debounce_delay = 135
})

return M
