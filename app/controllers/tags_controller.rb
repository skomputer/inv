class TagsController < ApplicationController
  def index
    @tags = Thing.tag_counts
  end

  def things
    @tag = params[:tag]

    # sort by weight
    @things = Kaminari.paginate_array(Thing.tagged_with(@tag)).page(params[:page])
  end
end
