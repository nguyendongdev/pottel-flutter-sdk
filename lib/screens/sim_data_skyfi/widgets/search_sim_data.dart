import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/screens/sim_data_skyfi/provider/simType_provider.dart';
import 'package:skyfi_sdk/utilities/common.dart';
import 'package:skyfi_sdk/utilities/search_sim.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../network/api.dart';
import '../models/list_sims/list_sims.dart';
import '../models/list_sims/result.dart';
import '../models/params_sims/filters.dart';
import '../models/params_sims/params_sims.dart';

class SearchSimData extends HookConsumerWidget {
  const SearchSimData({super.key, required this.onChoosedNumber});

  final Function(Result) onChoosedNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = API();
    final searchControllers =
        List.generate(7, (index) => useTextEditingController());
    final searchNumber = useState('070xxxxxxx');
    final simData = useState<List<Result>>([]);
    // when click back or remove number -> focus to previous
    final focusNodes = List.generate(6, (index) => useFocusNode());
    final isNotFound = useState(false);

    void onGetSimData(String search) async {
      //  length of search is 6
      print('search: $search');
      if (search.length == 7) {
        search = '070${search}';
      }
      try {
        final response = await api.post('/bss/app/get-phone-numbers',
            data: ParamsSims(
              filters:
                  Filters(search: search.isNotEmpty ? search : '070xxxxxxx'),
              page: 1,
              pageSize: 20,
            ).toJson());
        final result = ListSims.fromJson(response.data);
        simData.value = result.result!;
      } catch (e) {
        print('error: $e');
      } finally {
        // isNotFound.value = false;
      }
    }

    void onSearchPressed(String search) {
      print('search: $search');
      onGetSimData(search);
      // isNotFound.value = true; // For demo purposes
    }

    useEffect(() {
      onGetSimData(searchNumber.value);
      return null;
    }, []);

    Widget buildInputField(int index) {
      print('index: $index');
      return Container(
        width: 32,
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: TextField(
          controller: searchControllers[index],
          focusNode: focusNodes[index],
          cursorColor: AppColors.strongSecondary,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: AppTextStyles.heading.copyWith(
            color: AppColors.text,
            fontSize: 22,
          ),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: '',
            hintStyle: AppTextStyles.heading.copyWith(
              color: AppColors.textGrey,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
            alignLabelWithHint: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            counterText: '',
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.border),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.strongSecondary),
            ),
          ),
          onSubmitted: (value) {
            print('value onSubmitted: $value');
            // searchNumber.value = value;
            // onGetSimData();
          },
          onChanged: (value) {
            if (value.isNotEmpty && index < 6) {
              focusNodes[index + 1].requestFocus();
              searchNumber.value = "070xxxxxxx";
            }
          },
        ),
      );
    }

    Widget buildSimCard({
      required String number,
      required String price,
      String? originalPrice,
      bool isSelected = false,
      VoidCallback? onTap,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: AppCard(
          border: Border.all(
            color: isSelected ? AppColors.strongSecondary : AppColors.border,
            width: isSelected ? 2 : 1.5,
          ),
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Common.formatNumberGalaxy(number),
                      style: AppTextStyles.heading),
                  const Divider(color: AppColors.border),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (originalPrice != price)
                        Text(
                          Common.formatCurrency(originalPrice ?? '') + ' VND',
                          style: AppTextStyles.label.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const SizedBox(width: AppSpacing.xs),
                      Text(
                        Common.formatCurrency(price) + ' VND',
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w500,
                          color: originalPrice != null
                              ? AppColors.red
                              : AppColors.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.border,
                      width: isSelected ? 2 : 1.5,
                    ),
                  ),
                  child: isSelected
                      ? Container(
                          margin: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(AppSpacing.screenPadding),
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          Row(
            children: [
              const Text('Chọn số khác', style: AppTextStyles.heading),
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xxl),
          SearchSim(onSearch: onSearchPressed),
          const SizedBox(height: AppSpacing.lg),
          if (simData.value.isEmpty) ...[
            SvgPicture.asset(
              'assets/icons/feat_search_empty.svg',
              width: 101,
              height: 108,
              package: 'skyfi_sdk',
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              '!!! Rất tiếc, số bạn đang tìm hiện không còn. Có thể bạn sẽ thích những số sau:',
              style: AppTextStyles.label.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSpacing.lg),
              itemCount: simData.value.length,
              itemBuilder: (context, index) {
                return buildSimCard(
                  isSelected: simData.value[index].msisdn ==
                      ref.watch(chooseSimSearchProvider),
                  number: simData.value[index].msisdn ?? '',
                  price: simData.value[index].salePrice.toString() ?? '',
                  originalPrice:
                      simData.value[index].basePrice.toString() ?? '',
                  onTap: () {
                    ref
                        .read(chooseSimSearchProvider.notifier)
                        .changeChooseSimSearch(
                            simData.value[index].msisdn ?? '');
                  },
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          // shadow button
          Container(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 16,
                ),
              ],
            ),
            child: GradientButton(
              onPressed: () {
                onChoosedNumber(
                  simData.value.firstWhere(
                    (element) =>
                        element.msisdn == ref.watch(chooseSimSearchProvider),
                  ),
                );
                context.pop();
              },
              text: 'Xác nhận',
              height: 48,
              textStyle: AppTextStyles.button.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
