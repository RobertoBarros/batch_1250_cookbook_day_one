class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    @recipes = load_csv if File.exist?(@csv_file_path)
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end

  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def load_csv
    recipes = []
    CSV.foreach(@csv_file_path) do |row|
      name = row[0]
      description = row[1]
      recipe = Recipe.new(name, description)
      recipes << recipe
    end
    recipes
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end

    end
  end
end
