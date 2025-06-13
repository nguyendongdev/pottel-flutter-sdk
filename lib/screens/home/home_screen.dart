import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import '../../routers/routers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // splash screen is shown for 2 seconds
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // navigate to login screen
                  context.goNamed(AppRouter.loginSkyFi);
                },
                child: const Text('Login')),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  // navigate to login screen
                  context.pushNamed(AppRouter.homeSkyFiNew);
                },
                child: const Text('SDK SkyFi Home')),
            ElevatedButton(
                onPressed: () {
                  // navigate to login screen
                  context.pushNamed(AppRouter.infoRegis);
                },
                child: const Text('SDK SkyFi DKTT')),
            ElevatedButton(
                onPressed: () {
                  // navigate to login screen
                  context.pushNamed(AppRouter.doubleCheckInfo);
                },
                child: const Text('Double Check Info')),
            ElevatedButton(
                onPressed: () {
                  // navigate to login screen
                  context.pushNamed(AppRouter.scanNfcChipcard);
                },
                child: const Text('Scan NFC Chipcard')),
          ],
        ),
      ),
    );
  }
}
