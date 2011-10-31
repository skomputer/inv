module PlacesHelper
  def place_link(place)
    link_to place.name, place_things_path(place)
  end
end
