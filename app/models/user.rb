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

  def fancy_name
    "#{first_name} #{last_name}, Esquire"
  end

  def self.all
    user_hashes = Unirest.get("http://localhost:3000/api/v1/users").body
    users = []
    user_hashes.each do |user_hash|
      users << User.new(user_hash)
    end
    users
  end

  def self.find_by(input_options)
    user_hash = Unirest.get("http://localhost:3000/api/v1/users/#{input_options[:id]}").body
    User.new(user_hash)
  end

  def self.create(input_options)
    user_hash = Unirest.post(
      "http://localhost:3000/api/v1/users",
      headers: { "Accept" => "application/json" },
      parameters: input_options
    ).body
    User.new(user_hash)
  end

  def update(input_options)
    user_hash = Unirest.patch(
      "http://localhost:3000/api/v1/users/#{id}",
      headers: { "Accept" => "application/json" },
      parameters: input_options
    ).body
    User.new(user_hash)
  end

  def destroy
    Unirest.delete("http://localhost:3000/api/v1/users/#{id}").body
  end
end