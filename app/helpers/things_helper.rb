module ThingsHelper
  def thing_link(thing)
    link_to thing.name, thing_path(thing)
    link_to thing.salable, things_salable_path(thing)
  end
end
