import 'dart:io';
import 'package:flutter/foundation.dart';
import 'ekyc_helper.dart';

/// Example usage of EkycHelper
class EkycHelperExample {
  /// Example: Compress and encode image from file path
  static Future<String> processImageFromFile(String filePath,
      {bool isSelfie = false}) async {
    try {
      // Read image file
      final file = File(filePath);
      final imageBytes = await file.readAsBytes();

      // Validate image
      if (!EkycHelper.validateImageForEkyc(imageBytes)) {
        throw Exception('Image validation failed');
      }

      // Compress and encode
      final base64Image = await EkycHelper.compressAndEncodeImage(
        imageBytes,
        isSelfie: isSelfie,
      );

      return base64Image;
    } catch (e) {
      debugPrint('Error processing image: $e');
      rethrow;
    }
  }

  /// Example: Custom compression settings
  static Future<String> processImageWithCustomSettings(
    Uint8List imageBytes, {
    int maxWidth = 1024,
    int maxHeight = 1024,
    int quality = 85,
  }) async {
    try {
      // Compress with custom settings
      final compressedBytes = await EkycHelper.compressImage(
        imageBytes,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        quality: quality,
      );

      // Convert to base64
      return EkycHelper.imageToBase64(compressedBytes);
    } catch (e) {
      debugPrint('Error processing image with custom settings: $e');
      rethrow;
    }
  }

  /// Example: Get compression settings for different image types
  static void showCompressionSettings() {
    final selfieSettings = EkycHelper.getCompressionSettings('selfie');
    final cardSettings = EkycHelper.getCompressionSettings('id_card');

    debugPrint('Selfie settings: $selfieSettings');
    debugPrint('ID Card settings: $cardSettings');
  }

  /// Example: Process multiple images
  static Future<Map<String, String>> processMultipleImages({
    required String frontCardPath,
    required String backCardPath,
    required String selfiePath,
  }) async {
    try {
      final results = <String, String>{};

      // Process front card
      results['frontCard'] =
          await processImageFromFile(frontCardPath, isSelfie: false);

      // Process back card
      results['backCard'] =
          await processImageFromFile(backCardPath, isSelfie: false);

      // Process selfie
      results['selfie'] =
          await processImageFromFile(selfiePath, isSelfie: true);

      return results;
    } catch (e) {
      debugPrint('Error processing multiple images: $e');
      rethrow;
    }
  }
}
