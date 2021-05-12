class PagesController < ApplicationController

  def index
    @pages = Page.all
  end

  def rules
    
  end
end
