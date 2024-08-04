### Config for lazygit

- Open or create a new one if not exists: vim ~/Library/Application\ Support/lazygit/config.yml
- Enter the following for customizing UI:

```yaml
gui:
  nerdFontsVersion: "3"
os:
  open: "code {{filename}}"
  editPreset: "nvim"
```

### Multiple Neovim Configurations

- Pass the following code into ~/.zshrc

```bash
  alias vim="nvim"
  alias vi="nvim"

  nvims() {
    select config in prev
    do NVIM_APPNAME=nvim-$config nvim $@; break; done
  }
```
