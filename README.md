# Trincasidra's dotfiles

![dotfiles](./screenshot.png)

- Window manager + compositor: [hyprland](https://hyprland.org/)
- Color theme: [dracula](https://draculatheme.com/)
- Status Bar: [waybar](https://github.com/Alexays/Waybar)
- Notifications: [swaync](https://github.com/ErikReider/SwayNotificationCenter)
- Terminal: [kitty](https://sw.kovidgoyal.net/kitty/)
  - With [starship](https://starship.rs/)
- Text/Code editor: [nvim](https://neovim.io/)
  - With [packer](https://github.com/wbthomason/packer.nvim) plugin manager
  - Plugins: [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua), [lualine](https://github.com/nvim-lualine/lualine.nvim), [treesitter](https://github.com/nvim-treesitter/nvim-treesitter), [gitsigns](https://github.com/lewis6991/gitsigns.nvim), [oil](https://github.com/stevearc/oil.nvim), [nvim-cmp](https://github.com/hrsh7th/nvim-cmp), [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp), [luasnip](https://github.com/L3MON4D3/LuaSnip), [friendly-snippets](https://github.com/rafamadriz/friendly-snippets), [mason](https://github.com/williamboman/mason.nvim), [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim), [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [lspsaga](https://github.com/nvimdev/lspsaga.nvim), [telescope](https://github.com/nvim-telescope/telescope.nvim)
- File manager: [ranger](https://github.com/ranger/ranger) or [pcmanfm](https://github.com/lxde/pcmanfm)
- Launcher / power menu: [fuzzel](https://codeberg.org/dnkl/fuzzel)
- Audio: PulseAudio + pavucontrol
- Desktop background: [hyprpaper](https://feh.finalrewind.org/)
- AUR manager: [paru](https://github.com/Morganamilo/paru)
- Other stuff:
  - PDF viewer: [zathura](https://pwmt.org/projects/zathura/)
  - Music: [spotify-launcher](https://archlinux.org/packages/extra/x86_64/spotify-launcher/) (or alternatively [spotify-player](https://github.com/aome510/spotify-player) if I feel spicy)
  - Calendar: [calcurse](https://calcurse.org/) (with [calcurse-caldav](https://calcurse.org/files/calcurse-caldav.html) for gmail)
  - Mail: [cmdg](https://github.com/ThomasHabets/cmdg) (for gmail) (manual install)
  - Audio visualizer: [cava](https://github.com/karlstav/cava)
  - Screenshots: [flameshot](https://flameshot.org/)

## Package installation

Since these are my personal dotfiles, they also include some scripts to help me set up after freshly installing Arch. Therefore, if you're going to use them, I'd suggest checking all the scripts first since they install very specific packages:

- **install_home.sh**: Base + gaming or personal preference stuff.
- **install_work.sh**: Base + things I need to work or company-required.
