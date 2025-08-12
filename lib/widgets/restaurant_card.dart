import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../l10n/app_localizations.dart';

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  // bool _isPressed = false; // Removed as it's not used

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _elevationAnimation = Tween<double>(
      begin: 0.0,
      end: 8.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
  }

  void _onTapCancel() {
    _animationController.reverse();
  }

  void _onTap() {
    // Show restaurant details in a bottom sheet or navigate to details page
    _showRestaurantDetails();
  }

  void _showRestaurantDetails() {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                // Handle bar
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(20),
                    child: _buildRestaurantDetails(l10n),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRestaurantDetails(AppLocalizations l10n) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Restaurant image
        if (widget.restaurant.imageUrl != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              widget.restaurant.imageUrl!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.restaurant,
                    size: 64,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                );
              },
            ),
          ),
        const SizedBox(height: 20),

        // Restaurant name and rating
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                widget.restaurant.name ?? l10n.unknownRestaurant,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (widget.restaurant.rating != null)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.restaurant.rating!.toStringAsFixed(1),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),

        // Cuisine and price range
        Row(
          children: [
            if (widget.restaurant.cuisine != null) ...[
              Chip(
                label: Text(widget.restaurant.cuisine!),
                backgroundColor: theme.colorScheme.secondaryContainer,
                labelStyle: TextStyle(
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
              const SizedBox(width: 8),
            ],
            if (widget.restaurant.priceRange != null)
              Chip(
                label: Text(widget.restaurant.priceRange!),
                backgroundColor: theme.colorScheme.tertiaryContainer,
                labelStyle: TextStyle(
                  color: theme.colorScheme.onTertiaryContainer,
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),

        // Address
        if (widget.restaurant.address != null) ...[
          _buildDetailRow(
            Icons.location_on_outlined,
            l10n.address,
            widget.restaurant.address!,
            theme,
          ),
          const SizedBox(height: 12),
        ],

        // Phone
        if (widget.restaurant.phoneNumber != null) ...[
          _buildDetailRow(
            Icons.phone_outlined,
            l10n.phone,
            widget.restaurant.phoneNumber!,
            theme,
          ),
          const SizedBox(height: 12),
        ],

        // Opening hours
        if (widget.restaurant.openingHours != null) ...[
          _buildDetailRow(
            Icons.access_time_outlined,
            l10n.openingHours,
            widget.restaurant.openingHours!,
            theme,
          ),
          const SizedBox(height: 12),
        ],

        // Status
        _buildDetailRow(
          widget.restaurant.isOpen == true
              ? Icons.check_circle_outlined
              : Icons.cancel_outlined,
          l10n.status,
          widget.restaurant.isOpen == true ? l10n.open : l10n.closed,
          theme,
          valueColor:
              widget.restaurant.isOpen == true ? Colors.green : Colors.red,
        ),

        const SizedBox(height: 32),

        // Action buttons
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  // TODO: Implement call functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.callFeatureComingSoon)),
                  );
                },
                icon: const Icon(Icons.phone),
                label: Text(l10n.call),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: () {
                  // TODO: Implement directions functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.directionsFeatureComingSoon)),
                  );
                },
                icon: const Icon(Icons.directions),
                label: Text(l10n.directions),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailRow(
      IconData icon, String label, String value, ThemeData theme,
      {Color? valueColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: valueColor ?? theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey.shade100,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.shadow.withValues(alpha: 0.08),
                  blurRadius: _elevationAnimation.value,
                  offset: Offset(0, _elevationAnimation.value / 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: _onTap,
                onTapDown: _onTapDown,
                onTapUp: _onTapUp,
                onTapCancel: _onTapCancel,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // Restaurant image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: widget.restaurant.imageUrl != null
                            ? Image.network(
                                widget.restaurant.imageUrl!,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: theme
                                          .colorScheme.surfaceContainerHighest,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      Icons.restaurant,
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  );
                                },
                              )
                            : Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color:
                                      theme.colorScheme.surfaceContainerHighest,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.restaurant,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                      ),
                      const SizedBox(width: 16),

                      // Restaurant details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.restaurant.name ?? 'Unknown Restaurant',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            if (widget.restaurant.cuisine != null)
                              Text(
                                widget.restaurant.cuisine!,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                if (widget.restaurant.rating != null) ...[
                                  const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    widget.restaurant.rating!
                                        .toStringAsFixed(1),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                ],
                                if (widget.restaurant.priceRange != null)
                                  Text(
                                    widget.restaurant.priceRange!,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: widget.restaurant.isOpen == true
                                        ? Colors.green.withValues(alpha: 0.1)
                                        : Colors.red.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    widget.restaurant.isOpen == true
                                        ? 'Open'
                                        : 'Closed',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: widget.restaurant.isOpen == true
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
