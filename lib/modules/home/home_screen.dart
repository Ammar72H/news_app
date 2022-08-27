import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/modules/home/menu.dart';
import 'package:news/modules/home/tabs_controller.dart';
import 'package:news/shared/network/remote/api_manager.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'News App',
            style: TextStyle(fontSize: 22),
          ),
          backgroundColor: Color(0xFF39A552),
          toolbarHeight: 90,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),



      ),


      body: Container(
        child: FutureBuilder<SourcesResponse>(
          future: ApiManager.getSources(),
          builder: (c, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapShot.hasError) {
              return Column(
                children: [
                  Text('Something went wrong'),
                  ElevatedButton(onPressed: () {}, child: Text('try again ')),
                ],
              );
            }
            if ("ok" != snapShot.data?.status) {
              return Column(
                children: [
                  Text('Something went wrong'),
                  ElevatedButton(onPressed: () {}, child: Text('try again ')),
                ],
              );
            }

            //  I Have Data
            var SourcesList = snapShot.data?.sources ?? [];
            return TabControllerItem(SourcesList);
          },
        ),
      ),

    );
  }
}
