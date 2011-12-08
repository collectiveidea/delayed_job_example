class MessagesController < ApplicationController
  before_filter :require_authentication, :only => [:create, :destroy]

  def index
    @message = current_user && current_user.messages.build
  end

  def create
    message = current_user.messages.build(params[:message])
    message.save
    redirect_to root_path
  end

  def destroy
  end
end
