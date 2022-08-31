import 'package:flutter/material.dart';
import 'package:news/modules/home/setting_items.dart';

class HomeDrawer extends StatefulWidget {

  static const int CATEGORY=1;
  static const int SETTING=2;

  Function onMenuItemClicked;
  HomeDrawer(this.onMenuItemClicked);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width * .70,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 55),
            width: double.infinity,
            child:Center(child: Text('News App',style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 25,color: Colors.white
            ),)) ,
          ),
          InkWell(
            onTap: (){
              widget.onMenuItemClicked(HomeDrawer.CATEGORY);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                Icon(Icons.list,color: Colors.black,),
                SizedBox(width: 8,),
                Text('Categories',style: TextStyle(fontSize: 21),)
              ],),
            ),
          ),
          InkWell
            (
            onTap: (){
              widget.onMenuItemClicked(HomeDrawer.SETTING);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                Icon(Icons.settings,color: Colors.black,),
                SizedBox(width: 8,),
                Text('Settings',style: TextStyle(fontSize: 21),)
              ],),
            ),
          )


        ],
      ),
    );
  }
}