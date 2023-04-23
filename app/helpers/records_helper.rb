module RecordsHelper
  def classfy_record(status)
    case status
    when 0, 1
      '読書記録'
    when 2
      'レビュー'
    end
  end

  def classfy_attribute(status)
    case status
    when 0, 1
      'comment'
    when 2
      'review'
    end
  end
end
