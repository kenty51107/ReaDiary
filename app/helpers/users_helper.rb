module UsersHelper
  def calc_percent(book)
    done_up_to = latest_record(book).done_up_to
    return 0 if done_up_to.zero?

    done_up_to * 100 / book.page_count
  end

  def latest_record(book)
    book.records.order(created_at: :desc).limit(1)[0]
  end

  def first_record(book)
    book.records.order(created_at: :asc).limit(1)[0]
  end
end
