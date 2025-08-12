import 'package:flutter/material.dart';
import 'package:local_restaurants/view/login_page.dart';
import 'package:provider/provider.dart';

import '../view_model/search_view_model.dart';
import '../widgets/countries_listView.dart';
import '../widgets/custom_search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Restaurants'),
        centerTitle: true,
        elevation: 0,
        actions: [
          Tooltip(
            message: 'Sign out',
            child: IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Trigger refresh in provider
          Provider.of<SearchViewModel>(context, listen: false).setFilteredCountry('');
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Find Restaurants',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Discover amazing restaurants around the world',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const CustomSearchBar(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverFillRemaining(
                child: CountriesListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
