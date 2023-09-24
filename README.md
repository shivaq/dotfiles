# まずやること(中途半端)

oh-my-zsh をインストールする
.zshrc に、. .~/.bash_profile を追記する(ローンチの際に実行するようにするため)

# ワン・コマンドインストール

- できていない
- `bash -c "$(https://{URL}/install.sh)"` で出来るようにする予定
- curl -L dot.b4b4r07.com | sh でもいいが，これだとサブシェル上でインストールが開始される

## 参考

## /dotfiles/etc/install

- /etc/init/\*.sh として、下記を実行するシェルを用意する
  Vim のカスタムビルド
  Vim plugins を NeoBundle 経由でインストール
  ホームディレクトリにあるディレクトリ名の英語化
  Zsh プラグインマネージャ Antigen のインストール
  シンタックスハイライタ Pygments のインストール
  OS X の defaults コマンド群の実行
  Ruby の開発環境を整備
  Gem のインストール
  ...（などの新しい環境で毎回セットアップするうち自動化出来そうなこと）

## oh-my-zsh.sh

# ワン・コマンドじゃないインストール

- local のどこかに clone する
- clone 先 で make help して、そのアウトプットをヒントにデプロイや初期化を行う

## dotfile の育成方針

- 下記を参考に、理解したものから自分の dotfile に移植していく
  [優れた dotfiles を設計して、最速で環境構築する話](https://qiita.com/b4b4r07/items/24872cdcbec964ce2178)
  [最強の dotfiles 駆動開発と GitHub で管理する運用方法](https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2#%E3%82%B7%E3%82%A7%E3%83%AB%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E3%81%A8-makefile)

https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2#%E3%82%B7%E3%82%A7%E3%83%AB%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E3%81%A8-makefile

- 時々は github から参考にしたものを取り込む

## ディレクトリ構成

bin/

自作のコマンドスクリプトやバイナリなどの保管場所。
.zshrc などでは PATH=$PATH:~/bin などとしてパスを通します。
ドットファイルに加えて bin/ もデプロイのリストにあるので、ホームディレクトリにリンクされます。

doc/

ドキュメンテーションがメインですが、ある意味エクストラファイルの保存場所です。
設定ファイルでも、自作コマンドでもないもの（マニュアル他、README 用の画像など）が配置されます。

etc/

doc/ との違いは、コード片か非コード片かだけです。
設定用のスクリプトファイルや、コード関連のファイルの保存場所です。
また、etc/init 以下にあるスクリプトは dotfiles のインストール時のイニシャライズに使用されます。

###### zsh

- zsh に関しては、oh-my-zsh を利用する
- 守破離ですすめる

# 最初に参考にした設定たち

## カラースキーム

- 下記からダウンロード
  https://ethanschoonover.com/solarized/

- README を読んで、solarized を入れる
- カラースキーム、そこまでこだわるものでもないけど。

## vimrc

- 下記に従った
  https://github.com/amix/vimrc

### Vim のカラースキーム

code ~/.vim_runtime/vimrcs/extended.vim

- 上記ファイルに下記設定変更をした

```s
set background=dark
colorscheme solarized
```

## プロンプト

- テーマは下記で設定

```s
# .zshrc 内の設定
ZSH_THEME="agnoster"
```

.oh-my-zsh/themes/agnoster.zsh-theme

- 上記の下記で定義している

```s
## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_aws
  prompt_context
  prompt_dir
  prompt_git
  prompt_bzr
  prompt_hg
  prompt_end
}
```

## tmux

インストールする

## .tmux.conf

- 下記をインストールする
- 下記が便利なので、とりあえず tmux は dotfile の育成をやめる
  https://github.com/gpakosz/.tmux

### カスタマイズ

```bash
cd
code .tmux.conf
```

### 下記の Prefix を C-t に変更

```bash
set -g prefix2 C-a
bind C-a send-prefix -2
```

### ステータスバーをトップに移動

- 下記を追記
  set -g status-position top

</br>
</br>
</br>
</br>

# 新規 追加のやり方

- `.bash_profile` の下記部分に。。。

```sh
for file in ~/.{path,bash_prompt,exports,aliases,gitdots,tmuxdots,pythondots,javadots,javascriptdots,golangdots,nodejsdots,awsdots,gcpdots,terraformdots,dockerdots,k8sdots,dbdots,secretdots,functions,extra,inmyheaddots}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
```

- 新規 dotfile 例えば `rubydots` を 追記する
