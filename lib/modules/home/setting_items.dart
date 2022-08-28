import 'package:flutter/material.dart';
import 'package:news/modules/home/show_bottom_sheet_langage.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';

class SettingItems extends StatefulWidget {

  @override
  State<SettingItems> createState() => _SettingItemsState();
}

class _SettingItemsState extends State<SettingItems> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProviderApp>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Languages',
              style: Theme.of(context).textTheme.subtitle1),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              ShowBottomSheetLanguage();
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    provider.AppLanguage == 'en' ? 'English' : 'العربية',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                )),
          ),


        ],
      ),
    );
  }

  void ShowBottomSheetLanguage() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ShowlanguageBottomSheet();
        });
  }
}
