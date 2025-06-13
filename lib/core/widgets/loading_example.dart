import 'package:flutter/material.dart';
import '../../utilities/common.dart';

/// Example widget demonstrating how to use the global loading system
class LoadingExampleWidget extends StatelessWidget {
  const LoadingExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Method 1: Using context
                Common.startLoading(context);

                // Simulate some work
                Future.delayed(const Duration(seconds: 2), () {
                  Common.stopLoading();
                });
              },
              child: const Text('Show Loading with Context'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Method 2: Using navigator key (no context needed)
                Common.startLoading();

                // Simulate some work
                Future.delayed(const Duration(seconds: 2), () {
                  Common.stopLoading();
                });
              },
              child: const Text('Show Loading without Context'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Method 3: In an async function
                Common.startLoading(context);

                try {
                  // Simulate API call
                  await Future.delayed(const Duration(seconds: 3));

                  // Show success message
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Operation completed!')),
                    );
                  }
                } catch (e) {
                  // Handle error
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                } finally {
                  // Always stop loading
                  Common.stopLoading();
                }
              },
              child: const Text('Async Operation Example'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Method 4: Force clear loading (for error recovery)
                Common.clearLoading();

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Loading state cleared!')),
                  );
                }
              },
              child: const Text('Force Clear Loading'),
            ),
          ],
        ),
      ),
    );
  }
}
