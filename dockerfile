FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

# apt-get で利用するパッケージダウンロード元のリポジトリを日本のサーバに変更 日本ではネットワーク通信時間が減少
RUN sed --in-place=.backup 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

# Advanced Package Tool(apt):Debian系のパッケージ管理ツール

# パッケージリスト /etc/apt/sources.list に基づいて
# パッケージインデックスファイルを /var/lib/apt/lists に作る
# RUN apt-get update

# パッケージインデックスファイルを消して容量削減
# RUN rm --recursive --force /var/lib/apt/lists/*

# # localesのインストール
# RUN apt-get install --assume-yes locales

# # ロケール環境の定義
# RUN localedef --inputfile=en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# 環境変数の設定
# hostname
# ENV HOSTNAME toutatsu
# language
ENV LANG en_US.utf8

# 設定を~/.bashrcに追加
# prompt color
RUN echo 'export PS1="\[\[\e[0;35m\]\s \[\e[0;32m\]\u\[\e[m\]@\[\e[0;36m\]\H\[\e[m\]:\[\e[0;33m\]\w\[\e[m\] [ \D{%Y/%m/%d} ] command:\# \! UID:\$\n$ "' >> ~/.bashrc

WORKDIR /workspace

RUN ls -la

RUN pip install --upgrade pip
RUN pip install visdom
RUN pip install numpy
RUN pip install torchvision
RUN pip install matplotlib
RUN pip install IPython