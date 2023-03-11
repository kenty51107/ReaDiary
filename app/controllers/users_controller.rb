class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @books = current_user.books.all
    @reading = current_user.books.where(id: Record.where(finished: false).select(:book_id)).page(params[:page]).per(10)
    @finished = current_user.books.where.not(id: Record.where(finished: false).select(:book_id)).page(params[:page]).per(10)
    @user = current_user

    @cats = {
      '無分類': 0,
      'ビジネス': 0,
      '文芸': 0,
      '一般・教養': 0,
      '旅行ガイド': 0,
      '趣味実用': 0,
      '自己啓発': 0,
      'こども': 0,
      '教育・学習': 0
    }

    @subcats = {
      '無分類': {
        '無分類': 0
      },
      'ビジネス': {
        'ビジネス書': 0,
        '経営実務書': 0,
        '投資・資産運用': 0,
        'その他': 0
      },
      '文芸': {
        'ミステリー・サスペンス': 0,
        '冒険・アクション小説': 0,
        '青春・恋愛小説': 0,
        '時代・歴史小説': 0,
        'ホラー・幻想小説': 0,
        '経済小説': 0,
        '戦争シミュレーション小説': 0,
        'その他の小説': 0,
        'エッセイ': 0,
        '詩歌集': 0,
        '官能小説': 0,
        'その他': 0
      },
      '一般・教養': {
        '一般書': 0,
        'ノンフィクション': 0,
        '科学・テクノロジー': 0,
        'コンピュータ・IT': 0,
        '歴史・地理': 0,
        'その他': 0
      },
      '旅行ガイド': {
        '海外旅行ガイド': 0,
        '国内旅行ガイド': 0,
        '紀行文': 0,
        '旅行会話': 0,
        'その他': 0
      },
      '趣味実用': {
        'コミック': 0,
        'スポーツ': 0,
        'アウトドア': 0,
        '健康': 0,
        '料理': 0,
        '食・グルメ': 0,
        '手芸': 0,
        '女性向け': 0,
        '恋愛・結婚・離婚': 0,
        'ファッション・美容': 0,
        'ペット': 0,
        'エンターテイメント': 0,
        'タレント本': 0,
        '写真集・画集': 0,
        'その他': 0
      },
      '自己啓発': {
        '自己啓発': 0,
        'スピリチュアル': 0,
        '勉強・資格': 0,
        'その他': 0
      },
      'こども': {
        '占い・おまじない・心理ゲーム': 0,
        '児童文学・絵本': 0,
        '図鑑・自由研究': 0,
        'その他': 0
      },
      '教育・学習': {
        '教育図書': 0,
        '語学ー英語': 0,
        '語学ーその他の言語': 0
      }
    }

    @books&.each do |book|
      @cats[book.record.category.to_sym] += 1
      @subcats[book.record.category.to_sym][book.record.subcategory.to_sym] += 1
    end
  end
end
