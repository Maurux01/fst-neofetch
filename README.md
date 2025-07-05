# fst-neofetch

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Platform: Linux](https://img.shields.io/badge/platform-linux-blue.svg)](https://www.linux.org/)

Custom vibrant configs for [Fastfetch](https://github.com/fastfetch-cli/fastfetch) and [Neofetch](https://github.com/dylanaraps/neofetch) with color blocks and Nerd Font icon support.

---

## Preview

Below is an example of how your terminal will look with these configs:

![Fastfetch and Neofetch Preview](./screenshot.png)

> Make sure you are using a Nerd Font and a terminal with true color support for best results!

---

## Included Files

- `fastfetch-config.jsonc`: Configuration for Fastfetch
- `neofetch-config.conf`: Configuration for Neofetch

---

## Installation

1. **Install a Nerd Font:**  
   [Nerd Fonts Downloads](https://www.nerdfonts.com/font-downloads)
2. **Set the Nerd Font in your terminal preferences.**
3. **Copy the configs:**
   ```sh
   mkdir -p ~/.config/fastfetch
   cp fastfetch-config.jsonc ~/.config/fastfetch/config.jsonc

   mkdir -p ~/.config/neofetch
   cp neofetch-config.conf ~/.config/neofetch/config.conf
   ```
4. **Run in your terminal:**
   ```sh
   fastfetch
   neofetch
   ```

---

## Troubleshooting

- **Icons look weird or are missing?**  
  Make sure you have a Nerd Font selected in your terminal.
- **Colors look dull?**  
  Use a terminal with true color support (e.g., kitty, alacritty, wezterm).
- **Still not working?**  
  Restart your terminal after changing the font.

---

## Credits

- Inspired by the Arch Linux and TokyoNight themes.
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Neofetch](https://github.com/dylanaraps/neofetch)
- [Nerd Fonts](https://www.nerdfonts.com/)

---

## License

This project is licensed under the [MIT License](LICENSE).