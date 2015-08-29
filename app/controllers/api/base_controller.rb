class Api::BaseController < ActionController::Base

  def render_with_protection(json_content)
    render content_type: 'application/json', text: ")]}',\n" + json_content
  end

  protected

  def verified_request?
    super || form_authenticity_token == request.headers['X_XSRF_TOKEN']
  end

end