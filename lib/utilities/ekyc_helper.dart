import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

/// Helper class for eKYC image processing and compression
class EkycHelper {
  /// Compress image with custom options
  ///
  /// [imageBytes] - Original image bytes
  /// [maxWidth] - Maximum width in pixels (default: 1024)
  /// [maxHeight] - Maximum height in pixels (default: 1024)
  /// [quality] - JPEG quality 0-100 (default: 85)
  ///
  /// Returns compressed image bytes
  static Future<Uint8List> compressImage(
    Uint8List imageBytes, {
    int maxWidth = 1024,
    int maxHeight = 1024,
    int quality = 100,
  }) async {
    try {
      // Decode the original image
      final originalImage = img.decodeImage(imageBytes);
      if (originalImage == null) {
        throw Exception('Could not decode image');
      }

      // Resize if needed
      img.Image resizedImage = originalImage;
      if (originalImage.width > maxWidth || originalImage.height > maxHeight) {
        resizedImage = img.copyResize(
          originalImage,
          width: originalImage.width > maxWidth ? maxWidth : null,
          height: originalImage.height > maxHeight ? maxHeight : null,
          maintainAspect: true,
        );
      }

      // Compress to JPEG
      final compressedBytes = img.encodeJpg(resizedImage, quality: quality);

      // Log compression info in debug mode
      if (kDebugMode) {
        final originalSize = imageBytes.length;
        final compressedSize = compressedBytes.length;
        final ratio = (compressedSize / originalSize * 100);

        debugPrint('=== Image Compression ===');
        debugPrint('Original size: ${_formatBytes(originalSize)}');
        debugPrint('Compressed size: ${_formatBytes(compressedSize)}');
        debugPrint('Compression ratio: ${ratio.toStringAsFixed(1)}%');
        debugPrint('Saved: ${_formatBytes(originalSize - compressedSize)}');
        debugPrint('========================');
      }

      return Uint8List.fromList(compressedBytes);
    } catch (e) {
      debugPrint('Error compressing image: $e');
      rethrow;
    }
  }

  /// Compress image specifically for ID card (front/back)
  /// Optimized settings for document scanning
  static Future<Uint8List> compressIdCard(Uint8List imageBytes) async {
    return compressImage(
      imageBytes,
      maxWidth: 1024,
      maxHeight: 1024,
      quality: 100,
    );
  }

  /// Compress image specifically for selfie
  /// Optimized settings for face recognition
  static Future<Uint8List> compressSelfie(Uint8List imageBytes) async {
    return compressImage(
      imageBytes,
      maxWidth: 800,
      maxHeight: 800,
      quality: 100,
    );
  }

  /// Convert compressed image bytes to base64 string
  static String imageToBase64(Uint8List imageBytes) {
    return base64Encode(imageBytes);
  }

  /// Compress image and convert to base64 in one step
  ///
  /// [imageBytes] - Original image bytes
  /// [isSelfi] - true for selfie, false for ID card
  ///
  /// Returns base64 encoded compressed image
  static Future<String> compressAndEncodeImage(
    Uint8List imageBytes, {
    bool isSelfie = false,
  }) async {
    final compressedBytes = isSelfie
        ? await compressSelfie(imageBytes)
        : await compressIdCard(imageBytes);

    return imageToBase64(compressedBytes);
  }

  /// Format bytes to human readable string
  static String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  /// Get optimal compression settings based on image type
  static Map<String, int> getCompressionSettings(String imageType) {
    switch (imageType.toLowerCase()) {
      case 'selfie':
        return {
          'maxWidth': 800,
          'maxHeight': 800,
          'quality': 100,
        };
      case 'id_card':
      case 'card_front':
      case 'card_back':
        return {
          'maxWidth': 1024,
          'maxHeight': 1024,
          'quality': 100,
        };
      default:
        return {
          'maxWidth': 1024,
          'maxHeight': 1024,
          'quality': 100,
        };
    }
  }

  /// Validate image size and quality before processing
  static bool validateImageForEkyc(Uint8List imageBytes) {
    try {
      final image = img.decodeImage(imageBytes);
      if (image == null) return false;

      // Minimum resolution for eKYC (adjust as needed)
      const minWidth = 300;
      const minHeight = 300;

      // Maximum file size (5MB)
      const maxFileSize = 5 * 1024 * 1024;

      return image.width >= minWidth &&
          image.height >= minHeight &&
          imageBytes.length <= maxFileSize;
    } catch (e) {
      debugPrint('Error validating image: $e');
      return false;
    }
  }

  //  getMessageErrorOcr
  static String getMessageErrorOcr(int code) {
    switch (code) {
      case 99:
        return 'Ảnh không phù hợp';
      case 1:
        return 'Ảnh có dấu hiệu được chụp qua màn hình điện tử';
      case 2:
        return 'Ảnh giấy tờ tùy thân là bản photocopy';
      case 4:
        return 'Ảnh giấy tờ tùy thân không có mặt';
      case 5:
        return 'Giấy tờ tùy thân bị cắt góc';
      case 6:
        return 'Giấy tờ tùy thân bị nghi ngờ là giả mạo';
      case 7:
        return 'Loại thẻ không đúng, có thể sai mặt trước và mặt sau';
      case -1:
        return 'Giấy tờ tùy thân bị cắt góc';
      case 9:
        return 'Ảnh giấy tờ không đúng nội dung';
      default:
        return 'Lỗi không xác định';
    }
  }

  // getMessageErrorOcr
  static String getMessageFace(int code) {
    switch (code) {
      case 1:
        return 'Ảnh đầu vào không có giấy tờ tùy thân';
      case 4:
        return 'Ảnh giấy tờ tùy thân không có mặt';
      case 6:
        return 'Ảnh chứa nhiều hơn một mặt người';
      case 10:
        return 'Ảnh chụp từ hình ảnh, màn hình, nhiễu mờ hoặc có dấu hiệu gian lận';
      case 12:
        return 'Ảnh chân dung không hợp lệ';
      case 13:
        return 'Ảnh chân dung không khớp với ảnh giấy tờ';
      case 99:
        return 'Ảnh chân dung không hợp lệ';
      case -1:
        return 'Ảnh chân dung không hợp lệ';
      default:
        return 'Lỗi không xác định';
    }
  }
}
