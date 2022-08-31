import 'package:flutter/material.dart';
import 'package:news/modules/home/categorys_fragment.dart';
import 'package:news/modules/home/news_fragment.dart';
import 'package:news/modules/home/search.dart';
import 'package:news/modules/home/setting_items.dart';
import '../../models/category_models.dart';
import 'home_drawer.dart';

class HomeScreen extends StatefulWidget {

  static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            // Navigate to the Search Screen
            IconButton(
                onPressed: () {

                  showSearch(context: context, delegate: NewsSearch());

                },

                icon: const Icon(Icons.search,size: 30,))
          ],
          backgroundColor: Color(0xFF39A552),
          toolbarHeight: 90,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: true,
          title: Text('${selectedCategory?.title==null?'News App..!':selectedCategory?.title}'),
        ),

        drawer: HomeDrawer(onMenuItemClicked),
           body:Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
            ),
            ),child:  selectedCategory==null?CategoriesFragment(onCatgoryClicked)
              :NewsFragment(selectedCategory!)

           )  );


  }

  Category? selectedCategory;
  SettingItems? settingItems;



  void onMenuItemClicked(int itemCliked){
    Navigator.pop(context);

    if(itemCliked==HomeDrawer.CATEGORY){
      selectedCategory=null;
      setState(() {

      });
    }else if(itemCliked==HomeDrawer.SETTING){
      SettingItems();
      setState((){

      });
    }

  }

  void onCatgoryClicked(Category category){
    // change ui body
    selectedCategory=category;
    setState(() {

    });
  }
  void onSettingClicked(Category category){
    // change ui body
    settingItems=SettingItems();
    setState(() {

    });
  }

}
// settingItems==null?SettingItems():NewsFragment(selectedCategory!),

