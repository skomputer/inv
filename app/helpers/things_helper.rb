module ThingsHelper
  def thing_link(thing)
    link_to thing.name, thing_path(thing)
    link_to thing.salable, salable_thing_path(thing)
  end
end
