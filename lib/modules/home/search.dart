import 'package:flutter/material.dart';

import '../../models/NewsResponse.dart';
import '../../shared/network/remote/api_manager.dart';
import '../news/news_item.dart';

class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          showResults(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon:  Icon(Icons.clear,color: Colors.black,),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(searchKeyword: query),
        builder: (_, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapShot.hasError) {
            return Container(
                decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover,
              )),
              child: Column(
                children: [
                  Center(child: Text('Something went wrong')),
                  ElevatedButton(onPressed: () {}, child: Text('Try Again')),
                ],
              ),
            );
          }
          if ("ok" != snapShot.data?.status) {
            // error
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/pattern.png'),
                    fit: BoxFit.cover,
                  )),
              child: Column(
                children: [
                  Center(child: Text('Something went wrong')),
                  ElevatedButton(onPressed: () {}, child: Text('Try Again')),
                ],
              ),
            );
          }

          var newsList = snapShot.data?.articles ?? [];
          return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (c, index) {
                return NewsItem(newsList[index]);
                // return Text(newsList[index].title ?? "");
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover,
              )));

  }

}
// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(50),
//               bottomLeft: Radius.circular(50),
//             ),
//           ),
//         toolbarHeight: 90,
//         iconTheme: Theme.of(context).iconTheme,
//         // The search area here
//           title: Container(
//             width: double.infinity,
//             height: 40,
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(5)),
//             child: Center(
//               child: TextField(
//                 style: TextStyle(color: Colors.black,fontSize: 18),
//                 decoration: InputDecoration(
//                     prefixIcon:IconButton(
//                         icon:  Icon(Icons.search),
//                       onPressed: () {
//                           showSearch(context: context, delegate: NewsSearsh());
//                       },
//                     ),
//
//                     suffixIcon: IconButton(
//                       icon:  Icon(Icons.clear,color: Colors.black,),
//                       onPressed: () {
//                         /* Clear the search field */
//                         Navigator.pop(context);
//                       },
//                     ),
//                     hintText: 'Search...',
//                     hintStyle: TextStyle(color: Colors.black,fontSize: 15),
//                     border: InputBorder.none
//                 ),
//               ),
//             ),
//           )),
//               body: Container(
//               decoration: BoxDecoration(
//               image: DecorationImage(
//               image: AssetImage('assets/images/pattern.png'),
//               fit: BoxFit.cover,
//               ),
//               ),
//     ),
//
//     );
//   }
//   void _clearTextField() {
//     // Clear everything in the text field
//     _controller.clear();
//     // Call setState to update the UI
//     setState(() {});
//   }
// }

