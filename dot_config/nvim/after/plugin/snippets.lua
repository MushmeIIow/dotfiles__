local ls = require 'luasnip'

local s, i, t = ls.s, ls.insert_node, ls.text_node
local fmt = require 'luasnip.extras.fmt'.fmt
local rep = require 'luasnip.extras'.rep
local snips = require("go.snips")
local c = ls.choice_node

local snippets = {
	s("ife",
		fmt([[
	        if {} != nil {{
	            return {}
	        }}{}
	        ]],
			{
				i(1, "err"),
				c(2, {
					t("err"),
					t(""),
				}),
				i(0)
			}
		)
	)
}

ls.add_snippets('all', snippets)
