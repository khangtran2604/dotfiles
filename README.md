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

### Config for vim-doge(Auto-generating document)

- Run in "command mode" with the below command:

```
:call doge#install()
```
