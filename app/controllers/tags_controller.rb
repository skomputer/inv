class TagsController < ApplicationController
  def index
    @tags = Thing.tags_with_weight.sort { |a,b| b[1] <=> a[1] }
  end

  def things
    @tag = params[:tag]

    # sort by weight
    @things = Thing.tagged_with(@tag)    
  end
end
