class BooksController < ApplicationController
  def show
    @book = current_user.books.find(params[:id])
    # @tag = @book.tags

  end

  def create
    # フォームオブジェクトにはuniquenessのバリデーションを与えられない
    # 個々のモデルに与える方法しかない
    # 現状放置
    @register_book_form = RegisterBookForm.new(book_params)
    if @register_book_form.valid?
      @register_book_form.save
      redirect_to user_path(current_user.id), status: :see_other, notice: "読書を開始しよう"
    else
      flash.now[:alert] = "保存失敗"
      render :search, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(current_user.id), notice: "読書記録を削除しました。"
  end

  def search
    @register_book_form = RegisterBookForm.new
    if params[:search].blank?
      flash[:error] = "検索ワードを入力して下さい。"
    else
      kw = params[:search]
      url = "https://www.googleapis.com/books/v1/volumes"
      res = Faraday.get(url, q: kw, langRedstrict: 'JP', maxResults: 40)
      books_data = JSON.parse(res.body)
      data_hash = []
      books_data['items']&.each do |data|
        thumbnail = if data['volumeInfo']['imageLinks'].nil?
                      'noimage.png'
                    else
                      data['volumeInfo']['imageLinks']['thumbnail']
                    end
        data_hash.push({
                         title: data['volumeInfo']['title'],
                         author: data['volumeInfo']['authors'],
                         published_date: data['volumeInfo']['publishedDate'],
                         publisher: data['volumeInfo']['publisher'],
                         description: data['volumeInfo']['description'],
                         thumbnail:,
                         page_count: data['volumeInfo']['pageCount']
                       })
        data['volumeInfo']['industryIdentifiers']&.each do |identifier|
          case identifier['type']
          when 'ISBN_10'
            data_hash.last[:isbn_10] = identifier['identifier']
          when 'ISBN_13'
            data_hash.last[:isbn_13] = identifier['identifier']
          end
        end
      end
      @results = Kaminari.paginate_array(data_hash).page(params[:page]).per(9)
    end
  end

  private

  def book_params
    # mergeメソッドでログインユーザーが入力したパラメータにログインユーザーのidを追加する
    params.require(:register_book_form).permit(
      :title, :author, :published_date, :publisher, :description, :thumbnail,
      :page_count, :isbn_10, :isbn_13, :done_up_to, :rating, :finished,
      :category, :subcategory, :name
    ).merge(user_id: current_user.id)
  end

  # 自身のIDに対応する登録した図書を取得するメソッド
  def set_book
    @book = current_user.books.find_by(id: params[:id])
    redirect_to books_path, alert: "権限がありません" if @book.nil?
  end
end