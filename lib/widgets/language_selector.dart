import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  final Locale currentLocale;
  final ValueChanged<Locale> onLocaleChanged;

  const LanguageSelector({
    super.key,
    required this.currentLocale,
    required this.onLocaleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopupMenuButton<Locale>(
      icon: Icon(
        Icons.language,
        color: theme.colorScheme.onSurface,
      ),
      tooltip: 'Change Language',
      onSelected: onLocaleChanged,
      itemBuilder: (context) => [
        PopupMenuItem<Locale>(
          value: const Locale('en'),
          child: Row(
            children: [
              Text('🇺🇸', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 12),
              const Text('English'),
              if (currentLocale.languageCode == 'en') const Spacer(),
              if (currentLocale.languageCode == 'en')
                Icon(
                  Icons.check,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
            ],
          ),
        ),
        PopupMenuItem<Locale>(
          value: const Locale('es'),
          child: Row(
            children: [
              Text('🇪🇸', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 12),
              const Text('Español'),
              if (currentLocale.languageCode == 'es') const Spacer(),
              if (currentLocale.languageCode == 'es')
                Icon(
                  Icons.check,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
