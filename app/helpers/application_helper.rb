module ApplicationHelper
  def breadcrumb_helper(paths)
    s = '<ul class="breadcrumb"><li><a href="/">Index</a> <span class="divider">/</span></li>'
    paths.each do |path|
      if path.last
        s += "<li><a href='#{path.last}'>#{path.first}</a> <span class='divider'>/</span></li>"
      else
        s += "<li class='active'>#{path.first}</li>"
      end
    end
    s + "</ul>"
    s.html_safe
  end

  def complete_label(complete)
    if complete
      '<span class="label label-success">Complete</span>'.html_safe
    else
      '<span class="label label-warning">Incomplete</span>'.html_safe
    end
  end
end
