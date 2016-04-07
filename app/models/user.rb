class User
  attr_accessor :id, :first_name, :last_name, :email, :image, :image_slug, :motto

  def initialize(input_options)
    @id = input_options["id"]
    @first_name = input_options["firstName"]
    @last_name = input_options["lastName"]
    @email = input_options["email"]
    @image = input_options["image"]
    @image_slug = input_options["image_slug"]
    @motto = input_options["motto"]
  end
end