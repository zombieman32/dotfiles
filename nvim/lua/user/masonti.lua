local status_ok, masonti = pcall(require, 'mason-tool-installer')
if not status_ok then
    return
end

masonti.setup({
    ensure_installed = {
        'lua_ls',
        'cssls',
        'html',
        'tsserver',
        'pyright',
        'jsonls',
        'angularls',
        'asm_lsp',
        'clangd',
        'clojure_lsp',
        'dockerls',
        'hls',
        'jdtls',
        'kotlin_language_server',
        'ltex',
        'ruby_lsp',
        'rust_analyzer',
        'sqlls',
        'emmet_ls',
        'graphql',
        'svelte',
        'terraformls',
        'volar',
        'yamlls',
        'taplo',
        'csharp_ls',
        'elixirls',
    },
    auto_update = true,
})
