module ApplicationHelper
  def alert_class type
    case type
    in "notice" then "alert-success"
    in "alert" then "alert-danger"
    end
  end

  def alert_image type
    case type
    in "notice" then "check-circle.svg"
    in "alert" then "exclamation-circle.svg"
    end
  end
end
