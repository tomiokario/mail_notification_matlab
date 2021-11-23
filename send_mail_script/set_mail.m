% 送信アドレス・サーバー設定を行うスクリプト（mail_notification.mで使用）

% 送信元サーバの設定
if use_Gmail_for_sendmail
    setpref('Internet','SMTP_Server','smtp.gmail.com');         % Gmailサーバー
else
    setpref('Internet','SMTP_Server','smtp.mail.yahoo.co.jp');  % Yahoo サーバー
end


% SMTP設定
setpref('Internet','E_mail',Mail.sendAdd);
setpref('Internet','SMTP_Username',Mail.sendAdd);

% パスワード

Dlg.prompt = {'送信元アドレスのパスワードを入力してください．（入力履歴は保存されません．SMTPサーバへの接続後，パスワードは即座にclearされます）'}; % フィールドリスト
Dlg.dlgtitle = 'Connect SMTP Server';                    % ウィンドウタイトル
Dlg.dims = [1 40];                                       % 編集フィールドの高さはテキスト1行分，幅は40文字単位
password = inputdlg(Dlg.prompt,Dlg.dlgtitle,Dlg.dims);           % 入力
setpref('Internet','SMTP_Password',password);        % 認証
clear password;                                      % パスワードを削除

% Java設定
Mail.Props = java.lang.System.getProperties;
Mail.Props.setProperty('mail.smtp.auth','true');
Mail.Props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
Mail.Props.setProperty('mail.smtp.socketFactory.port','465');

%==========================================================================
% 計算しているパソコン名の取得
[~,Mail.PC_name]=dos('hostname'); %PC名の取得

%==========================================================================
% メールタイトル
Mail.mailTitle=strcat('【MATLAB】Start calculation at ',Mail.PC_name);   
% メール本文
Mail.mailMessage=strcat('Calculation start at:',datestr(now),'(DD-MMM-YYYY hh:mm:ss)');

%==========================================================================
disp("失敗した場合，パスワードが間違っている可能性があります");
% メールの送信
% 送信先アドレス(Mail.receiveAdd)にタイトル(Tmp.mailTitle)，メール文章(Tmp.mailMessage)のメールを送信
sendmail(Mail.receiveAdd,Mail.mailTitle,Mail.mailMessage); %メール送信
disp("メールの送信に成功しました．");