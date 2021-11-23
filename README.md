# mail notification on MATLB

## 概要

MATLABプログラムの処理終了時にメール通知を送るスクリプトです．  
メールアドレスと実行ファイルを設定することで，Eメールで終了通知を送信できます．
※ SMTPサーバには，YahooメールもしくはGmailを使用します．

## デモンストレーション

後日追記します．

## 使い方

### メール設定

1. メールを送信するために，Yahooメール<推奨>もしくはgmail<非推奨>のアドレスを用意します．

2. 送信元アドレスにGmailを使用する場合，以下のリンクにアクセスして送信用のgmailアドレスの設定「安全性の低いアプリの許可」を「有効」にしてください．
    * https://myaccount.google.com/lesssecureapps
    * この操作により対象のgmailアカウントのセキュリティが低下するため，Yahooメールの使用を推奨します．

3. `set_mail.m`を開いて，変数「Mail.sendAdd」と「Mail.receiveAdd」に，使用するメールアドレスを記述します．

4. gmailを使用する場合，`set_mail.m`の変数「use_Gmail_for_sendmail」をtrueに変更します．
    * 使用しない場合はfalseにします

### メイン処理の設定

実行したい処理を`user_script.m`に記述します．
    * もしくは，実行したいスクリプトをディレクトリに配置して，`mail_notification.m`を書き換えます．
        * 例えば，`./main.m`を実行して，メール通知を受け取りたい場合は，`main;`と記述します．


### 実行方法
1. `mail_notification.m`を実行します．
    * 上部タブのエディターより，`実行`ボタンを押すか，コマンドウィンドウに`mail_notification`と入力します．

2. 入力ウィンドウに送信メールのパスワード(SMTPサーバのパスワード)を入力します．
    * テキストは平文で表示されますが，入力履歴などには残りません．
    * 入力文字列(password)はSMTPサーバの認証後，すぐにclearされます．

3. 確認メールが送信された後，ユーザースクリプトが実行されます．

4. プログラムの処理終了時にメールが通知されます．


## ファイル構成

* `mail_notification.m` :メインスクリプト
* `send_mail_script/`   :メール送信に使用するMATLABスクリプト
    * `set_mail.m`      :SMTPサーバへの接続設定を行うスクリプト
    * `send_mail.m`     :動作終了時にメール通知を送信するスクリプト
* `user_script.m`       :サンプル用の実行ファイル
* `README.md`           :README

## ライセンス
* 後日追記します

---

参考リンク
* https://qiita.com/bbhomejp/items/4ce1c26d3ba4a2018e5a
* https://jp.mathworks.com/matlabcentral/answers/463184-m-m
* https://jp.mathworks.com/matlabcentral/answers/93362-
* https://jp.mathworks.com/help/matlab/ref/inputdlg.html

作成日：2021/10/13 tomiokario