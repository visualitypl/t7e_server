module ApplicationHelper

  def language_flag(iso)
    if iso == "en"
      "gb"
    else
      iso
    end
  end
end
