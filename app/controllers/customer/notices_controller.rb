class Customer::NoticesController < Customer::ApplicationController
  def index
    @notices = []
    if current_customer.confirmed_at.blank?
      @notices << {
        type: 'alert',
        title: '登録の確認メールをご確認ください',
        description: '現在お客様は「仮登録」の状態となります。<br>ご登録いただいたメールアドレスに届いている確認メールに<br>記載のURLをクリックして会員登録を完了させてください。',
      }
    end
    if current_customer.in_review?
      @notices << {
        type: 'info',
        title: '本人確認書類を確認中です',
        description: 'ご登録いただいた本人確認書類を確認しております。<br>確認完了後にこちらのお知らせは非表示となります。<br>今しばらくお待ちくださいませ。',
      }
    end
    if current_customer.denied?
      @notices << {
        type: 'alert',
        title: '本人確認書類を再提出してください',
        description: 'ご登録いただいた本人確認書類を確認しました結果<br>書類に不備がございましたので今一度<br>本人確認書類をご提出ください。',
      }
    end
  end
end