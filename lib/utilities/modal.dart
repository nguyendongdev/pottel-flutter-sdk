import 'package:flutter/material.dart';
import 'package:skyfi_sdk/core/constants/colors.dart';
import 'package:skyfi_sdk/modals/modalMessage.dart';
import 'package:skyfi_sdk/routers/routers.dart';

class ResponseModal<T> {
  final T? result;
  final bool? confirmed;

  ResponseModal({this.result, this.confirmed});
}

class Modal {
  static Future<ResponseModal<T?>?> showModal<T>({
    required String title,
    required String message,
    String? buttonText,
    Widget? icon,
    Color? titleColor,
    Color? messageColor,
    required Widget modalContent,
  }) {
    return showDialog<ResponseModal<T?>?>(
      context: NavigatorService.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return modalContent;
      },
    );
  }

  static Future<ResponseModal<T?>?> showModalBottom<T>({
    required String title,
    required String message,
    String? buttonText,
    Widget? icon,
    Color? titleColor,
    Color? messageColor,
    required Widget modalContent,
  }) {
    return showModalBottomSheet<ResponseModal<T?>?>(
      context: NavigatorService.context!,
      builder: (BuildContext context) {
        return modalContent;
      },
    );
  }

  static Future<bool?> show({
    required String title,
    required String message,
    String? confirmText,
    String? closeText,
    VoidCallback? onConfirm,
    VoidCallback? onClose,
    bool showBothButtons = true,
    Widget? icon,
    Color? titleColor,
    Color? messageColor,
  }) {
    return showDialog<bool>(
      context: NavigatorService.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ModalMessage(
          title: title,
          message: message,
          confirmText: confirmText,
          closeText: closeText,
          onConfirm: onConfirm,
          onClose: onClose,
          showBothButtons: showBothButtons,
          icon: icon,
          titleColor: titleColor,
          messageColor: messageColor,
        );
      },
    );
  }

  /// Show info modal with only OK button
  static Future<bool?> showInfo({
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onPressed,
    Widget? icon,
  }) {
    return show(
      title: title,
      message: message,
      confirmText: buttonText ?? 'OK',
      onConfirm: onPressed,
      showBothButtons: false,
      icon: icon,
    );
  }

  /// Show confirmation modal with both buttons
  static Future<bool?> showConfirmation({
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool showBothButtons = true,
    Widget? icon,
  }) {
    return show(
      title: title,
      message: message,
      confirmText: confirmText ?? 'Xác nhận',
      closeText: cancelText ?? 'Hủy',
      onConfirm: onConfirm,
      onClose: onCancel,
      showBothButtons: showBothButtons,
      icon: icon,
    );
  }

  /// Show error modal
  static Future<bool?> showError({
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onPressed,
  }) {
    return show(
      title: title,
      message: message,
      confirmText: buttonText ?? 'OK',
      onConfirm: onPressed,
      showBothButtons: false,
      titleColor: AppColors.red,
      icon: const Icon(
        Icons.error_outline,
        color: AppColors.red,
        size: 48,
      ),
    );
  }

  /// Show success modal
  static Future<bool?> showSuccess({
    required String title,
    required String message,
    String? buttonText,
    VoidCallback? onPressed,
  }) {
    return show(
      title: title,
      message: message,
      confirmText: buttonText ?? 'OK',
      onConfirm: onPressed,
      showBothButtons: false,
      titleColor: AppColors.green,
      icon: const Icon(
        Icons.check_circle_outline,
        color: AppColors.green,
        size: 48,
      ),
    );
  }
}
