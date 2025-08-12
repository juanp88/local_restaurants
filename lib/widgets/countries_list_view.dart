import 'package:flutter/material.dart';
import 'package:local_restaurants/view_model/search_view_model.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import '../models/country.dart';
import 'country_tile.dart';
import 'shimmer_loading.dart';

class CountriesListView extends StatelessWidget {
  const CountriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchViewModel>(context, listen: true);
    List<Country> countriesList = searchProvider.countryList;

    // Show loading shimmer if data is being fetched
    if (countriesList.isEmpty && searchProvider.filteredCountry == '') {
      return const ShimmerLoading();
    }

    if (searchProvider.filteredCountry != '') {
      countriesList = countriesList
          .where((country) => country.name!.toLowerCase().contains(
              searchProvider.filteredCountry.toString().toLowerCase()))
          .toList();
    }

    if (countriesList.isEmpty) {
      return _buildEmptyState(context);
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: ListView.separated(
        key: ValueKey('countries_list_${countriesList.length}'),
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: countriesList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final country = countriesList[index];
          // Only animate the first few items to avoid lag
          if (index < 3) {
            return FadeInUp(
              duration: const Duration(milliseconds: 250),
              delay: Duration(milliseconds: index * 50),
              child: Semantics(
                button: true,
                label: '${country.name}, capital: ${country.capital}',
                child: CountryTile(
                  name: country.name.toString(),
                  capital: country.capital.toString(),
                ),
              ),
            );
          } else {
            // No animation for items beyond the first 3 to improve performance
            return Semantics(
              button: true,
              label: '${country.name}, capital: ${country.capital}',
              child: CountryTile(
                name: country.name.toString(),
                capital: country.capital.toString(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);

    return FadeIn(
      duration: const Duration(milliseconds: 200),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideInDown(
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary.withValues(alpha: 0.1),
                      theme.colorScheme.secondary.withValues(alpha: 0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Icon(
                  Icons.search_off_outlined,
                  size: 48,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(height: 24),
            FadeInUp(
              delay: const Duration(milliseconds: 50),
              child: Text(
                'No countries found',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(height: 12),
            FadeInUp(
              delay: const Duration(milliseconds: 100),
              child: Text(
                'Try adjusting your search terms\nor check your spelling',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            FadeInUp(
              delay: const Duration(milliseconds: 150),
              child: FilledButton.tonal(
                onPressed: () {
                  Provider.of<SearchViewModel>(context, listen: false)
                      .setFilteredCountry('');
                },
                child: const Text('Clear Search'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
