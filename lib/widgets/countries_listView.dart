import 'package:flutter/material.dart';
import 'package:local_restaurants/view_model/search_view_model.dart';
import 'package:provider/provider.dart';

import '../models/country.dart';
import 'country_tile.dart';

class CountriesListView extends StatelessWidget {
  const CountriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchViewModel>(context, listen: true);
    List<Country> countriesList = searchProvider.countryList;
    if (searchProvider.filteredCountry != '') {
      countriesList = countriesList
          .where((country) => country.name!.toLowerCase().contains(
              searchProvider.filteredCountry.toString().toLowerCase()))
          .toList();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: countriesList.length,
        itemBuilder: ((context, index) {
          Country country = countriesList[index];
          // implementar country tile
          return CountryTile(
              name: country.name.toString(),
              capital: country.capital.toString());
        }),
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}
