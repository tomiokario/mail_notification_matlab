% Eメールアドレスに終了通知を送るスクリプト（mail_notification.mで使用）

%メール本文   
Mail.hasError = exist('ERR','var');  % エラー情報を取得
if Mail.hasError ==1
   %エラーがあれば、メールのタイトルにエラー通知(Tmp.mailTitle)、内容にエラー文(Mail.errorMsg)を含むメッセージ(Tmp.mailMessage)を指定　
   Mail.errorMsg=ERR.message; %エラー文を取得
   Mail.mailTitle=strcat('【MATLAB】Error from ',Mail.PC_name); %エラーメールタイトル
   Mail.mailMessage=strcat('プログラムはエラーにより途中終了しました:  ',Mail.errorMsg); %エラーメッセージ
else    
   %エラーが無ければ、メールのタイトルに計算完了通知(Tmp.mailTitle)、内容にメッセージ(Tmp.mailMessage)を指定　　           
   Mail.mailTitle=strcat('【MATLAB】Finish Calculation from:',Mail.PC_name);   
   Mail.mailMessage=strcat('Finished Time :',datestr(now),'(DD-MMM-YYYY hh:mm:ss)');
end

%メールの送信
%送信先アドレス(Mail.receiveAdd)にタイトル(Tmp.mailTitle)，メール文章(Tmp.mailMessage)のメールを送信
sendmail(Mail.receiveAdd,Mail.mailTitle,Mail.mailMessage); %メール送信