% mail_notification：プログラム終了後にメール通知を行うMATLABスクリプト
% 使い方はREADME.mdを参照してください．

% ========================ユーザー設定変数========================
% メールアドレス
Mail.sendAdd    = 'YOUR_DOMAIN1@yahoo.co.jp';   % 送信メールアドレス(Yahooメール<推奨> or gmail)
Mail.receiveAdd = 'YOUR_DOMAIN2@gmail.com';     % 受信メールアドレス(gmailを推奨)

use_Gmail_for_sendmail=false;                   % 送信元アドレスにgmailを使用する場合は「true」にする

% 実行プログラムの指定
main_file_path = "user_script.m";               % 実行スクリプトの相対PATHを記入
% =============================================================

% ------------------
% メールサーバーへの接続 
% ------------------
disp("メールサーバの設定を行います");
run("send_mail_script/set_mail");

% ---------
% メイン処理
% ---------
disp("メインタスクを開始します");
try
    % プログラムの実行
    run(main_file_path);
catch ERR
    % 失敗時の処理
    disp("");
    disp("処理に失敗しました．");
    disp("************ error message ************");
    disp(ERR.message);
    disp("***************************************");
end

% ----------
% メールの送信
% ----------
disp("メールを送信します");
run("send_mail_script/send_mail");
