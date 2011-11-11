module ThingsHelper
  def thing_link(thing)
    name = (thing.quantity.nil? || thing.quantity.empty?) ? thing.name : "#{thing.name} (#{thing.quantity})"
    link_to name, thing_path(thing)
  end
end
