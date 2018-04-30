class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    visitor = Visitor.find_by(id: session[:user])
  end
end
