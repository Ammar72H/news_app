import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
        toolbarHeight: 90,
        iconTheme: Theme.of(context).iconTheme,
        // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                style: TextStyle(color: Colors.black,fontSize: 18),
                decoration: InputDecoration(
                    prefixIcon:IconButton(
                        icon: const Icon(Icons.search),
                      onPressed: () {

                      },
                    ),

                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear,color: Colors.black,),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.black,fontSize: 15),
                    border: InputBorder.none
                ),
              ),
            ),
          )),
              body: Container(
              decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover,
              ),
              ),
    ),
    );
  }
}
