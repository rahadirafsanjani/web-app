class TurboDeviseController < ApplicationController
  class Responder < ActionController::Responder
    def to_turbo_stream
      controller.render(options.merge(formats: :html))
    rescue ActionView::MissingTemplate => error
        raise(error) if get?
        render(rendering_options.merge(formats: :html, status: :unprocessable_entity)) if has_errors? && default_action
        redirect_to navigation_location
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_stream
end