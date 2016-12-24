module ApplicationHelper
  def auth_token
    html = "<input type=\"hidden\" name=\"authenticity_token\" "
    html += "value=\"#{form_authenticity_token}\">"

    html.html_safe
  end

  def errors?(type)
    messages = type.errors.full_messages
    html = ""

    unless messages.empty?
      messages.each do |message|
        html += "<ul><li> #{h(message)} </li></ul>"
      end
    end

    html.html_safe
  end
end
