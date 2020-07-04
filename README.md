# dot-files

お好みのファイルをホームディレクトリにコピーしてご利用下さい。

## 動作確認環境

- Mac OS X (Catalina)
  - [Homebrew](http://brew.sh/) が必要

### Mac での環境準備

1. [Homebrew](http://brew.sh/) を導入
2. `cp Brewfile $HOME && cd && brew bundle`

### 自動でインストールされないアプリ

- Cisco AnyConnect
- CleanArchiver
  - https://github.com/anyakichi/CleanArchiver/releases
- IMEShortcuts 0.14 beta
- Progress Telerik Fiddler

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

