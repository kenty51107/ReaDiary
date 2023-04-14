module UsersHelper
  def calc_percent(book)
    record = book.records.order(created_at: :desc).limit(1)[0].done_up_to
    if record == 0
      return 0
    else
      logger.debug(record / book.page_count * 100)
      return record / book.page_count * 100
    end
  end

  def latest_record(book)
    book.records.order(created_at: :desc).limit(1)[0]
  end

  def first_record(book)
    book.records.order(created_at: :asc).limit(1)[0]
  end
end
