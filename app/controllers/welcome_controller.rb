class WelcomeController < ApplicationController

  def hello_world
    render(plain: "hello_world")
  end

  def root
  end

end
