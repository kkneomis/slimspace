class ErrorsController < ApplicationController
  layout "error_page"

  def not_found
    @page = request.original_url
    render(:status => 404)
  end

  def internal_server_error
    render(:status => 500)
  end
end
