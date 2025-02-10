return {
  "echasnovski/mini.starter",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = "VimEnter",
  opts = function()
    local logo = table.concat({
      "       ██╗███╗   ██╗    ███████╗██╗██╗     ███████╗███╗   ██╗ ██████╗███████╗              ",
      "       ██║████╗  ██║    ██╔════╝██║██║     ██╔════╝████╗  ██║██╔════╝██╔════╝              ",
      "       ██║██╔██╗ ██║    ███████╗██║██║     █████╗  ██╔██╗ ██║██║     █████╗                ",
      "       ██║██║╚██╗██║    ╚════██║██║██║     ██╔══╝  ██║╚██╗██║██║     ██╔══╝                ",
      "       ██║██║ ╚████║    ███████║██║███████╗███████╗██║ ╚████║╚██████╗███████╗              ",
      "       ╚═╝╚═╝  ╚═══╝    ╚══════╝╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝ ╚═════╝╚══════╝              ",
      "                                                                                           ",
      "       ███████╗███╗   ███╗██████╗ ██████╗  █████╗  ██████╗███████╗                         ",
      "       ██╔════╝████╗ ████║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝                         ",
      "       █████╗  ██╔████╔██║██████╔╝██████╔╝███████║██║     █████╗                           ",
      "       ██╔══╝  ██║╚██╔╝██║██╔══██╗██╔══██╗██╔══██║██║     ██╔══╝                           ",
      "       ███████╗██║ ╚═╝ ██║██████╔╝██║  ██║██║  ██║╚██████╗███████╗                         ",
      "       ╚══════╝╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝                         ",
      "                                                                                           ",
      "       █████╗     ███████╗██╗   ██╗███╗   ███╗██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗██╗   ██╗ ",
      "       ██╔══██╗    ██╔════╝╚██╗ ██╔╝████╗ ████║██╔══██╗██║  ██║██╔═══██╗████╗  ██║╚██╗ ██╔╝",
      "       ███████║    ███████╗ ╚████╔╝ ██╔████╔██║██████╔╝███████║██║   ██║██╔██╗ ██║ ╚████╔╝ ",
      "       ██╔══██║    ╚════██║  ╚██╔╝  ██║╚██╔╝██║██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║  ╚██╔╝  ",
      "       ██║  ██║    ███████║   ██║   ██║ ╚═╝ ██║██║     ██║  ██║╚██████╔╝██║ ╚████║   ██║   ",
      "       ╚═╝  ╚═╝    ╚══════╝   ╚═╝   ╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ",
      "                                                                                           ",
      "       ██╗   ██╗███╗   ██╗███████╗ ██████╗ ██╗     ██████╗ ███████╗                        ",
      "       ██║   ██║████╗  ██║██╔════╝██╔═══██╗██║     ██╔══██╗██╔════╝                        ",
      "       ██║   ██║██╔██╗ ██║█████╗  ██║   ██║██║     ██║  ██║███████╗                        ",
      "       ██║   ██║██║╚██╗██║██╔══╝  ██║   ██║██║     ██║  ██║╚════██║                        ",
      "       ╚██████╔╝██║ ╚████║██║     ╚██████╔╝███████╗██████╔╝███████║                        ",
      "       ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚══════╝╚═════╝ ╚══════╝                         ",
    }, "\n")
    local pad = string.rep(" ", 22)
    local new_section = function(name, action, section)
      return { name = name, action = action, section = pad .. section }
    end

    local starter = require("mini.starter")
    --stylua: ignore
    local config = {
      evaluate_single = true,
      header = logo,
      items = {
        new_section("Explore",         ":Neotree",                            "neovim"),
        new_section("Fuzzy",           LazyVim.pick(),                        "neovim"),
        new_section("New file",        "ene | startinsert",                   "neovim"),
        new_section("Grep file",       LazyVim.pick("live_grep"),             "neovim"),
        new_section("Config",          LazyVim.pick.config_files(),           "neovim"),
        new_section("Quit",            "qa",                                  "neovim"),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "center"),
      },
    }
    return config
  end,
  config = function(_, config)
    -- close Lazy and re-open when starter is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniStarterOpened",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    local starter = require("mini.starter")
    starter.setup(config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function(ev)
        local pad_footer = string.rep(" ", 8)
        starter.config.footer = pad_footer .. "⚡... ready to create ... ⚡"
        -- INFO: based on @echasnovski's recommendation (thanks a lot!!!)
        if vim.bo[ev.buf].filetype == "ministarter" then
          pcall(starter.refresh)
        end
      end,
    })
  end,
}
