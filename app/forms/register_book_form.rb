class RegisterBookForm
  include ActiveModel::Model # バリデーションやレンダーなどが使えるようにするため

  # 使用したい属性を読み書きできるようにしてform_withの引数として利用する
  attr_accessor :user_id, :title, :author, :published_date, :publisher,
                :description, :thumbnail, :page_count, :isbn_10, :isbn_13, :done_up_to,
                :rating, :status, :category, :headline, :content

  # バリデーションの設定
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :author, presence: true, length: { maximum: 50 }
  validates :page_count, presence: true
  validates :isbn_10, presence: true, length: { is: 10 }
  validates :isbn_13, presence: true, length: { is: 13 }
  validates :category, presence: true

  # Formオブジェクトの値の初期化
  def initialize(attributes = nil, book: Book.new, record: Record.new)
    @book = book
    @record = record
    attributes ||= default_attributes
    super(attributes)
  end

  # ActiveRecordを継承していないため、saveメソッドを手入力で定義
  def save
    ActiveRecord::Base.transaction do
      book = Book.create(user_id:, title:, author:, published_date:, publisher:,
                         description:, thumbnail:, page_count:, isbn_10:, isbn_13:)
      Record.create(book_id: book.id, done_up_to:, rating:,
                    status:, category:, headline:, content:)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  private

  attr_reader :book, :record

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
      status: record.status,
      category: record.category,
      headline: record.headline,
      content: record.content
    }
  end
end
