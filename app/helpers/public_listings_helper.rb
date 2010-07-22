# Methods added to this helper will be available to all templates in the application.
module PublicListingsHelper

  def display(tag, field)
    if !@listing.errors.on(field.to_sym).nil?
      "<div class='fieldWithErrors'>#{tag}</div>"
    else
      tag
    end
  end

end
