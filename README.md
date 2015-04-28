# dot-files

お好みのファイルをホームディレクトリにコピーしてご利用下さい。

## 動作確認環境

- Mac OS X (Yosemite)
  - [Homebrew](http://brew.sh/) が必要

### Mac での環境準備

1. [Homebrew](http://brew.sh/) を導入
2. Mavericks 以前の場合は homebrew で zsh をインストールする
   $ brew install zsh
3. screen をインストール
   $ brew tap rcmdnk/homebrew-rcmdnkpac
   $ brew install screenutf8 --utf8
4. [iTerm2 2.1 beta 以降](http://iterm2.com/downloads.html) のインストールを推奨
  - iTerm2 - Preferences.. - Profiles - General - Command で Command を選び、 `/bin/zsh` を入力
  - システム環境設定からデフォルトシェルを zsh に変更すると App Store でエラーが起きるのでダメ
5. [MacVim-KaoriYa](https://github.com/splhack/macvim-kaoriya) のインストールを推奨

### インストール方法

事前にバックアップをとってください。

    $ make
    $ cp -a .vim* .gvim* $HOME
    $ cp -a .zsh* $HOME
    $ cp .screenrc $HOME

### 参考: AWS のアカウントをシェルで使えるようにする方法

`$HOME/.aws` ディレクトリを用意し、以下のファイルを作成してください。

#### $HOME/.aws/credentials

```
[default]
aws_access_key_id = ...................
aws_secret_access_key = ......................... 
```

#### $HOME/.aws/config

```
[default]
region=ap-northeast-1
output=json
```

