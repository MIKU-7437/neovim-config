return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            disable_filetype = {"TelescopePrompt", "vim"},
			check_ts = false,
            ts_config = {
                lua = {"string", "comment"}, --lua
            },
			-- disable_in_macro = true  -- disable when recording or executing a macro
			-- disable_in_visualblock = false -- disable when insert after visual block mode
			-- disable_in_replace_mode = true
			-- ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=]
			-- enable_moveright = true
			-- enable_afterquote = true  -- add bracket pairs after quote
			-- enable_check_bracket_line = true  --- check bracket in same line
			-- enable_bracket_in_quote = true --
			-- enable_abbr = false -- trigger abbreviation
			-- break_undo = true -- switch for basic rule break undo sequence
			-- map_cr = true
			-- map_bs = true  -- map the <BS> key
			-- map_c_h = false  -- Map the <C-h> key to delete a pair
			-- map_c_w = false -- map <c-w> to delete a pair if possible
        })
        local npairs = require('nvim-autopairs')
        local rule = require('nvim-autopairs.rule')
        local ts_conds = require('nvim-autopairs.ts-conds')

        npairs.add_rules({
            rule("{", "},", "lua")
                :with_pair(ts_conds.is_ts_node({"block", "table_constructor"})),
            rule("'", "',", "lua")
                :with_pair(ts_conds.is_ts_node({"block", "table_constructor"})),
            rule('"', '",', "lua")
                :with_pair(ts_conds.is_ts_node({"block", "table_constructor"})),
        })
    end,
}
