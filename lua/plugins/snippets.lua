require("luasnip.loaders.from_vscode").lazy_load()
-- 仅加载指定语言
-- require("luasnip.loaders.from_vscode").load({ include = { "python" } })
-- 加载自定义目录 Snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/Users/imxieke/Code/Project/Git/vscode-snippets" } })