class Drink {
  final String? id;
  final String? name;
  final String? instructions;
  final String? ingredient;
  final String? image;
  final String? glass;
  final String? ingredient1;
  final String? ingredient3;
  final String? ingredient4;
  final String? ingredient5;
  final String? category;

  Drink({
    required this.glass,
    required this.id,
    required this.name,
    required this.instructions,
    required this.ingredient,
    required this.image,
    required this.ingredient1,
    required this.ingredient3,
    required this.ingredient4,
    required this.ingredient5,
    required this.category,
  });

  factory Drink.fromJson(Map<String, dynamic> json) => //factory constructor

      Drink(
        id: json['idDrink'],
        name: json['strDrink'],
        instructions: json['strInstructions'],
        ingredient: json['strIngredient2'],
        image: json['strDrinkThumb'],
        glass: json['strGlass'],
        ingredient1: json['strIngredient1'],
        ingredient3: json['strIngredient3'],
        ingredient4: json['strIngredient4'],
        ingredient5: json['strIngredient5'],
        category: json['strCategory'],
      );

  get strIngredient2 => null;

  Map<String, dynamic> toJson() => {
        'idDrink': id,
        'strDrink': name,
        'strInstructions': instructions,
        'strIngredient2': ingredient,
        'strDrinkThumb': name,
        'strGlass': glass,
        'strIngredient1': ingredient1,
        'strIngredient3': ingredient3,
        'strIngredient4': ingredient4,
        'strIngredient5': ingredient5,
        'strCategory': category,
      };
}
