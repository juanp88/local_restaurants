import 'package:flutter/material.dart';
import 'package:local_restaurants/view_model/search_view_model.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _focusNode.addListener(_onFocusChanged);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _focusNode.removeListener(_onFocusChanged);
    _searchController.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    Provider.of<SearchViewModel>(context, listen: false)
        .setFilteredCountry(_searchController.text);
  }

  void _onFocusChanged() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });

    if (_isFocused) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _clearSearch() {
    _searchController.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _isFocused
                    ? theme.colorScheme.primary.withValues(alpha: 0.5)
                    : Colors.grey.shade200,
                width: _isFocused ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: _isFocused
                      ? theme.colorScheme.primary.withValues(alpha: 0.1)
                      : theme.colorScheme.shadow.withValues(alpha: 0.05),
                  blurRadius: _isFocused ? 12 : 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: l10n.searchCountries,
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                ),
                prefixIcon: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.search,
                    size: 24,
                    color: _isFocused
                        ? theme.colorScheme.primary
                        : Colors.grey.shade400,
                  ),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? AnimatedScale(
                        scale: 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey.shade400,
                          ),
                          onPressed: _clearSearch,
                          tooltip: l10n.clearSearchTooltip,
                        ),
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
              ),
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textInputAction: TextInputAction.search,
              autocorrect: false,
              enableSuggestions: true,
              onSubmitted: (value) {
                Provider.of<SearchViewModel>(context, listen: false)
                    .setFilteredCountry(value);
              },
            ),
          ),
        );
      },
    );
  }
}
