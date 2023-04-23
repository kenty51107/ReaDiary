module StaticPagesHelper
  def generate_rating(rating)
    rating = rating.to_f
    case rating
    when 0..1.2
      return "1"
    when 1.3..1.7
      return "1-5"
    when 1.8..2.2
      return "2"
    when 2.3..2.7
      return "2-5"
    when 2.8..3.2
      return "3"
    when 3.3..3.7
      return "3-5"
    when 3.8..4.2
      return "4"
    when 4.3..4.7
      return "4-5"
    when 4.8..5
      return "5"
    end
  end
end
