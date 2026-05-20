import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../routers/routers.dart';
import '../../screens/cart_skyfi/provider/cart_provider.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class AppCart extends ConsumerWidget {
  final Color? color;
  const AppCart({super.key, this.color = AppColors.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartCount = cart.value?.items
            .fold(0, (previous, item) => previous + item.quantity) ??
        0;
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            context.pushNamed(AppRouter.cartSkyFi);
          },
          icon: SvgPicture.asset(
            'assets/icons/top_cart.svg',
            width: 24,
            height: 24,
            colorFilter:
                ColorFilter.mode(color ?? AppColors.text, BlendMode.srcIn),
            package: 'pottel_sdk',
          ),
        ),
        Positioned(
          right: 4,
          top: 4,
          child: cartCount > 0
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Center(
                    child: Text(
                      cartCount.toString() ?? '0',
                      style: AppTextStyles.small.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              : const SizedBox(
                  width: 10,
                ),
        ),
      ],
    );
  }
}
