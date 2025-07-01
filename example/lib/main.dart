import 'package:flutter/material.dart';
import 'package:skyfi_sdk/skyfi_sdk.dart';

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
                  child: Text('SkyFi SDK Example App'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SkyfiSdk(
                                phone: '0707040618',
                              )),
                    );
                  },
                  child: const Text('Mở SkyFi SDK'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SkyfiSdk.toScreen(
                          initialLocation: SkyfiRoute.infoRegis.path,
                          phone: '0707991197',
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
                        builder: (_) => SkyfiSdk.toScreen(
                          initialLocation: SkyfiRoute.topupSkyFi.path,
                          phone: '0807991197',
                        ),
                      ),
                    );
                  },
                  child: const Text('Mở màn nạp tiền'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SkyfiSdk.toScreen(
                          initialLocation: SkyfiRoute.topupSkyFi.path,
                          phone: '0707991197',
                        ),
                      ),
                    );
                  },
                  child: const Text('Mở màn thông tin gói cước'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
