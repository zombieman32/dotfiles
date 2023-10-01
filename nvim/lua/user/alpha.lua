local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local splashes = {{
[[  ______                      _       _                              _   _ ]],
[[ |___  /                     | |     (_)                            | \ | |]],
[[    / /    ___    _ __ ___   | |__    _    ___   _ __ ___     __ _  |  \| |]],
[[   / /    / _ \  | '_ ` _ \  | '_ \  | |  / _ \ | '_ ` _ \   / _` | | . ` |]],
[[  / /__  | (_) | | | | | | | | |_) | | | |  __/ | | | | | | | (_| | | |\  |]],
[[ /_____|  \___/  |_| |_| |_| |_.__/  |_|  \___| |_| |_| |_|  \__,_| |_| \_|]],
},
{
[[ ____  _____  __  __  ____  ____  ____  __  __    __    _  _ ]],
[[(_   )(  _  )(  \/  )(  _ \(_  _)( ___)(  \/  )  /__\  ( \( )]],
[[ / /_  )(_)(  )    (  ) _ < _)(_  )__)  )    (  /(__)\  )  ( ]],
[[(____)(_____)(_/\/\_)(____/(____)(____)(_/\/\_)(__)(__)(_)\_)]],
},
{[[                _,.---._              ___                    .=-.-.       ,----.           ___      ,---.       .-._         ]],
[[  ,--,----.   ,-.' , -  `.     .-._ .'=.'\      _..---.     /==/_ /    ,-.--` , \   .-._ .'=.'\   .--.'  \     /==/ \  .-._  ]],
[[ /==/` - ./  /==/_,  ,  - \   /==/ \|==|  |   .' .'.-. \   |==|, |    |==|-  _.-`  /==/ \|==|  |  \==\-/\ \    |==|, \/ /, / ]],
[[ `--`=/. /  |==|   .=.     |  |==|,|  / - |  /==/- '=' /   |==|  |    |==|   `.-.  |==|,|  / - |  /==/-|_\ |   |==|-  \|  |  ]],
[[  /==/- /   |==|_ : ;=:  - |  |==|  \/  , |  |==|-,   '    |==|- |   /==/_ ,    /  |==|  \/  , |  \==\,   - \  |==| ,  | -|  ]],
[[ /==/- /-.  |==| , '='     |  |==|- ,   _ |  |==|  .=. \   |==| ,|   |==|    .-'   |==|- ,   _ |  /==/ -   ,|  |==| -   _ |  ]],
[[/==/, `--`\  \==\ -    ,_ /   |==| _ /\   |  /==/- '=' ,|  |==|- |   |==|_  ,`-._  |==| _ /\   | /==/-  /\ - \ |==|  /\ , |  ]],
[[\==\-  -, |   '.='. -   .'    /==/  / / , / |==|   -   /   /==/. /   /==/ ,     /  /==/  / / , / \==\ _.\=\.-' /==/, | |- |  ]],
[[ `--`.-.--`     `--`--''      `--`./  `--`  `-._`.___,'    `--`-`    `--`-----``   `--`./  `--`   `--`         `--`./  `--`  ]],
},
{
[[ ______                   _      _                          _   _ ]],
[[|___  /                  | |    (_)                        | \ | |]],
[[   / /   ___   _ __ ___  | |__   _   ___  _ __ ___    __ _ |  \| |]],
[[  / /   / _ \ | '_ ` _ \ | '_ \ | | / _ \| '_ ` _ \  / _` || . ` |]],
[[./ /___| (_) || | | | | || |_) || ||  __/| | | | | || (_| || |\  |]],
[[\_____/ \___/ |_| |_| |_||_.__/ |_| \___||_| |_| |_| \__,_|\_| \_/]],
},
{
[[ _______  _______  _______  ______  _________ _______  _______  _______  _       ]],
[[/ ___   )(  ___  )(       )(  ___ \ \__   __/(  ____ \(       )(  ___  )( (    /|]],
[[\/   )  || (   ) || () () || (   ) )   ) (   | (    \/| () () || (   ) ||  \  ( |]],
[[    /   )| |   | || || || || (__/ /    | |   | (__    | || || || (___) ||   \ | |]],
[[   /   / | |   | || |(_)| ||  __ (     | |   |  __)   | |(_)| ||  ___  || (\ \) |]],
[[  /   /  | |   | || |   | || (  \ \    | |   | (      | |   | || (   ) || | \   |]],
[[ /   (_/\| (___) || )   ( || )___) )___) (___| (____/\| )   ( || )   ( || )  \  |]],
[[(_______/(_______)|/     \||/ \___/ \_______/(_______/|/     \||/     \||/    )_)]],
},
{
[[    )                                                        )  ]],
[[ ( /(                     )                               ( /(  ]],
[[ )\())           )     ( /(   (      (       )        )   )\()) ]],
[[((_)\    (      (      )\())  )\    ))\     (      ( /(  ((_)\  ]],
[[ _((_)   )\     )\  ' ((_)\  ((_)  /((_)    )\  '  )(_))  _((_) ]],
[[|_  /   ((_)  _((_))  | |(_)  (_) (_))    _((_))  ((_)_  | \| | ]],
[[ / /   / _ \ | '  \() | '_ \  | | / -_)  | '  \() / _` | | .` | ]],
[[/___|  \___/ |_|_|_|  |_.__/  |_| \___|  |_|_|_|  \__,_| |_|\_| ]],
},
{
[[  ____..--'     ,-----.     ,---.    ,---.  _______    .-./`)      .-''-.   ,---.    ,---.    ____     ,---.   .--. ]],
[[ |        |   .'  .-,  '.   |    \  /    | \  ____  \  \ .-.')   .'_ _   \  |    \  /    |  .'  __ `.  |    \  |  | ]],
[[ |   .-'  '  / ,-.|  \ _ \  |  ,  \/  ,  | | |    \ |  / `-' \  / ( ` )   ' |  ,  \/  ,  | /   '  \  \ |  ,  \ |  | ]],
[[ |.-'.'   / ;  \  '_ /  | : |  |\_   /|  | | |____/ /   `-'`"` . (_ o _)  | |  |\_   /|  | |___|  /  | |  |\_ \|  | ]],
[[    /   _/  |  _`,/ \ _/  | |  _( )_/ |  | |   _ _ '.   .---.  |  (_,_)___| |  _( )_/ |  |    _.-`   | |  _( )_\  | ]],
[[  .'._( )_  : (  '\_/ \   ; | (_ o _) |  | |  ( ' )  \  |   |  '  \   .---. | (_ o _) |  | .'   _    | | (_ o _)  | ]],
[[.'  (_'o._)  \ `"/  \  ) /  |  (_,_)  |  | | (_{;}_) |  |   |   \  `-'    / |  (_,_)  |  | |  _( )_  | |  (_,_)\  | ]],
[[|    (_,_)|   '. \_/``".'   |  |      |  | |  (_,_)  /  |   |    \       /  |  |      |  | \ (_ o _) / |  |    |  | ]],
[[|_________|     '-----'     '--'      '--' /_______.'   '---'     `'-..-'   '--'      '--'  '.(_,_).'  '--'    '--' ]],
},
{
[[ ____   __   _  _  ____   __   ____  _  _   __   __ _ ]],
[[(__  ) /  \ ( \/ )(  _ \ (  ) (  __)( \/ ) / _\ (  ( \]],
[[ / _/ (  O )/ \/ \ ) _ (  )(   ) _) / \/ \/    \/    /]],
[[(____) \__/ \_)(_/(____/ (__) (____)\_)(_/\_/\_/\_)__)]],
},
{
[[__________                 ___.    .__                           _______   ]],
[[\____    /  ____    _____  \_ |__  |__|  ____    _____  _____    \      \  ]],
[[  /     /  /  _ \  /     \  | __ \ |  |_/ __ \  /     \ \__  \   /   |   \ ]],
[[ /     /_ (  <_> )|  Y Y  \ | \_\ \|  |\  ___/ |  Y Y  \ / __ \_/    |    \]],
[[/_______ \ \____/ |__|_|  / |___  /|__| \___  >|__|_|  /(____  /\____|__  /]],
[[        \/              \/      \/          \/       \/      \/         \/ ]],
},
{
[[      ___           ___           ___           ___                        ___           ___           ___           ___     ]],
[[     /__/\         /  /\         /  /\         /  /\           ___        /  /\         /  /\         /  /\         /  /\    ]],
[[     \  \:\       /  /::\       /  /::|       /  /::\         /__/\      /  /::\       /  /::|       /  /::\       /  /::|   ]],
[[      \  \:\     /  /:/\:\     /  /:|:|      /  /:/\:\        \__\:\    /  /:/\:\     /  /:|:|      /  /:/\:\     /  /:|:|   ]],
[[       \  \:\   /  /:/  \:\   /  /:/|:|__   /  /::\ \:\       /  /::\  /  /::\ \:\   /  /:/|:|__   /  /::\ \:\   /  /:/|:|__ ]],
[[  ______\__\:\ /__/:/ \__\:\ /__/:/_|::::\ /__/:/\:\_\:|   __/  /:/\/ /__/:/\:\ \:\ /__/:/_|::::\ /__/:/\:\_\:\ /__/:/ |:| /\]],
[[ \  \::::::::/ \  \:\ /  /:/ \__\/  /~~/:/ \  \:\ \:\/:/  /__/\/:/~~  \  \:\ \:\_\/ \__\/  /~~/:/ \__\/  \:\/:/ \__\/  |:|/:/]],
[[  \  \:\~~~~~   \  \:\  /:/        /  /:/   \  \:\_\::/   \  \::/      \  \:\ \:\         /  /:/       \__\::/      |  |:/:/ ]],
[[   \  \:\        \  \:\/:/        /  /:/     \  \:\/:/     \  \:\       \  \:\_\/        /  /:/        /  /:/       |__|::/  ]],
[[    \  \:\        \  \::/        /__/:/       \__\::/       \__\/        \  \:\         /__/:/        /__/:/        /__/:/   ]],
[[     \__\/         \__\/         \__\/            ~~                      \__\/         \__\/         \__\/         \__\/    ]],
},
{
[[ ________       ______     ___      ___  _______     __       _______   ___      ___       __       _____  ___   ]],
[[("      "\     /    " \   |"  \    /"  ||   _  "\   |" \     /"     "| |"  \    /"  |     /""\     (\"   \|"  \  ]],
[[ \___/   :)   // ____  \   \   \  //   |(. |_)  :)  ||  |   (: ______)  \   \  //   |    /    \    |.\\   \    | ]],
[[   /  ___/   /  /    ) :)  /\\  \/.    ||:     \/   |:  |    \/    |    /\\  \/.    |   /' /\  \   |: \.   \\  | ]],
[[  //  \__   (: (____/ //  |: \.        |(|  _  \\   |.  |    // ___)_  |: \.        |  //  __'  \  |.  \    \. | ]],
[[ (:   / "\   \        /   |.  \    /:  ||: |_)  :)  /\  |\  (:      "| |.  \    /:  | /   /  \\  \ |    \    \ | ]],
[[  \_______)   \"_____/    |___|\__/|___|(_______/  (__\_|_)  \_______) |___|\__/|___|(___/    \___) \___|\____\) ]],
},
{
[[ _____                   _      _                              __ ]],
[[/ _  /  ___   _ __ ___  | |__  (_)  ___  _ __ ___    __ _   /\ \ \]],
[[\// /  / _ \ | '_ ` _ \ | '_ \ | | / _ \| '_ ` _ \  / _` | /  \/ /]],
[[ / //\| (_) || | | | | || |_) || ||  __/| | | | | || (_| |/ /\  / ]],
[[/____/ \___/ |_| |_| |_||_.__/ |_| \___||_| |_| |_| \__,_|\_\ \/  ]],
},
{
[[   _____                 _____         ______  _______         _____    ____      ______        ______  _______          ____    _____   ______   ]],
[[  /    /|___        ____|\    \       |      \/       \   ___|\     \  |    | ___|\     \      |      \/       \    ____|\   \  |\    \ |\     \  ]],
[[ /    /|    |      /     /\    \     /          /\     \ |    |\     \ |    ||     \     \    /          /\     \  /    /\    \  \\    \| \     \ ]],
[[|\____\|    |     /     /  \    \   /     /\   / /\     ||    | |     ||    ||     ,_____/|  /     /\   / /\     ||    |  |    |  \|    \  \     |]],
[[| |   |/    |___ |     |    |    | /     /\ \_/ / /    /||    | /_ _ / |    ||     \--'\_|/ /     /\ \_/ / /    /||    |__|    |   |     \  |    |]],
[[ \|___/    /    ||     |    |    ||     |  \|_|/ /    / ||    |\    \  |    ||     /___/|  |     |  \|_|/ /    / ||    .--.    |   |      \ |    |]],
[[    /     /|    ||\     \  /    /||     |       |    |  ||    | |    | |    ||     \____|\ |     |       |    |  ||    |  |    |   |    |\ \|    |]],
[[   |_____|/____/|| \_____\/____/ ||\____\       |____|  /|____|/____/| |____||____ '     /||\____\       |____|  /|____|  |____|   |____||\_____/|]],
[[   |     |    | | \ |    ||    | /| |    |      |    | / |    /     || |    ||    /_____/ || |    |      |    | / |    |  |    |   |    |/ \|   ||]],
[[   |_____|____|/   \|____||____|/  \|____|      |____|/  |____|_____|/ |____||____|     | / \|____|      |____|/  |____|  |____|   |____|   |___|/]],
[[     \(    )/         \(    )/        \(          )/       \(    )/      \(    \( |_____|/     \(          )/       \(      )/       \(       )/  ]],
[[      '    '           '    '          '          '         '    '        '     '    )/         '          '         '      '         '       '   ]],
[[                                                                                     '                                                            ]],
},
{
[[  ____                _      _                        _  _ ]],
[[ |_  /  ___   _ __   | |__  (_)  ___   _ __    __ _  | \| |]],
[[  / /  / _ \ | '  \  | '_ \ | | / -_) | '  \  / _` | | .` |]],
[[ /___| \___/ |_|_|_| |_.__/ |_| \___| |_|_|_| \__,_| |_|\_|]],
},
{
[[    ___       ___       ___       ___       ___       ___       ___       ___       ___   ]],
[[   /\  \     /\  \     /\__\     /\  \     /\  \     /\  \     /\__\     /\  \     /\__\  ]],
[[  _\:\  \   /::\  \   /::L_L_   /::\  \   _\:\  \   /::\  \   /::L_L_   /::\  \   /:| _|_ ]],
[[ /::::\__\ /:/\:\__\ /:/L:\__\ /::\:\__\ /\/::\__\ /::\:\__\ /:/L:\__\ /::\:\__\ /::|/\__\]],
[[ \::;;/__/ \:\/:/  / \/_/:/  / \:\::/  / \::/\/__/ \:\:\/  / \/_/:/  / \/\::/  / \/|::/  /]],
[[  \:\__\    \::/  /    /:/  /   \::/  /   \:\__\    \:\/  /    /:/  /    /:/  /    |:/  / ]],
[[   \/__/     \/__/     \/__/     \/__/     \/__/     \/__/     \/__/     \/__/     \/__/  ]],
},
{
[[ ______     ______     __    __     ______     __     ______     __    __     ______     __   __    ]],
[[/\___  \   /\  __ \   /\ "-./  \   /\  == \   /\ \   /\  ___\   /\ "-./  \   /\  __ \   /\ "-.\ \   ]],
[[\/_/  /__  \ \ \/\ \  \ \ \-./\ \  \ \  __<   \ \ \  \ \  __\   \ \ \-./\ \  \ \  __ \  \ \ \-.  \  ]],
[[  /\_____\  \ \_____\  \ \_\ \ \_\  \ \_____\  \ \_\  \ \_____\  \ \_\ \ \_\  \ \_\ \_\  \ \_\\"\_\ ]],
[[  \/_____/   \/_____/   \/_/  \/_/   \/_____/   \/_/   \/_____/   \/_/  \/_/   \/_/\/_/   \/_/ \/_/ ]],
},
{
[[ ______      ______       ___ __ __       _______       ________      ______       ___ __ __      ________       ___   __      ]],
[[/_____/\    /_____/\     /__//_//_/\    /_______/\     /_______/\    /_____/\     /__//_//_/\    /_______/\     /__/\ /__/\    ]],
[[\:::__\/    \:::_ \ \    \::\| \| \ \   \::: _  \ \    \__.::._\/    \::::_\/_    \::\| \| \ \   \::: _  \ \    \::\_\\  \ \   ]],
[[   /: /      \:\ \ \ \    \:.      \ \   \::(_)  \/_      \::\ \      \:\/___/\    \:.      \ \   \::(_)  \ \    \:. `-\  \ \  ]],
[[  /::/___     \:\ \ \ \    \:.\-/\  \ \   \::  _  \ \     _\::\ \__    \::___\/_    \:.\-/\  \ \   \:: __  \ \    \:. _    \ \ ]],
[[ /_:/____/\    \:\_\ \ \    \. \  \  \ \   \::(_)  \ \   /__\::\__/\    \:\____/\    \. \  \  \ \   \:.\ \  \ \    \. \`-\  \ \]],
[[ \_______\/     \_____\/     \__\/ \__\/    \_______\/   \________\/     \_____\/     \__\/ \__\/    \__\/\__\/     \__\/ \__\/]],
},
{
[[ ________      ________      _____ ______       ________      ___      _______       _____ ______       ________      ________      ]],
[[|\_____  \    |\   __  \    |\   _ \  _   \    |\   __  \    |\  \    |\  ___ \     |\   _ \  _   \    |\   __  \    |\   ___  \    ]],
[[ \|___/  /|   \ \  \|\  \   \ \  \\\__\ \  \   \ \  \|\ /_   \ \  \   \ \   __/|    \ \  \\\__\ \  \   \ \  \|\  \   \ \  \\ \  \   ]],
[[     /  / /    \ \  \\\  \   \ \  \\|__| \  \   \ \   __  \   \ \  \   \ \  \_|/__   \ \  \\|__| \  \   \ \   __  \   \ \  \\ \  \  ]],
[[    /  /_/__    \ \  \\\  \   \ \  \    \ \  \   \ \  \|\  \   \ \  \   \ \  \_|\ \   \ \  \    \ \  \   \ \  \ \  \   \ \  \\ \  \ ]],
[[   |\________\   \ \_______\   \ \__\    \ \__\   \ \_______\   \ \__\   \ \_______\   \ \__\    \ \__\   \ \__\ \__\   \ \__\\ \__\]],
[[    \|_______|    \|_______|    \|__|     \|__|    \|_______|    \|__|    \|_______|    \|__|     \|__|    \|__|\|__|    \|__| \|__|]],
},
{
[[▒███████▒ ▒█████   ███▄ ▄███▓ ▄▄▄▄    ██▓▓█████  ███▄ ▄███▓ ▄▄▄       ███▄    █ ]],
[[▒ ▒ ▒ ▄▀░▒██▒  ██▒▓██▒▀█▀ ██▒▓█████▄ ▓██▒▓█   ▀ ▓██▒▀█▀ ██▒▒████▄     ██ ▀█   █ ]],
[[░ ▒ ▄▀▒░ ▒██░  ██▒▓██    ▓██░▒██▒ ▄██▒██▒▒███   ▓██    ▓██░▒██  ▀█▄  ▓██  ▀█ ██▒]],
[[  ▄▀▒   ░▒██   ██░▒██    ▒██ ▒██░█▀  ░██░▒▓█  ▄ ▒██    ▒██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒]],
[[▒███████▒░ ████▓▒░▒██▒   ░██▒░▓█  ▀█▓░██░░▒████▒▒██▒   ░██▒ ▓█   ▓██▒▒██░   ▓██░]],
[[░▒▒ ▓░▒░▒░ ▒░▒░▒░ ░ ▒░   ░  ░░▒▓███▀▒░▓  ░░ ▒░ ░░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒░   ▒ ▒ ]],
[[░░▒ ▒ ░ ▒  ░ ▒ ▒░ ░  ░      ░▒░▒   ░  ▒ ░ ░ ░  ░░  ░      ░  ▒   ▒▒ ░░ ░░   ░ ▒░]],
[[░ ░ ░ ░ ░░ ░ ░ ▒  ░      ░    ░    ░  ▒ ░   ░   ░      ░     ░   ▒      ░   ░ ░ ]],
[[  ░ ░        ░ ░         ░    ░       ░     ░  ░       ░         ░  ░         ░ ]],
[[░                                  ░                                            ]],
},
{
[[ ▄███████▄   ▄██████▄     ▄▄▄▄███▄▄▄▄   ▀█████████▄   ▄█     ▄████████    ▄▄▄▄███▄▄▄▄      ▄████████ ███▄▄▄▄   ]],
[[██▀     ▄██ ███    ███  ▄██▀▀▀███▀▀▀██▄   ███    ███ ███    ███    ███  ▄██▀▀▀███▀▀▀██▄   ███    ███ ███▀▀▀██▄ ]],
[[      ▄███▀ ███    ███  ███   ███   ███   ███    ███ ███▌   ███    █▀   ███   ███   ███   ███    ███ ███   ███ ]],
[[ ▀█▀▄███▀▄▄ ███    ███  ███   ███   ███  ▄███▄▄▄██▀  ███▌  ▄███▄▄▄      ███   ███   ███   ███    ███ ███   ███ ]],
[[  ▄███▀   ▀ ███    ███  ███   ███   ███ ▀▀███▀▀▀██▄  ███▌ ▀▀███▀▀▀      ███   ███   ███ ▀███████████ ███   ███ ]],
[[▄███▀       ███    ███  ███   ███   ███   ███    ██▄ ███    ███    █▄   ███   ███   ███   ███    ███ ███   ███ ]],
[[███▄     ▄█ ███    ███  ███   ███   ███   ███    ███ ███    ███    ███  ███   ███   ███   ███    ███ ███   ███ ]],
[[ ▀████████▀  ▀██████▀    ▀█   ███   █▀  ▄█████████▀  █▀     ██████████   ▀█   ███   █▀    ███    █▀   ▀█   █▀  ]],
},
{
[[·▄▄▄▄•      • ▌ ▄ ·. ▄▄▄▄· ▪  ▄▄▄ .• ▌ ▄ ·.  ▄▄▄·  ▐ ▄ ]],
[[▪▀·.█▌▪     ·██ ▐███▪▐█ ▀█▪██ ▀▄.▀··██ ▐███▪▐█ ▀█ •█▌▐█]],
[[▄█▀▀▀• ▄█▀▄ ▐█ ▌▐▌▐█·▐█▀▀█▄▐█·▐▀▀▪▄▐█ ▌▐▌▐█·▄█▀▀█ ▐█▐▐▌]],
[[█▌▪▄█▀▐█▌.▐▌██ ██▌▐█▌██▄▪▐█▐█▌▐█▄▄▌██ ██▌▐█▌▐█ ▪▐▌██▐█▌]],
[[·▀▀▀ • ▀█▄▀▪▀▀  █▪▀▀▀·▀▀▀▀ ▀▀▀ ▀▀▀ ▀▀  █▪▀▀▀ ▀  ▀ ▀▀ █▪]],
},
{
[[ ▄▀▀▀▀▄    ▄▀▀▀▀▄   ▄▀▀▄ ▄▀▄  ▄▀▀█▄▄   ▄▀▀█▀▄    ▄▀▀█▄▄▄▄  ▄▀▀▄ ▄▀▄  ▄▀▀█▄   ▄▀▀▄ ▀▄ ]],
[[█     ▄▀  █      █ █  █ ▀  █ ▐ ▄▀   █ █   █  █  ▐  ▄▀   ▐ █  █ ▀  █ ▐ ▄▀ ▀▄ █  █ █ █ ]],
[[▐ ▄▄▀▀    █      █ ▐  █    █   █▄▄▄▀  ▐   █  ▐    █▄▄▄▄▄  ▐  █    █   █▄▄▄█ ▐  █  ▀█ ]],
[[  █       ▀▄    ▄▀   █    █    █   █      █       █    ▌    █    █   ▄▀   █   █   █  ]],
[[   ▀▄▄▄▄▀   ▀▀▀▀   ▄▀   ▄▀    ▄▀▄▄▄▀   ▄▀▀▀▀▀▄   ▄▀▄▄▄▄   ▄▀   ▄▀   █   ▄▀  ▄▀   █   ]],
[[       ▐           █    █    █    ▐   █       █  █    ▐   █    █    ▐   ▐   █    ▐   ]],
[[                   ▐    ▐    ▐        ▐       ▐  ▐        ▐    ▐            ▐        ]],
},
{
[[███████╗ ██████╗ ███╗   ███╗██████╗ ██╗███████╗███╗   ███╗ █████╗ ███╗   ██╗]],
[[╚══███╔╝██╔═══██╗████╗ ████║██╔══██╗██║██╔════╝████╗ ████║██╔══██╗████╗  ██║]],
[[  ███╔╝ ██║   ██║██╔████╔██║██████╔╝██║█████╗  ██╔████╔██║███████║██╔██╗ ██║]],
[[ ███╔╝  ██║   ██║██║╚██╔╝██║██╔══██╗██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║]],
[[███████╗╚██████╔╝██║ ╚═╝ ██║██████╔╝██║███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║]],
[[╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═════╝ ╚═╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝]],
}}

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = splashes[math.random(#splashes)]

dashboard.section.buttons.val = {
	dashboard.button("f", "󰍉  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "󰗧  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("l", "󰁯  Restore last session", ":lua require(\"persistence\").load({ last = true })<CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	local quotes = {"Tía, ¿No será esa la respuesta, ahora que lo pienso?",
		"Ahora nos vamos al centro y nos compramos un helado, el mío todo de frutilla y el de usted con chocolate y un bizcochito",
		"No te regalan un reloj, tú eres el regalado, a ti te ofrecen para el cumpleaños del reloj",
		"Allá al fondo está la muerte, pero no tenga miedo",
		"Había empezado a leer la novela unos días antes",
		"In theory, theory and practice are the same. In practice, they are not",
		"Entonces sus ojos vieron los muñones",
		"El cuerpo cesaba de temblar. La mano del ejecutor buscó el pulso en los tobillos. Ya se iban los testigos",
		"El cuarto portugués estaba muerto",
		"But by God, Eliot, it was a photograph from life"}
	return quotes[math.random(#quotes)]
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
