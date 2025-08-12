import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../models/restaurant.dart';
import '../services/restaurant_service.dart';
import '../l10n/app_localizations.dart';
import '../widgets/restaurant_card.dart';
import '../widgets/shimmer_loading.dart';

class RestaurantsPage extends StatefulWidget {
  final String cityName;
  final String countryName;

  const RestaurantsPage({
    super.key,
    required this.cityName,
    required this.countryName,
  });

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage>
    with TickerProviderStateMixin {
  final RestaurantService _restaurantService = RestaurantService();
  List<Restaurant> _restaurants = [];
  bool _isLoading = true;
  String? _error;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _loadRestaurants();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _loadRestaurants() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final restaurants = await _restaurantService.getRestaurantsByCity(
        widget.cityName,
        widget.countryName,
      );

      if (mounted) {
        setState(() {
          _restaurants = restaurants;
          _isLoading = false;
        });
        _fadeController.forward();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _refreshRestaurants() async {
    await _loadRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: theme.colorScheme.onSurface,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.restaurantsIn(widget.cityName),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            Text(
              widget.countryName,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary.withValues(alpha: 0.05),
              theme.colorScheme.surface,
              theme.colorScheme.surface,
            ],
          ),
        ),
        child: RefreshIndicator(
          onRefresh: _refreshRestaurants,
          child: _buildContent(theme, l10n),
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData theme, AppLocalizations l10n) {
    if (_isLoading) {
      return const ShimmerLoading();
    } else if (_error != null) {
      return _buildErrorState(theme, l10n);
    } else if (_restaurants.isEmpty) {
      return _buildEmptyState(theme, l10n);
    } else {
      return FadeTransition(
        opacity: _fadeAnimation,
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: _restaurants.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final restaurant = _restaurants[index];
            return FadeInUp(
              duration: Duration(milliseconds: 300 + (index * 100)),
              delay: Duration(milliseconds: index * 50),
              child: RestaurantCard(restaurant: restaurant),
            );
          },
        ),
      );
    }
  }

  Widget _buildErrorState(ThemeData theme, AppLocalizations l10n) {
    return FadeIn(
      duration: const Duration(milliseconds: 600),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BounceInDown(
                duration: const Duration(milliseconds: 800),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme.colorScheme.error.withValues(alpha: 0.1),
                        theme.colorScheme.error.withValues(alpha: 0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Icon(
                    Icons.error_outline,
                    size: 48,
                    color: theme.colorScheme.error,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  l10n.errorLoadingRestaurants,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FadeInUp(
                delay: const Duration(milliseconds: 400),
                child: Text(
                  l10n.checkConnectionAndTryAgain,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              FadeInUp(
                delay: const Duration(milliseconds: 600),
                child: FilledButton.icon(
                  onPressed: _refreshRestaurants,
                  icon: const Icon(Icons.refresh),
                  label: Text(l10n.tryAgain),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme, AppLocalizations l10n) {
    return FadeIn(
      duration: const Duration(milliseconds: 600),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BounceInDown(
                duration: const Duration(milliseconds: 800),
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
                    Icons.restaurant_outlined,
                    size: 48,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  l10n.noRestaurantsFound,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              FadeInUp(
                delay: const Duration(milliseconds: 400),
                child: Text(
                  l10n.tryDifferentCityOrCheckLater,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
