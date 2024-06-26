# Ubuntu 20.04 初始化腳本

這個腳本停止開發，轉移到 golang 版本: [https://github.com/poliyka/ubuntuInit](https://github.com/poliyka/ubuntuInit)

## Configuration

- [ansible.env](./ansible.env) 中修正使用者名稱

```python
...
#--------------------------------------------------
# OE Settings
#--------------------------------------------------
OE_USER="poliyka"
OE_PASSWORD="changeme"
...
```

- [ansible.env](./ansible.env) 選擇需要的套件

```python
...
# Choose Dependencise
INSTALL_DEPENDEN=true

# Choices Packages
INSTALL_RANGER=true
INSTALL_NVM=true
INSTALL_YARN=true
INSTALL_PYENV=true
INSTALL_FZF=true
CONFIG_BASHRC_COLOR=true
CONFIG_GIT_ALIAS=true
...
```

## Usage

```h
./run.sh
```

安裝完成後重開終端機或輸入下方指令

```h
source ~/.bashrc
```

## Introduction

- INSTALL_RANGER

  快速瀏覽料夾工具, 啟動方式在 Terminal 中輸入 `ranger`

![image](./src/ranger.png)

- INSTALL_NVM

  前端 npm 版本管理工具

![image](./src/nvm.png)

- INSTALL_YARN

  前端 yarn package manager

![image](./src/yarn.png)

- INSTALL_FZF

  快速查詢檔案功能,快速鍵 `ctrl+t`

![image](./src/fzf.png)

- CONFIG_BASHRC_COLOR

  客製化 `bash` 指令

![image](./src/bashrc_color.png)

- CONFIG_GIT_ALIAS

  客製化 `git` 指令

![image](./src/git_alias.png)

## Notice

1. 不要重複安裝相同的套件，否則會產生 Garbage Code.
2. 如有要安裝特定版本請自行修改腳本
