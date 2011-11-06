class TagsController < ApplicationController
  def index
    @tags = Thing.tags_with_weight.sort { |a,b| b[1] <=> a[1] }
  end

  def things
    @tag = params[:tag]

    # sort by weight
    @things = Kaminari.paginate_array(Thing.tagged_with(@tag)).page(params[:page])
  end
end
