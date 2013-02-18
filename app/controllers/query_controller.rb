class QueryController < ApplicationController
  def create
  end

  def show
  end

  def index
    @total_users = User.all.count
    @queries = Query.all(:order => "created_at DESC")
    respond_to do |format|
      format.html
    end
  end

  def update
  end

  def delete
  end
end
