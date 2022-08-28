import 'package:flutter/material.dart';
import 'package:news/modules/home/categorys_fragment.dart';
import 'package:news/modules/home/news_fragment.dart';
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
          title: Text('News app'),
        ),
        drawer: HomeDrawer(onMenuItemClicked),
        body: selectedCategory==null?CategoriesFragment(onCatgoryClicked)
            :NewsFragment(selectedCategory!)
    );
  }

  Category? selectedCategory;


  void onMenuItemClicked(int itemCliked){
    Navigator.pop(context);

    if(itemCliked==HomeDrawer.CATEGORY){
      selectedCategory=null;
      setState(() {

      });
    }else if(itemCliked==HomeDrawer.SETTING){

    }

  }

  void onCatgoryClicked(Category category){
    // change ui body
    selectedCategory=category;
    setState(() {

    });
  }
}