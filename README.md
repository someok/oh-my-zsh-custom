# oh-my-zsh-custom

基于 [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) 的自定义配置，增加了一些个人常用插件与皮肤。

采用的是 `git submodule` 来维护，包括 `oh-my-zsh`，之所以这么搞，主要是手头有多台 linux 需要维护，
每台机器、每个用户都配置一遍比较麻烦，索性将个人常用的工具都打包在一起，简化一下配置。

这么搞的好处是只需要在 clone 一份，然后在各个用户的 `.zshrc` 下面配置一下 source 指向即可。具体可参见下面的 `安装步骤`。

支持 Mac 终端、iTerm 风格和 Warp、JetBrains 新终端风格，具体实现可参见 [start.sh](start.sh)

## Requirements

-   zsh
-   git
-   Mac OS X: [Nerd fonts](https://github.com/ryanoasis/nerd-fonts)
-   Linux: none

## 安装步骤

### git clone

> git clone --recurse-submodules https://github.com/someok/oh-my-zsh-custom.git

### .zshrc

> source /path/to/oh-my-zsh-custom/oh-my-zsh-custom.sh

## 覆盖变量

可以在根目录下创建 `override.sh`，在其中定义的内容可以覆盖默认配置。

## 目录结构

-   **[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)**: 不用多说，基石
-   **custom**: oh-my-zsh 的 custom 目录，在 `oh-my-zsh-custom.sh` 中通过 `ZSH_CUSTOM` 配置
    -   **plugins**
        -   [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
        -   [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
        -   [material-colors](https://github.com/zpm-zsh/material-colors)
        -   [git-open](https://github.com/paulirish/git-open)
    -   **themes**
        -   someok-linux.zsh-theme: 基于 [aphrodite-terminal-theme](https://github.com/win0err/aphrodite-terminal-theme) 的简单定制，用于 `Linux` 环境
-   **modules**
    -   [powerlevel10k](https://github.com/romkatv/powerlevel10k): 集成的 theme
-   **override**: 用于覆盖 `oh-my-zsh-custom.sh` 中的配置
    -   mac.sh: Mac 下可用
    -   linux.sh: Linux 下可用
    -   override.sh: 在 `oh-my-zsh` 实际执行前调用，优先级比 mac.sh、linux.sh 更高
    -   \*.template: 一些模板文件，可基于此复制并去掉后缀
    -   \*.theme.sh: 集成的几个 theme 的个性配置
-   **example**
    -   .zshrc: 示例实现

## plugins 功能概述

-   zoxide/z: 支持 `z` 跳转，类似 `autojump`，优先采用 `zoxide`
-   extract: 解压命令，可根据扩展名自动执行相应解压命令，alias 为 `x`
-   sudo: 按两次 `ESC` 可在命令前面添加 `sudo`
-   history: 增加几个查看历史的 alias: h, hs, hsi
-   colored-man-pages: 给 man 页面着色
-   zsh-syntax-highlighting: 命令着色
-   zsh-autosuggestions: 自动建议
-   material-colors: 美化 `ls`、`ll` 输出的列表
-   copydir: 输入 `copydir` 可拷贝当前所在路径
-   copyfile: 输入 `copyfile <filepath>` 拷贝给定文件内容到剪贴板
-   copybuffer: 按 <kbd>CTRL</kbd>+<kbd>O</kbd> 可拷贝当前输入内容
-   cheatsh: 增加 `cht.sh` 命令用于展示 linux 命令介绍，具体参见 [cht.sh](https://cht.sh/)

### Mac OS X 上启用插件

-   git-open: 在 git 目录下通过 `git open` 在浏览器打开项目的 GitHub 页面
-   sublime: `st` 可打开给定文件，`stt` 可将当前所在文件夹发送到 sublime
-   gradle: 支持 `gradle` 自动完成
-   sdk: SDKMAN 自动提示
-   macos: 可以通过一些命令打开或返回 finder 路径

## Powerlevel10k 配置

新版 Powerlevel10k 增加了配置向导功能 `p10k configure`，完成之后会在生成 `~/.p10k.zsh`，将其拷贝到
`override/powerlevel10k.theme.sh`。

在 `.zshrc` 最后找的相应配置，然后删除。

最后执行 `omz reload` 重置配置即可。

另： `override/powerlevel9k.theme.sh` 为旧版配置，暂时保留，以后酌情删除。

## 更新方式

-   git 更新:
    > git fetch && git pull
-   submodule 更新:
    > git submodule update --remote --recursive
-   submodule 初始化:
    > git submodule update --init --recursive
-   submodule 添加示例
    > git submodule add https://github.com/zpm-zsh/colors.git custom/plugins/colors
