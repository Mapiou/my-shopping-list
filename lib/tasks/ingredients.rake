namespace :ingredients do
  desc "Enriching a specific user with ingredients"
  task import: :environment do
    puts "User's email address?"
    input = $stdin.gets.chomp
    user = User.find_by(email: input)
    if user.nil?
      puts "Email address not found!"
    else
      puts "########## Creating ingredients... ##########"
      filepath = File.join(Rails.root, 'lib', 'tasks', 'data', 'ingredients.json')
      serialized_ingredients = File.read(filepath)
      ingredients = JSON.parse(serialized_ingredients)

      ingredients.each do |attributes|
        ingredient = Ingredient.new(attributes)
        ingredient.user = user
        ingredient.save!
        puts "Created #{ingredient.name}"
      end
      puts "########## Ingredients created! ##########"
    end
  end
end
