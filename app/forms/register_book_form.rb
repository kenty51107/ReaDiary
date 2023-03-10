class RegisterBookForm
  include ActiveModel::Model # バリデーションやレンダーなどが使えるようにするため
  # extend CarrierWave::Mount # モデル以外でCarrierWaveを使用するため

  # 使用したい属性を読み書きできるようにしてform_withの引数として利用する
  attr_accessor :user_id, :title, :author, :published_date, :publisher,
                :description, :thumbnail, :page_count, :isbn_10, :isbn_13, :done_up_to,
                :rating, :finished, :category, :subcategory, :name

  # バリデーションの設定
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :author, presence: true, length: { maximum: 50 }
  validates :page_count, presence: true
  validates :isbn_10, presence: true, length: { is: 10 }
  validates :isbn_13, presence: true, length: { is: 13 }
  validates :category, presence: true
  validates :subcategory, presence: true

  # CarrierWaveで使用するuploaderをマウントする

  # delegate :メソッド, to: :モデル名 / フォームのアクションのPOST, PATCHを自動で切り替えてくれる
  # delegate :persisted?, to: :book

  # Formオブジェクトの値の初期化
  def initialize(attributes = nil, book: Book.new, record: Record.new)
    @book = book
    @record = record
    # @tag = tag
    attributes ||= default_attributes
    super(attributes)
  end

  # ActiveRecordを継承していないため、saveメソッドを手入力で定義
  def save
    ActiveRecord::Base.transaction do
      book = Book.create(user_id:, title:, author:, published_date:, publisher:,
                         description:, thumbnail:, page_count:, isbn_10:, isbn_13:)
      Record.create(book_id: book.id, done_up_to:, rating:,
                    finished:, category:, subcategory:)
      # tag = Tag.create(name: nil)
      # TagRelationship.create(book_id: book.id, tag_id: tag.id)

      # @err_msg = book.errors.full_messages
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  # def update_book
  #   ActiveRecord::Base.transaction do
  #     book.update(user_id:, title:, author:, published_date:, publisher:,
  #       description:, thumbnail:, page_count:)
  #     Record.where(book_id: book.id).update(book_id: book.id, done_up_to:,
  #       content:, rating:, finished:, category:, subcategory:)
  #   end
  # rescue ActiveRecord::RecordInvalid
  #   false
  # end

  private

  attr_reader :book, :record#, :tag

  def default_attributes
    {
      user_id: book.user_id,
      title: book.title,
      author: book.author,
      published_date: book.published_date,
      publisher: book.publisher,
      description: book.description,
      thumbnail: book.thumbnail,
      page_count: book.page_count,
      isbn_10: book.isbn_10,
      isbn_13: book.isbn_13,
      done_up_to: record.done_up_to,
      rating: record.rating,
      finished: record.finished,
      category: record.category,
      subcategory: record.subcategory,
    }
  end
end