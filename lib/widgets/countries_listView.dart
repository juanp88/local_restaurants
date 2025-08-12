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

    if (countriesList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'No countries found',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Try a different search term',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: countriesList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final country = countriesList[index];
        return Semantics(
          button: true,
          label: '${country.name}, capital: ${country.capital}',
          child: CountryTile(
            name: country.name.toString(),
            capital: country.capital.toString(),
          ),
        );
      },
    );
  }
}
