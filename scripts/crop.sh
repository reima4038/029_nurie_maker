#!/bin/sh
# $1: input_file
# $2: output_file
# ref. https://blog.s0014.com/posts/2017-11-21-imagemagick/

mogrify \
-auto-orient \
-resize "1200x1200>" \
-gravity Center \
-extent 1024x1024 \
-background white \
$1 $2


# mogrify                 => ImageMagickの一括変換コマンド
# -auto-orient            => 画像の向きを自動修正
# -resize "300x300^"      => 画像を拡大縮小 「^」は短辺基準「>」は長辺基準
# -gravity Center         => 切り抜きの基準位置
# -extent 300x300         => 画像の切り抜きサイズ
# -background transparent => 背景色 透明
# ./input-images/*        => 入力フォルダ
