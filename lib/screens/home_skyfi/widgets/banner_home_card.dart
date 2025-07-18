import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/l10n/localization_extension.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../provider/banner_provider.dart';

class BannerHomeCard extends ConsumerWidget {
  const BannerHomeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannersAsync = ref.watch(bannersProvider);
    return bannersAsync.when(
      data: (banners) => SizedBox(
        width: 375,
        height: 150,
        child: FlutterCarousel(
          items: banners.map((url) => _BannerItem(imageUrl: url)).toList(),
          options: FlutterCarouselOptions(
            height: 150,
            viewportFraction: 0.9,
            autoPlayCurve: Curves.easeInOut,
            showIndicator: true,
            enableInfiniteScroll: true,
            slideIndicator: CircularSlideIndicator(
              slideIndicatorOptions: SlideIndicatorOptions(
                indicatorRadius: 4,
                itemSpacing: 10,
                currentIndicatorColor: AppColors.primary,
                indicatorBackgroundColor: AppColors.neutral300,
              ),
            ),
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 300),
            autoPlayInterval: const Duration(seconds: 3),
          ),
        ),
      ),
      loading: () => const SizedBox(
        width: 375,
        height: 150,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => SizedBox(
        width: 375,
        height: 150,
        child: Center(
          child: SelectableText.rich(
            TextSpan(
              text: context.l10n.translate('error_loading_banners'),
              children: [
                TextSpan(
                  text: error.toString(),
                  style: const TextStyle(color: AppColors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BannerItem extends StatelessWidget {
  final String imageUrl;

  const _BannerItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
