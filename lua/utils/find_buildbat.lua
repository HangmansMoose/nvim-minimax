local M = {}

-- Search upwards for build.bat from current buffer's directory
local function search_upwards_for(file, start_dir)
    local uv = vim.loop
    local function exists(path)
        local stat = uv.fs_stat(path)
        return stat ~= nil
    end

    local dir = start_dir
    while dir do
        local candidate = dir .. "/" .. file
        if exists(candidate) then
            return candidate
        end
        local parent = vim.fs.dirname(dir)
        if parent == dir then
            break
        end
        dir = parent
    end
    return nil
end

function M.find_buildbat()
    local cwd = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
    return search_upwards_for("build.bat", cwd)
end

return M
