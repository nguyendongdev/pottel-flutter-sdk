import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skyfi_sdk/utilities/modal.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../../core/widgets/outline_button.dart';

class PopupSettingPass extends StatefulWidget {
  const PopupSettingPass({
    super.key,
    required this.onSkip,
    required this.onSetPassword,
  });

  final VoidCallback onSkip;
  final Function(String password) onSetPassword;

  @override
  State<PopupSettingPass> createState() => _PopupSettingPassState();
}

class _PopupSettingPassState extends State<PopupSettingPass> {
  final List<TextEditingController> _pinControllers =
      List.generate(6, (_) => TextEditingController());
  final List<TextEditingController> _confirmPinControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _pinFocusNodes = List.generate(6, (_) => FocusNode());
  final List<FocusNode> _confirmPinFocusNodes =
      List.generate(6, (_) => FocusNode());
  final List<FocusNode> _keyboardPinFocusNodes =
      List.generate(6, (_) => FocusNode());
  final List<FocusNode> _keyboardConfirmFocusNodes =
      List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _pinControllers) {
      controller.dispose();
    }
    for (var controller in _confirmPinControllers) {
      controller.dispose();
    }
    for (var focusNode in _pinFocusNodes) {
      focusNode.dispose();
    }
    for (var focusNode in _confirmPinFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  String get _pinValue => _pinControllers.map((c) => c.text).join();
  String get _confirmPinValue =>
      _confirmPinControllers.map((c) => c.text).join();

  bool _hasConsecutiveDigits(String pin) {
    for (int i = 0; i < pin.length - 1; i++) {
      int current = int.parse(pin[i]);
      int next = int.parse(pin[i + 1]);
      if ((next - current).abs() == 1) {
        // Check if it's part of a sequence of 3 or more
        int count = 2;
        for (int j = i + 2; j < pin.length; j++) {
          int nextNext = int.parse(pin[j]);
          if ((nextNext - next).abs() == 1 &&
              (nextNext - current).abs() == count) {
            count++;
            if (count >= 3) return true;
          } else {
            break;
          }
        }
      }
    }
    return false;
  }

  bool _hasRepeatedDigits(String pin) {
    for (int i = 0; i < pin.length - 2; i++) {
      if (pin[i] == pin[i + 1] && pin[i + 1] == pin[i + 2]) {
        return true;
      }
    }
    return false;
  }

  void _onPinChanged(int index, String value,
      List<TextEditingController> controllers, List<FocusNode> focusNodes) {
    if (value.isNotEmpty && index < 5) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
      final previousText = controllers[index].text;
      Future.microtask(() {
        if (previousText.isEmpty) {
          focusNodes[index - 1].requestFocus();
        }
      });
    }
  }

  void _onSetPassword() {
    if (_pinValue.length != 6) {
      _showError('Vui lòng nhập đủ 6 số PIN');
      return;
    }

    if (_confirmPinValue.length != 6) {
      _showError('Vui lòng xác nhận đủ 6 số PIN');
      return;
    }

    if (_pinValue != _confirmPinValue) {
      _showError('Mã PIN xác nhận không khớp');
      return;
    }

    if (_hasConsecutiveDigits(_pinValue)) {
      _showError('Mã PIN không được chứa số liên tiếp');
      return;
    }

    if (_hasRepeatedDigits(_pinValue)) {
      _showError('Mã PIN không được chứa các số giống nhau liên tiếp');
      return;
    }

    widget.onSetPassword(_pinValue);
  }

  void _showError(String message) {
    Modal.showError(title: 'Thông báo', message: message);
  }

  Widget _buildPinField(int index, List<TextEditingController> controllers,
      List<FocusNode> focusNodes, List<FocusNode> keyboardFocusNodes) {
    return Container(
      width: 44,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: controllers[index].text.isNotEmpty
              ? AppColors.text
              : AppColors.border,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: KeyboardListener(
        focusNode: keyboardFocusNodes[index],
        onKeyEvent: (event) {
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.backspace) {
            if (controllers[index].text.isEmpty && index > 0) {
              focusNodes[index - 1].requestFocus();
            }
          }
        },
        child: TextFormField(
          controller: controllers[index],
          focusNode: focusNodes[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          obscureText: true,
          maxLength: 1,
          style: AppTextStyles.body.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (value) {
            setState(() {
              _onPinChanged(index, value, controllers, focusNodes);
            });
          },
          onTap: () {
            // Nếu tap vào ô rỗng, focus lui về ô trước
            if (controllers[index].text.isEmpty && index > 0) {
              focusNodes[index - 1].requestFocus();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(AppSpacing.sm),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 410,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Title
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Cài đặt mật khẩu',
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.text,
                      height: 1.44,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.text),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              'Chỉ cần 1 phút để cài đặt mật khẩu và kể từ sau đó Bạn có thể truy cập App một cách dễ dàng và nhanh chóng!',
              style: AppTextStyles.small.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // PIN Input Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // PIN Label
                  Text(
                    'Nhập mã PIN',
                    style: AppTextStyles.body.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // PIN Input Fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        6,
                        (index) => _buildPinField(index, _pinControllers,
                            _pinFocusNodes, _keyboardPinFocusNodes)),
                  ),
                  const SizedBox(height: 16),

                  // Confirm PIN Label
                  Text(
                    'Xác nhận mã PIN',
                    style: AppTextStyles.body.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Confirm PIN Input Fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        6,
                        (index) => _buildPinField(index, _confirmPinControllers,
                            _confirmPinFocusNodes, _keyboardConfirmFocusNodes)),
                  ),
                ],
              ),
            ),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: OutlineButton(
                    width: double.infinity,
                    height: 48,
                    onPressed: widget.onSkip,
                    text: 'Để sau',
                    textStyle: AppTextStyles.body.copyWith(
                      color: AppColors.strongSecondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GradientButton(
                    width: double.infinity,
                    height: 48,
                    onPressed: _onSetPassword,
                    text: 'Đặt mật khẩu',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
