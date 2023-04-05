class BooksController < ApplicationController
  def show
    @book = current_user.books.find(params[:id])
  end

  def edit
    @book = current_user.books.find(params[:id])
  end

  def update
    @book = current_user.books.find(params[:id])
    if @book.update(detail_params)
      render :show
    else
      flash.now[:alert] = "更新失敗"
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    # フォームオブジェクトにはuniquenessのバリデーションを与えられない
    # 個々のモデルに与える方法しかない
    # 現状放置
    @register_book_form = RegisterBookForm.new(book_params)
    if @register_book_form.valid?
      @register_book_form.save
      redirect_to user_path(current_user.id), notice: "読書を開始しよう"
    else
      flash.now[:alert] = "保存失敗"
      render :search
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
     @results = Kaminari.paginate_array(books_search(params[:search])).page(params[:page]).per(20)
    end
  end

  def detail
    @isbn = params[:isbn_10]
    @book = book_search(params[:isbn_10])
  end

  private

  def book_params
    params.require(:register_book_form).permit(
      :title, :author, :published_date, :publisher, :description, :thumbnail,
      :page_count, :isbn_10, :isbn_13, :done_up_to, :rating, :finished,
      :category, :headline, :content
    ).merge(user_id: current_user.id)
  end

  def detail_params
    params.require(:book).permit(:title, :author, :published_date, :publisher,
                                  :page_count)
  end                               
  # 自身のIDに対応する登録した図書を取得するメソッド
  def set_book
    @book = current_user.books.find_by(id: params[:id])
    redirect_to books_path, alert: "権限がありません" if @book.nil?
  end

  def books_search(keyword)
    url = "https://www.googleapis.com/books/v1/volumes"
    res = Faraday.get(url, q: keyword, langRedstrict: 'JP', maxResults: 40)
    books_data = JSON.parse(res.body)
    data_hash = []
    books_data['items']&.each do |data|
      if data['volumeInfo']['industryIdentifiers'].present?
        unless data['volumeInfo']['industryIdentifiers'][0]['type'] == 'OTHER'
          isbn_10 = nil
          isbn_13 = nil
          data['volumeInfo']['industryIdentifiers'].each do |isbn|
            case isbn['type']
            when 'ISBN_10'
              isbn_10 = isbn['identifier']
            when 'ISBN_13'
              isbn_13 = isbn['identifier']
            end
          end
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
                            page_count: data['volumeInfo']['pageCount'],
                            isbn_10: isbn_10,
                            isbn_13: isbn_13
                          })
        end
        logger.debug(data['volumeInfo']['industryIdentifiers'])
      end
    end
    return data_hash
  end

  def book_search(keyword)
    url = "https://www.googleapis.com/books/v1/volumes"
    res = Faraday.get(url, q: keyword, langRedstrict: 'JP', maxResults: 1)
    books_data = JSON.parse(res.body)
    data_hash = []
    books_data['items']&.each do |data|
      if data['volumeInfo']['industryIdentifiers'][0]['type'] == 'ISBN_10'
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
                          page_count: data['volumeInfo']['pageCount'],
                          isbn_10: data['volumeInfo']['industryIdentifiers'][0]['identifier'],
                          isbn_13: data['volumeInfo']['industryIdentifiers'][1]['identifier']
                        })
      end
    end
    return data_hash[0]
  end
end