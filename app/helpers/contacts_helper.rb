module ContactsHelper

  def display(tag, field)
    if @contact.errors.invalid? field
      "<div class='fieldWithErrors'>#{tag}</div>"
    else
      tag
    end
  end

end
