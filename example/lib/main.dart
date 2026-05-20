import 'package:flutter/material.dart';
import 'package:pottel_sdk/pottel_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Plugin example app'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text('Pottel SDK Example App'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PopScope(
                          canPop: false,
                          child: PottelSdk(
                            phone: '0959999111',
                            env: PottelEnv.dev,
                            initialLocation: PottelRoute.home.path,
                            locale: AppLocale.vi,
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text('Mở Pottel SDK'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PopScope(
                          canPop: false,
                          child: PottelSdk(
                            phone: '0959999111',
                            env: PottelEnv.dev,
                            initialLocation: PottelRoute.scanBarcode.path,
                            locale: AppLocale.vi,
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text('Mở màn hình đăng ký'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PopScope(
                          canPop: false,
                          child: PottelSdk(
                            phone: '0959999111',
                            env: PottelEnv.dev,
                            initialLocation: PottelRoute.scanNfcChipcardNew.path,
                            locale: AppLocale.vi,
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text('Mở màn hình NFC'),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
