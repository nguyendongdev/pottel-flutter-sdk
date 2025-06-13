import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/constants/colors.dart';
import '../../network/api.dart';
import '../../network/store.dart';
import '../account_info_skyfi/account_info_skyfi_screen.dart';
import '../esim_travel_skyfi/esim_travel_skyfi_screen.dart';
import '../sim_data_skyfi/sim_data_skyfi_screen.dart';
import 'home_tab.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'models/user_info.dart';
import 'provider/login_provider.dart';
import 'provider/user_info_provider.dart';
import 'widgets/bottom_tab_main.dart';
import '../cart_skyfi/provider/cart_provider.dart';

class HomeSkyFiScreenNew extends HookConsumerWidget {
  const HomeSkyFiScreenNew({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var navIndex = useState(0);
    final api = API();

    void onFetchUserInfo(String phone) async {
      try {
        final response = await api.get('/bss/app/get-subscriber-info/$phone');
        final resUserInfo = UserInfoResponse.fromJson(response.data);
        if (resUserInfo.code == 200 && resUserInfo.result != null) {
          // keep alive user info
          ref
              .read(userInfoProviderProvider.notifier)
              .setUserInfo(resUserInfo.result!);

          // ref.read(cartProvider.notifier);
        }
      } catch (e) {
        debugPrint('Error fetching user info: $e');
      }
    }

    void fetchDataLocal() async {
      final token = await StoreClient.getToken();
      final phone = await StoreClient.getPhone();
      if (token != null &&
          token.isNotEmpty &&
          phone != null &&
          phone.isNotEmpty) {
        ref.read(isLoginProvider.notifier).setIsLogin(true);
        ref.read(currentPhoneProvider.notifier).setCurrentPhone(phone);
        onFetchUserInfo(phone);
        ref.read(cartProvider.notifier).refetchCart();
      }
    }

    useEffect(() {
      fetchDataLocal();
      return null;
    }, []);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: LazyLoadIndexedStack(
        index: navIndex.value,
        children: const [
          HomeTab(),
          SizedBox(),
          SizedBox(),
          AccountInfoSkyFiScreen(),
        ],
      ),
      bottomNavigationBar: BottomTabMain(
        onNavIndexChanged: (value) {
          navIndex.value = value;
        },
        navIndex: navIndex.value,
        context: context,
      ),
    );
  }
}
