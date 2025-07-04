import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/core/constants/spacing.dart';
import 'package:skyfi_sdk/screens/esim_travel_skyfi/models/esim_package_model.dart';
import 'package:skyfi_sdk/utilities/modal.dart';

showBottomSheetListCountries(List<EsimRegionModel> countries,
    {Function(EsimRegionModel)? onCountrySelected}) {
  return Modal.showModalBottom(
    title: 'Select Package',
    message: 'Choose a package for your travel',
    modalContent: EsimListContris(
      countries: countries,
    ),
  );
}

class EsimListContris extends HookConsumerWidget {
  final List<EsimRegionModel> countries;

  const EsimListContris({
    super.key,
    required this.countries,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState('');

    useEffect(() {
      void listener() {
        searchQuery.value = searchController.text;
      }

      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, [searchController]);

    // Filter countries based on search query
    final filteredCountries = useMemoized(() {
      if (searchQuery.value.isEmpty) {
        return countries;
      }
      return countries.where((country) {
        return country.title
            .toLowerCase()
            .contains(searchQuery.value.toLowerCase());
      }).toList();
    }, [countries, searchQuery.value]);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with title and close button
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.lg,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Quốc gia được hỗ trợ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 18,
                      color: AppColors.text,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Search field
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Nhập tên quốc gia',
                hintStyle: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.textGrey,
                  size: 20,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          // Country list
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 400),
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                itemCount: filteredCountries.length,
                separatorBuilder: (context, index) => Container(
                  height: 0.5,
                  color: const Color(0xFFF1F1F1),
                ),
                itemBuilder: (context, index) {
                  final country = filteredCountries[index];
                  return _CountryListItem(
                    country: country,
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _CountryListItem extends StatelessWidget {
  final EsimRegionModel country;

  const _CountryListItem({
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          // Country flag container
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFFF1F1F1),
                width: 1,
              ),
            ),
            child: _buildCountryFlag(country),
          ),
          const SizedBox(width: AppSpacing.sm),
          // Country name
          Expanded(
            child: Text(
              country.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountryFlag(EsimRegionModel country) {
    // If country has an image URL, try to load it
    if (country.image.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          country.image,
          width: 30,
          height: 30,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildFallbackFlag(country);
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: AppColors.textLight,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    return _buildFallbackFlag(country);
  }

  Widget _buildFallbackFlag(EsimRegionModel country) {
    // Create a simple flag placeholder with country code or first letter
    final displayText = country.countryCode.isNotEmpty == true
        ? country.countryCode.toUpperCase()
        : country.title.isNotEmpty
            ? country.title.toUpperCase()
            : '?';

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: _getCountryColor(country.title),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          displayText.length > 2 ? displayText.substring(0, 2) : displayText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Color _getCountryColor(String countryName) {
    // Generate a consistent color based on country name
    final hash = countryName.hashCode;
    final colors = [
      const Color(0xFF4285F4), // Blue
      const Color(0xFF34A853), // Green
      const Color(0xFFEA4335), // Red
      const Color(0xFFFBBC05), // Yellow
      const Color(0xFF9C27B0), // Purple
      const Color(0xFFFF9800), // Orange
      const Color(0xFF607D8B), // Blue Grey
      const Color(0xFF795548), // Brown
    ];
    return colors[hash.abs() % colors.length];
  }
}
