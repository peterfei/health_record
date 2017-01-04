module DeviseHelper
  ##重写devise_error_messages! 方法
  def devise_error_messages!

    flash_alerts = []
    error_key = 'errors.messages.not_saved'

    if !flash.empty?
      flash_alerts.push(flash[:error]) if flash[:error]
      flash_alerts.push(flash[:alert]) if flash[:alert]
      flash_alerts.push(flash[:notice]) if flash[:notice]
      error_key = 'devise.failure.invalid'
    end

    return "" if resource.errors.empty? && flash_alerts.empty?
    errors = resource.errors.empty? ? flash_alerts : resource.errors.full_messages

    messages = errors.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div id="alert alert-info">
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

end
