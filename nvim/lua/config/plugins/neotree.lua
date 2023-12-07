-- vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
-- vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
-- vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
-- vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵 ", texthl = "DiagnosticSignHint" })
--
-- -- something to concider 
-- -- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#find-with-telescope
--
-- return {
--   {
--     "nvim-neo-tree/neo-tree.nvim",
--     lazy = true,
--     version = "*",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--       "MunifTanjim/nui.nvim",
--       {
--         -- only needed if you want to use the commands with "_with_window_picker" suffix
--         "s1n7ax/nvim-window-picker",
--         config = function()
--           require("window-picker").setup {
--             hint = "floating-big-letter",
--             picker_config = {
--               use_winbar = "always", -- "always" | "never" | "smart"
--             },
--             autoselect_one = true,
--             include_current = false,
--             floating_big_letter = {
--               font = "ansi-shadow", -- ansi-shadow |
--             },
--             filter_rules = {
--               -- filter using buffer options
--               bo = {
--                 -- if the file type is one of following, the window will be ignored
--                 filetype = { "NvimTree", "neo-tree","neo-tree-popup", "notify", "qf" },
--
--                 -- if the buffer type is one of following, the window will be ignored
--                 buftype = { "terminal", "quickfix" },
--               },
--             },
--             other_win_hl_color = "#006400",
--           }
--         end,
--       },
--     },
--     config = function()
--       require("neo-tree").setup {
--         source_selector = {
--           winbar = true,
--           statusline = false,
--         },
--         filesystem = {
--           follow_current_file = { enabled = true },
--         },
--         window = {
--           position = "left",
--           width = 40,
--           mapping_options = {
--             noremap = true,
--             nowait = true,
--           },
--           mappings = {
--             ["<space>"] = {
--               "toggle_node",
--               nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
--             },
--             ["<2-LeftMouse>"] = "open",
--             ["<cr>"] = "open",
--             ["<esc>"] = "revert_preview",
--             -- ["l"] = "focus_preview",
--             -- ["S"] = "open_split",
--             -- ["s"] = "open_vsplit",
--             ["S"] = "split_with_window_picker",
--             ["s"] = "vsplit_with_window_picker",
--             ["t"] = "open_tabnew",
--             -- ["<cr>"] = "open_drop",
--             -- ["t"] = "open_tab_drop",
--             ["w"] = "open",
--             -- ["P"] = { "toggle_preview", config = { use_float = true } },
--             ["<C-p>"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
--             ["C"] = "close_node",
--             -- ['C'] = 'close_all_subnodes',
--             ["z"] = "close_all_nodes",
--             --["Z"] = "expand_all_nodes",
--             ["a"] = {
--               "add",
--               -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
--               -- some commands may take optional config options, see `:h neo-tree-mappings` for details
--               config = {
--                 show_path = "none", -- "none", "relative", "absolute"
--               },
--             },
--             ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
--             ["d"] = "delete",
--             ["r"] = "rename",
--             ["y"] = "copy_to_clipboard",
--             ["x"] = "cut_to_clipboard",
--             ["p"] = "paste_from_clipboard",
--             ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
--             -- ["c"] = {
--             --  "copy",
--             --  config = {
--             --    show_path = "none" -- "none", "relative", "absolute"
--             --  }
--             --}
--             ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
--             ["q"] = "close_window",
--             ["R"] = "refresh",
--             ["?"] = "show_help",
--             ["<"] = "prev_source",
--             [">"] = "next_source",
--             ["h"] = function(state)
--               local node = state.tree:get_node()
--               if node.type == "directory" and node:is_expanded() then
--                 require("neo-tree.sources.filesystem").toggle_directory(state, node)
--               else
--                 require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
--               end
--             end,
--             ["l"] = function(state)
--               local node = state.tree:get_node()
--               if node.type == "directory" then
--                 if not node:is_expanded() then
--                   require("neo-tree.sources.filesystem").toggle_directory(state, node)
--                 elseif node:has_children() then
--                   require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
--                 end
--               end
--             end,
--           },
--         },
--       }
--     end,
--   },
-- }
return {}
