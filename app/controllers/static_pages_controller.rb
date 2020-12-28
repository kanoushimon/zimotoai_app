class StaticPagesController < ApplicationController
  def home
    
    @local_media = LocalMedium.all
    @media_hokkaidou = @local_media.where(prefecture: "北海道")
    @media_aomori = @local_media.where(prefecture: "青森県")
    @media_iwate = @local_media.where(prefecture: "岩手県")
    @media_akita = @local_media.where(prefecture: "秋田県")
    @media_miyagi = @local_media.where(prefecture: "宮城県")
    @media_yamagata = @local_media.where(prefecture: "山形県")
    @media_hukushima = @local_media.where(prefecture: "福島県")
    @media_totigi = @local_media.where(prefecture: "栃木県")
    @media_ibaragi = @local_media.where(prefecture: "茨城県")
    @media_tiba = @local_media.where(prefecture: "千葉県")
    @media_tokyo = @local_media.where(prefecture: "東京都")
    @media_saitama = @local_media.where(prefecture: "埼玉県")
    @media_gunma = @local_media.where(prefecture: "群馬県")
    @media_kanagawa = @local_media.where(prefecture: "神奈川県")
    @media_nigata = @local_media.where(prefecture: "新潟県")
    @media_nagano = @local_media.where(prefecture: "長野県")
    @media_yamanashi = @local_media.where(prefecture: "山梨県")
    @media_shizuoka = @local_media.where(prefecture: "静岡県")
    @media_toyama = @local_media.where(prefecture: "富山県")
    @media_gihu = @local_media.where(prefecture: "岐阜県")
    @media_aiti = @local_media.where(prefecture: "愛知県")
    @media_ishikawa = @local_media.where(prefecture: "石川県")
    @media_hukui = @local_media.where(prefecture: "福井県")
    @media_shiga = @local_media.where(prefecture: "滋賀県")
    @media_mie = @local_media.where(prefecture: "三重県")
    @media_kyoto = @local_media.where(prefecture: "京都府")
    @media_nara = @local_media.where(prefecture: "奈良県")
    @media_osaka = @local_media.where(prefecture: "大阪府")
    @media_wakayama = @local_media.where(prefecture: "和歌山県")
    @media_hyogo = @local_media.where(prefecture: "兵庫県")
    @media_tokushima = @local_media.where(prefecture: "徳島県")
    @media_kagawa = @local_media.where(prefecture: "香川県")
    @media_kouti = @local_media.where(prefecture: "高知県")
    @media_ehime = @local_media.where(prefecture: "愛媛県")
    @media_tottori = @local_media.where(prefecture: "鳥取県")
    @media_okayama = @local_media.where(prefecture: "岡山県")
    @media_shimane = @local_media.where(prefecture: "島根県")
    @media_hiroshima = @local_media.where(prefecture: "広島県")
    @media_yamaguti = @local_media.where(prefecture: "山口県")
    @media_hukuoka = @local_media.where(prefecture: "福岡県")
    @media_oita = @local_media.where(prefecture: "大分県")
    @media_miyazaki = @local_media.where(prefecture: "宮崎県")
    @media_kumamoto = @local_media.where(prefecture: "熊本県")
    @media_saga = @local_media.where(prefecture: "佐賀県")
    @media_nagasaki = @local_media.where(prefecture: "長崎県")
    @media_kagoshima = @local_media.where(prefecture: "鹿児島県")
    @media_okinawa = @local_media.where(prefecture: "沖縄県")
   
    @modals = {"modal-hokkaidou": @media_hokkaidou, 
    "modal-aomori": @media_aomori, "modal-iwate": @media_iwate, "modal-akita": @media_akita, "modal-miyagi": @media_miyagi, "modal-yamagata": @media_yamagata, "modal-hukushima": @media_hukushima,
    "modal-ibaragi": @media_ibaragi, "modal-totigi": @media_totigi, "modal-saitama": @media_saitama, "modal-gunma": @media_gunma, "modal-tokyo": @media_tokyo, "modal-tiba": @media_tiba, "modal-kanagawa": @media_kanagawa,
    "modal-yamanashi": @media_yamanashi, "modal-nigata": @media_nigata, "modal-nagano": @media_nagano, "modal-shizuoka": @media_shizuoka, "modal-toyama": @media_toyama, "modal-gihu": @media_gihu, "modal-aiti": @media_aiti, "modal-ishikawa": @media_ishikawa, 
    "modal-hukui": @media_hukui, "modal-mie": @media_mie, "modal-nara": @media_nara, "modal-shiga": @media_shiga, "modal-kyoto": @media_kyoto, "modal-osaka": @media_osaka, "modal-wakayama": @media_wakayama, "modal-hyogo": @media_hyogo, 
    "modal-tottori": @media_tottori, "modal-okayama": @media_okayama, "modal-shimane": @media_shimane, "modal-hiroshima": @media_hiroshima, "modal-yamaguti": @media_yamaguti, 
    "modal-kagawa": @media_kagawa, "modal-tokushima": @media_tokushima, "modal-ehime": @media_ehime, "modal-kouti": @media_kouti, 
    "modal-hukuoka": @media_hukuoka, "modal-oita": @media_oita, "modal-miyazaki": @media_miyazaki, "modal-kagoshima": @media_kagoshima, "modal-kumamoto": @media_kumamoto, "modal-saga": @media_saga, "modal-nagasaki": @media_nagasaki,"modal-okinawa": @media_okinawa}         
    
    @todays_key, @todays_value = @modals.to_a.sample
    @todays_prefecture = @todays_value.where_values_hash["prefecture"]
    
  end

  def about
  end
  
  def contact
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      flash[:info] = "思い出シェアにはログインが必要です。"
      redirect_to login_path
    end
  end
  
  def random_key 
    @todays_key = self.keys.shuffle[0]
    return self[@todays_key]
  end 
end
