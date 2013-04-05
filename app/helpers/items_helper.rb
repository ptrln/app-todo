module ItemsHelper

  def complete_hidden_tag(complete)
    if complete
      hidden_field_tag "item[is_complete]", false
    else
      hidden_field_tag "item[is_complete]", true
    end.html_safe
  end

  def complete_button(complete, f)
     if complete
       f.submit("Incomplete", class: "btn btn-warning")
     else
       f.submit("Complete", class: "btn btn-success")
     end.html_safe
  end
end
