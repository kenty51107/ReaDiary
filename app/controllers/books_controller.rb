class BooksController < ApplicationController
  def search
    # @register_book_form = RegisterBookForm.new
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
end
