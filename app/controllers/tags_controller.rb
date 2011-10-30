class TagsController < ApplicationController
  def show
    @tag = params[:tag]
  end

  def things
    @tag = params[:tag]
    @things = Thing.tagged_with(@tag)
  end

  def accounts
    @tag = params[:tag]
  end
end
