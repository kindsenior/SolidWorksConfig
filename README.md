# SolidWorksConfig
This package is config files of SolidWorks

- 推奨・条件
  - SolidWorks2016が推奨．2017でも動くらしいが若干不具合がでる場合がある
  - cygwinまたはgit-bashが必要(bash on windowsは未対応)

- 設定方法
  1. cygwinまたはgit-bashにてscripts/install-setting-file.shを実行してsettings/swSettings_\<User Name\>.sldregを生成
  1. SolidWorksを起動して設定の保存/回復→設定の回復で生成したsldregファイルを指定して次へ
  1. 完了

- 使い方
  - 発注図面のワンクリック出力(pdf,dxf,iges)
    - 単体部品での出力する場合
      1. 出力したい図面ファイルを開く
      1. レイアウト表示タブの「SaveAsPDFandDXFandIGS」を押す(デスクトップにファイルが作成される)
    - アセンブリ単位(ロボットとかリンクとか)での一斉出力する場合
      1. 出力したいアセンブリファイルを開く
      1. order-listをテーブルテンプレートとして部品表を挿入
      1. 部品表から個数,表面処理,発注先等の各種プロパティを設定
      1. アセンブリタブの「PrepareToOrder」を押す
      1. フォームから発注先と出力ディレクトリを指定して「Export Files」を押す
  - 板金展開図面のワンクリック作成
    1. 展開図面を作成したい部品の図面ファイルを開く
    1. レイアウト表示タブの「AddFlatPatternSheet」を押す

- ファイルプロパティについて
  - プロパティの値の設定方法：タスクパネル->ユーザー定義プロパティ
  - プロパティの追加方法：タスクパネル->SOLIDWORKSリソース->プロパティタブビルダー
