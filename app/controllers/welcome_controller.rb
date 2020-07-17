class WelcomeController < ApplicationController

  def hello_world
    render(plain: "hello_world")
  end

  def root
  end

  def contact_us
  end

  def process_contact
    # byebug

    get_name
    @email = params[:email]
    @message = params[:message]

    render :thank_you
  end

  private

  def get_name

    if params[:full_name] != ""
      @full_name = params[:full_name]
    else
      @full_name = "My Friend"
    end
  end


end
