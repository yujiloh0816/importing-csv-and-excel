# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# importing-csv-and-excel

* app/view/products/index
* multipart: true
- 参考　https://doruby.jp/users/katsuo_on_rails/entries/rails_
-
multipartオプションがないと
例えば
「tanuki.jpeg」という画像の場合、
「tanuki.jpeg」というファイル名だけをstringとして受け取ってしまう訳です。

- 参考　https://qiita.com/akishin/items/32e17717b1cff149572d
Rails4 の form_for は multipart: true を省略可能

* config/routes
- collection
- 参考　https://railsguides.jp/routing.html
- post HTTPアクションで poriductsコントローラーのimportアクションにrouteする。

* config/application.rb
- require 'csv'
- Rubyの標準ライブラリを読み込むためには、requireの後にライブラリ名を入れることで読み込むことができます。
- 参考　https://www.sejuku.net/blog/16111
- https://docs.ruby-lang.org/ja/latest/library/csv.html


* app/model/product.rb
- .path
- 参考　https://docs.ruby-lang.org/ja/latest/method/File/i/path.html
- オープン時に使用したパスを文字列で返します。

- headers: true
- 一行目をヘッダとして読み取る

- rowの中身
- #<CSV::Row "name":"Technodrome" "price":"27.99" "released_on":"2019-05-28">
- rowをto_hashにすることで（header: trueのため）headerが keyになり、2行目以降が値がvalueとなる。

app/models/product.rb

product = self.find_or_initialize_by(id: row["id"])
rowのidは文字列のため、row[:id]ではなく、row["id"]で取り出す。
取り出したidの数値は文字列返ってくるが、self.find_by_id(row["id"])でしっかり検索してくれるみたい。

attributes()
Returns a hash of all the attributes with their names as keys and the values of the attributes as values.

# 代入できうようにクラスを整える。
# product.attributes means Product => Hash
# row.to_hash means CSV::Row => Hash
