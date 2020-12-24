# README

TheoryApp

## 概要

ファッションブランドTheoryのアプリ。ECサイト機能にメッセージ機能を追加しました。また、メッセージ欄にURLを送る事でお客様と直接やり取りする(ビデオ通話機能みたいなもの)事ができます。

## コンセプト

Theoryのアプリ

## バージョン

Ruby 2.5.6 Rails 5.2.4

## 機能一覧

* メッセージ機能(メッセージでURLを送るとビデオ通話ができるようになります)
* ログイン機能
* ユーザー登録、編集機能、管理者機能
    * メールアドレス、名前、パスワードは必須
* 以下ECサイト機能
* 商品登録、削除、編集機能
    * 商品登録、編集、削除機能は管理者のみ実行可能
*  あいまい検索機能
* 商品一覧表示機能
* お気に入り機能
* カート機能
* 以下後日実装予定
    * 最新ニュース配信機能、LOOK、Shop Blog、Staff Snap、検索機能、ポイント機能




## カタログ設計、テーブル定義

<https://docs.google.com/spreadsheets/d/1qqWovGZYgOg300z--Z-mOAL3JfEfLFZsg62kRqB52wk/edit?pli=1#gid=0>


## ER図
<https://drive.google.com/file/d/1L5uv_WseViduZVlbTmVB4pIwLdnAXprv/view?usp=sharing>

## 画面遷移図
<https://drive.google.com/file/d/1pPj-y2RaxZkfSV_4JtTdksIrXCC6ylNS/view?usp=sharing>

## 画面ワイヤーフレーム
<https://drive.google.com/file/d/12e4-Nf-7XWsGhF25FBu-cQNNxhI3fiOz/view?usp=sharing>

## 使用予定Gem

* carrierwave
* mini_magick

## English Ver

## README

TheoryApp

### Overview

Theory app.
Video call function (format to send URL by message) and chat function have been added to the EC site function.

## Concept
Theory's APP

## Version

Ruby 2.5.6 Rails 5.2.4

## Functions list

Catalog design,Table_Definition,Screen transition diagram,,Wire frame
<https://docs.google.com/spreadsheets/d/1qqWovGZYgOg300z--Z-mOAL3JfEfLFZsg62kRqB52wk/edit?pli=1#gid=0>
<https://drive.google.com/file/d/1L5uv_WseViduZVlbTmVB4pIwLdnAXprv/view?usp=sharing>
<https://drive.google.com/file/d/1pPj-y2RaxZkfSV_4JtTdksIrXCC6ylNS/view?usp=sharing>
<https://drive.google.com/file/d/12e4-Nf-7XWsGhF25FBu-cQNNxhI3fiOz/view?usp=sharing>


* Login function
* User registration function
    * Email address, name and password required
* User editing function
* Administrator function
* Product registration, deletion, editing function
    * Product registration, editing, and deletion functions can only be executed by the administrator
* Product list display function
* Product order history list function
* Favorite function
* Fuzzy search function
* Advanced cart features
* Message function (You can make a video call by sending the URL in the message)

## To be used Gem

* carrierwave
* mini_magick
