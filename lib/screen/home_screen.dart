import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/data/model/category.dart';
import 'package:news/provider/theme_provider.dart';
import 'package:news/screen/widgets/category/category.dart';
import 'package:news/screen/widgets/category_fragment.dart/category_fragment.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(color: AppColors.white),
                child: Center(
                  child: Text(
                    "News App",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = null;
                        });
                        Navigator.of(
                          context,
                        ).pop();
                      },
                      child: ListTile(
                        title: Text(
                          "Go To Home",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        leading: Icon(
                          Icons.home_outlined,
                          color: AppColors.white,
                        ),
                      ),
                    ),

                    Divider(color: AppColors.white),
                    ListTile(
                      title: Text(
                        "Them",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      leading: Icon(
                        Icons.light_mode_outlined,
                        color: AppColors.white,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.white),
                      ),
                      child: DropdownButton<String>(
                        barrierDismissible: true,
                        iconEnabledColor: AppColors.white,
                        isExpanded: true,
                        dropdownColor: AppColors.black,
                        value: themeProvider.isDarkMode ? "Dark" : "Light",
                        underline: const SizedBox(),

                        style: Theme.of(context).textTheme.headlineLarge,
                        items: const [
                          DropdownMenuItem(
                            value: "Light",
                            child: Text("Light"),
                          ),
                          DropdownMenuItem(value: "Dark", child: Text("Dark")),
                        ],
                        onChanged: (value) {
                          if (value == "Dark") {
                            themeProvider.setDarkMode(true);
                          } else {
                            themeProvider.setDarkMode(false);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(selectedCategory?.name ?? "Home", style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,

      ),
      body: selectedCategory == null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: CategoryFragment(onCategoryItemClick: onCategoryItemClick),
            )
          : CategoryDetails(category: selectedCategory!),
    );
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newSelectedItemCategory) {
    selectedCategory = newSelectedItemCategory;
    setState(() {});
  }
}
