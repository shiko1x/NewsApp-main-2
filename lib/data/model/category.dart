import 'package:news/core/consts/app_image.dart';

class Category {
  final String id;
  final String image;
  final String name;

  Category({required this.id, required this.image, required this.name});

  static List<Category> listCategory(bool isDarkMode) {
    return [
      Category(id: "general", image:isDarkMode? AppImage.general:AppImage.generalDark, name: "General"),
      Category(id: "business", image:isDarkMode?AppImage.busniess:AppImage.busniessDark, name: "Busniess"),
      Category(id: "sports", image:isDarkMode? AppImage.sport :AppImage.sportDark, name: "Sports"),
      Category(id: "technology", image:isDarkMode? AppImage.technology :AppImage.technologyDark, name: "Technology"), 
      Category(id: "entertainment", image: isDarkMode? AppImage.entertainment:AppImage.entertainmentDark, name: "Entertainment"),
      Category(id: "health", image:isDarkMode? AppImage.health:AppImage.healthDark, name: "Health"),
      Category(id: "science", image:isDarkMode? AppImage.science:AppImage.scienceDark, name: "Science"),
    ];
  }
}


//* business - entertainment - general - health - science - sports - technology

