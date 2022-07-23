import 'package:flutter/material.dart';
import 'package:local_restaurants/view/login_page.dart';
import 'package:provider/provider.dart';

import '../view_model/search_view_model.dart';
import '../widgets/countries_listView.dart';
import '../widgets/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchViewModel>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text('Sign out'))
        ],
      ),
      body: Column(
        children: [
          Expanded(flex: 1, child: SearchBar()),
          const Expanded(flex: 6, child: CountriesListView())
        ],
      ),
    ));
  }
}
