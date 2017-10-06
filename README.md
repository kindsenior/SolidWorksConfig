# SolidWorksConfig
This package is config files of SolidWorks

- SolidWorks2016が推奨
-- 2017でも動くらしいが若干不具合がでる場合がある

- 設定方法
  - cygwinにてscripts/install-setting-file.shを実行してsettings/swSettings_\<User Name\>.sldregを生成
  - SolidWorksを起動して設定の保存/回復→設定の回復で生成したsldregファイルを指定して次へ
  - 完了

- 使い方
  - 発注図面出力
    - 単体部品での出力する場合
      - 出力したい図面ファイルを開く
      - レイアウト表示タブの「SaveAsPDFandDXFandIGS」を押す(デスクトップにファイルが作成される)
    - アセンブリ単位(ロボットとかリンクとか)での一斉出力する場合
      - 出力したいアセンブリファイルを開く
      - order-listをテーブルテンプレートとして部品表を挿入
      - 部品表から個数,表面処理,発注先等の各種プロパティを設定
      - アセンブリタブの「PrepareToOrder」を押す
      - フォームから発注先と出力ディレクトリを指定して「Export Files」を押す
  - 板金展開図面作成
    - 展開図面を作成したい部品の図面ファイルを開く
    - レイアウト表示タブの「AddFlatPatternSheet」を押す

- ファイルプロパティについて
  - プロパティの値の設定方法：タスクパネル->ユーザー定義プロパティ
  - プロパティの追加方法：タスクパネル->SOLIDWORKSリソース->プロパティタブビルダー
