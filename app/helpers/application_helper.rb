module ApplicationHelper
  def get_twitter_card_info(h)
    twitter_card = {}
    if h.present?
      twitter_card[:url] = "https://showmyday.herokuapp.com/?h=#{h}"
      twitter_card[:image] = "https://s3-ap-northeast-1.amazonaws.com/myday-production/images/#{h}.png"
    else
      twitter_card[:url] = 'https://showmyday.herokuapp.com/'
      twitter_card[:image] = 'https://s3-ap-northeast-1.amazonaws.com/myday-production/images/zxvwoqod.png'
    end
    twitter_card[:title] = 'いちにちをシェア'
    twitter_card[:card] = 'summary_large_image'
    twitter_card[:description] = '自分の１日をかんたんにTwitterでシェアできるサービスです'
    twitter_card
  end

  def get_twitter_card_info_year(h)
    twitter_card = {}
    if h.present?
      twitter_card[:url] = "https://showmyday.herokuapp.com/year?h=#{h}"
      twitter_card[:image] = "https://s3-ap-northeast-1.amazonaws.com/myday-production/images/#{h}.png"
    else
      twitter_card[:url] = 'https://showmyday.herokuapp.com/year'
      twitter_card[:image] = 'https://s3-ap-northeast-1.amazonaws.com/myday-production/images/xekls0rq.png'
    end
    twitter_card[:title] = 'いちねんをシェア'
    twitter_card[:card] = 'summary_large_image'
    twitter_card[:description] = '自分の今年１年をかんたんにTwitterでシェアできるサービスです'
    twitter_card
  end

  def get_twitter_card_info_radar(h)
    twitter_card = {}
    if h.present?
      twitter_card[:url] = "https://showmyday.herokuapp.com/radar?h=#{h}"
      twitter_card[:image] = "https://s3-ap-northeast-1.amazonaws.com/myday-production/images/#{h}.png"
    else
      twitter_card[:url] = 'https://showmyday.herokuapp.com/radar'
      twitter_card[:image] = 'https://s3-ap-northeast-1.amazonaws.com/myday-production/images/xekls0rq.png'
    end
    twitter_card[:title] = 'いちねんのさいてん'
    twitter_card[:card] = 'summary_large_image'
    twitter_card[:description] = 'あなたの今年１年の採点をかんたんにTwitterでシェアできるサービスです'
    twitter_card
  end
end
