local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "-",
        symlink = "ln",
        folder = {
          arrow_open = "o",
          arrow_closed = ">",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "ln",
          symlink_open = "ln",
        },
        git = {
          unstaged = "u",
          staged = "s",
          unmerged = "m",
          renamed = "r",
          untracked = "U",
          deleted = "d",
          ignored = "i",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "h",
      info = "i",
      warning = "w",
      error = "e",
    },
  },
  view = {
    width = 30,
    height = 30,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
}
