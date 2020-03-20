class Recipe {
    var name: String
    var ingredients: String
    var instructions: String
    
    init(ingredients: String, instructions: String, name: String){
        self.name = name
        self.ingredients = ingredients
        self.instructions = instructions
    }
}
