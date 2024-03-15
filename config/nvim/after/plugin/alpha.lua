local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- set the kingscott dragon of flames
dashboard.section.header.val = {
	"                                                                                                   ",
	"                  _.-~-.                                                                           ",
	"                 7''  q..\\                                                                        ",
	"               _7         (_																	    ",
	"             _7  _/    _q.  /																	    ",
	"           _7 . ___  /vvvv-'_                                          .                           ",
	"         7/ / /~- \\_\\\\      '-._     .-'                    /        //		                    ",
	"        ./ ( /-~-/||'=.__  '::. '-~'' {             ___   /  //     ./{   _      ./{               ",
	"        v   v-~-~| ||   __''_  ':::.   ''~-~.___.-'' _/   // / {_   /  {  / }    /   \\            ",
	"       vv/-~-~-|/ \\ .'__'. '.  '::     _     _                  {_/          _   _      ''	    ",
	"      / /~~~~||vvv/ /    \\ )  \\       | |  _(_)_ __   ___    ___  ___  ___ _| |_| |_   .::'      ",
	"     / (~-~-~\\\\.-' /      \\'   \\::::. | |/  | | '_ \\/ _  \\ / __|/  __'/ _ |_   _   _|  :::'	",
	"    /..\\   /..\\__/         '     '::: |   \\ | | | | | (_) )\\ _\\   (__( ( ) )| | | |   ::'		",
	"    vvvv    vvvv                   ': |_|\\ _|_|_| |_|\\__' |____|\\___, \\___/ |_| |_|   ''		",
	"                                                     .__| |                                        ",
	"                                                      \\__/                                        ",
	"                                                                                                   ",
}

-- send config to alpha
alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd filetype alpha setlocal nofoldenable
]])
