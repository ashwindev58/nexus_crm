import 'package:flutter/material.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/localization/app_localizations.dart';

class CompaniesSegmentedControl extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String> onSelected;

  const CompaniesSegmentedControl({
    super.key,
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    final options = const ['All', 'Active', 'Inactive'];

    String getTranslation(String key) {
      if (key == 'All') return localizations.translate('allStatuses');
      if (key == 'Active') return localizations.translate('statusActive');
      if (key == 'Inactive') return localizations.translate('statusInactive');
      return key;
    }

    return Container(
      height: 48,
      padding: const EdgeInsets.all(AppSizes.xs),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
      ),
      child: Row(
        children: options.map((option) {
          final isSelected = selectedValue.toLowerCase() == option.toLowerCase();
          return Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onSelected(option),
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? theme.colorScheme.surface : Colors.transparent,
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    getTranslation(option),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected 
                          ? theme.colorScheme.primary 
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
