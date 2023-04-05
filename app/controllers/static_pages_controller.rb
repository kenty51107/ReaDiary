class StaticPagesController < ApplicationController
  def index
    @user = User.new
    books = Book.all

    @data = []
    books.each do |book|
      if book[:isbn_10].present?
        flag = true
        if !@data.empty?
          @data&.each do |d|
            if d[:isbn_10] == book[:isbn_10]
              d[:number] += 1
              flag = false
              next
            end
          end
        else
          @data.push({
            title: book[:title],
            thumbnail: book[:thumbnail],
            isbn_10: book[:isbn_10],
            number: 1,
          })
          flag = false
        end
        if flag
          @data.push({
            title: book[:title],
            thumbnail: book[:thumbnail],
            isbn_10: book[:isbn_10],
            number: 1,
          })
        end
      end
    end
    logger.debug("##############{@data}")
    @data.sort_by! { |d| d[:number] }.reverse!
    logger.debug("##############{@data}")
  end
end