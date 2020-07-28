# realpath -> NAMES内の各要素の絶対パスを取得。ファイルやディレクトリが存在するもののみ取得
# dir -> NAMES内のディレクトリ名を取得
# lastword -> NAMES内の最後の要素を取得する。
# MAKEFILE_LIST -> make コマンドによって parse されるファイルのリスト。include をMakefile 内で行っていたりした場合、そのファイル名もリストに追加される
# ここでは "Makefile" のみがパース対象となる想定
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

# wildcard -> ワイルドカードを使って実在するファイルを取得する。
CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml
# filter-out ->TEXT内からPATTERNの文字列に一致しない要素を取得
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

all:




# foreach -> LISTの要素をVARに分解し、TEXTで展開して実行
# $(foreach VAR,LIST,TEXT)
# ls -d -> ディレクトリの結果を、再帰的に表示せず、１ファイルであるかのように表示
# ls -F -> パスネームのあとに、ディレクトリなら /, 実行ファイルの場合は * などなどを表示する
list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)







# abspath -> realpath に似ている。NAMES内の各要素の絶対パスを取得。ファイルやディレクトリが存在するかどうかはチェックしない。
# -s	--symbolic	ハードリンクの代わりにシンボリックリンクを作成する
# -f	--force	リンクファイルと同じ名前のファイルがあっても強制的に上書きする
# -n	--no-dereference	リンクの作成場所として指定したディレクトリがシンボリックリンクだった場合、参照先にリンクを作るのではなく、シンボリックリンクそのものを置き換える（-fと組み合わせて使用）
# -v	--verbose	経過を表示する
deploy: ## Create symlink to home directory
	@echo 'Copyright (c) 2013-2015 BABAROT All Rights Reserved.'
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)


init: ## Initialize the environment. This assumed to be performed only once.
	@echo '==> Start to initialize environment.'
	@echo ''
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)


clean: ## Remove the dot files and this repo
	@echo 'Remove dot files in your home directory...'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)





# 下記が出力される
# clean                          Remove the dot files and this repo
# help                           Self-documented Makefile
# install                        Create symlink to home directory
# list                           Show dot files in this repo
help: ## Self-documented Makefile
	@echo "Usage: make SUB_COMMAND argument_name=argument_value"
	@echo ""
	@printf "\033[36m%-30s\033[0m %s\n" "[Sub command]" "[Description]"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'