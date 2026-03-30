---@class ClangdInitializeResult: lsp.InitializeResult
---@field offsetEncoding? string

---@type vim.lsp.Config
return {
    cmd = {
        "clangd.exe",
        "--background-index",
        "--pch-storage=memory",
        "--header-insertion=never",
        "-j=4",
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    root_markers = {
        ".clangd",
        "compile_flags.txt",
        "compile_commands.json",
    },
    capabilities = {
        textDocument = {
            completion = {
                editsNearCursor = true,
            },
        },
        offsetEncoding = { "utf-8", "utf-16" },
    },
    ---@param init_result ClangdInitializeResult
    on_init = function(client, init_result)
        if init_result.offsetEncoding then
            client.offset_encoding = init_result.offsetEncoding
        end
    end,
    on_attach = function(client, bufnr)
        -- This should hopefully disable all clangd warnings/errors but keep syntax highlighting and completion
        if client.name == "clangd" then
            client.handlers["textDocument/publishDiagnostics"] = function() end
        end
    end,
}
