class ListsController < ApplicationController

  def home
  end

  def index
    @lists = List.all
  end
end
