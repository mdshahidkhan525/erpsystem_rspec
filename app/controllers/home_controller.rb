class HomeController < ApplicationController
  def index
  end

  def about
  end

  def result
    @result = Result.all
  end
end
