# oh-my-zsh-custom

基于 [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) 的自定义配置，增加了一些个人常用插件与皮肤。

采用的是 `git submodule` 来维护，包括 `oh-my-zsh`，之所以这么搞，主要是手头有多台 linux 需要维护，
每台机器、每个用户都配置一遍比较麻烦，索性将个人常用的工具都打包在一起，简化一下配置。

这么搞的好处是只需要在 clone 一份，然后在各个用户的 `.zshrc` 下面配置一下 source 指向即可。具体可参加下面的 `安装步骤`。

配置很简单，具体可参加 [oh-my-zsh-custom.sh](oh-my-zsh-custom.sh)

## Requirements

-   zsh
-   git
-   Mac OS X: [Nerd fonts](https://github.com/ryanoasis/nerd-fonts)
-   Linux: none

## 安装步骤

### git clone

> git clone --recursive https://github.com/someok/oh-my-zsh-custom.git

### .zshrc

> source /path/to/oh-my-zsh-custom/oh-my-zsh-custom.sh

## 目录结构

-   **[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)**: 不用多说，基石
-   **custom**: oh-my-zsh 的 custom 目录，在 `oh-my-zsh-custom.sh` 中通过 `ZSH_CUSTOM` 配置
    -   **plugins**
        -   [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
        -   [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    -   **themes**
        -   someok-linux.zsh-theme: 基于 [aphrodite-terminal-theme](https://github.com/win0err/aphrodite-terminal-theme) 的简单定制，用于 `Linux` 环境
-   **modules**
    -   [alien](https://github.com/eendroroy/alien): Mac OS X 下启用的 theme
-   **example**
    -   .zshrc: 示例实现

## 更新方式

-   submodule:
    > git submodule update --remote
