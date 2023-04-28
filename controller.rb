require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # Pegar todas as receitas
    recipes = @cookbook.all

    # Mandar a view mostrar as receitas
    @view.display_list(recipes)
  end

  def add
    # Perguntar o nome da receita
    name = @view.ask_name
    # Perguntar a descrição da receita
    description = @view.ask_description

    # Criar uma instância de Recipe
    recipe = Recipe.new(name, description)

    # Criar a receita no cookbook
    @cookbook.create(recipe)
  end

  def remove
    # Mostrar todas receitas
    list

    # Perguntar o número da receita a ser removida
    index = @view.ask_index

    # Mandar o cookbook apagar a receita pelo index
    @cookbook.destroy(index)
  end

end
