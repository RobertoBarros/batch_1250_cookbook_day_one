class View

  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_name
    puts "Enter recipe name:"
    gets.chomp
  end

  def ask_description
    puts "Enter recipe description:"
    gets.chomp
  end

  def ask_index
    puts "Enter recipe number to remove:"
    gets.chomp.to_i - 1
  end
end
