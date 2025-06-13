import 'package:flutter/material.dart';

/// Global loading overlay widget that displays a loading indicator
/// with a semi-transparent background
class GlobalLoadingOverlay extends StatelessWidget {
  const GlobalLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}

/// Manager class for handling global loading overlay
///
/// Usage:
/// ```dart
/// // Show loading with context
/// LoadingManager.show(context);
///
/// // Hide loading
/// LoadingManager.hide();
///
/// // Check if loading is currently shown
/// bool isLoading = LoadingManager.isLoading;
/// ```
class LoadingManager {
  static OverlayEntry? _overlayEntry;
  static bool _isLoading = false;

  /// Show the loading overlay
  /// [context] - BuildContext required for overlay insertion
  static void show(BuildContext context) {
    if (_isLoading) return;

    try {
      _isLoading = true;
      _overlayEntry = OverlayEntry(
        builder: (context) => const GlobalLoadingOverlay(),
      );

      Overlay.of(context).insert(_overlayEntry!);
    } catch (e) {
      print('LoadingManager: Error showing overlay - $e');
      _isLoading = false;
      _overlayEntry = null;
    }
  }

  /// Hide the loading overlay
  static void hide() {
    if (!_isLoading || _overlayEntry == null) return;

    try {
      if (_overlayEntry!.mounted) {
        _overlayEntry!.remove();
      }
    } catch (e) {
      // Handle case where overlay might have been removed already
      print('LoadingManager: Error removing overlay - $e');
    } finally {
      _overlayEntry = null;
      _isLoading = false;
    }
  }

  /// Check if loading is currently being displayed
  static bool get isLoading => _isLoading;

  /// Force clear the loading state (use in case of errors)
  static void forceClear() {
    try {
      if (_overlayEntry != null && _overlayEntry!.mounted) {
        _overlayEntry!.remove();
      }
    } catch (e) {
      print('LoadingManager: Error force clearing overlay - $e');
    } finally {
      _overlayEntry = null;
      _isLoading = false;
    }
  }
}
