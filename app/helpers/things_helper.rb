module ThingsHelper
  def thing_link(thing)
    link_to thing.name, thing_path(thing)
  end
end
