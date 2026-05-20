import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/colors.dart';
import '../core/constants/text_styles.dart';

class SearchSim extends StatefulWidget {
  final ValueChanged<String> onSearch;
  final ValueChanged<String>? onChange;
  const SearchSim({super.key, required this.onSearch, this.onChange});

  @override
  State<SearchSim> createState() => _SearchSimState();
}

class _SearchSimState extends State<SearchSim> {
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;
  late List<FocusNode> _focusNodesKeyboard;
  late List<String> _pin = [];

  @override
  void initState() {
    _focusNodes = List<FocusNode?>.filled(7, null, growable: false);
    _textControllers =
        List<TextEditingController?>.filled(7, null, growable: false);
    _focusNodesKeyboard = List<FocusNode>.generate(7, (index) => FocusNode());
    _pin = List.generate(7, (int i) {
      return 'x';
    });
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  late FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '095',
                style: AppTextStyles.heading.copyWith(
                  color: AppColors.text,
                ),
              ),
              ...List.generate(7, (index) => buildTextField(context, index)),
              InkWell(
                onTap: () {
                  widget.onSearch(_getCurrentPin());
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.search_rounded,
                    color: AppColors.primary,
                  ),
                ),
              )
            ],
          ),
          const Text('Điền vào ô trống chữ số mong muốn',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text,
                  height: 3)),
        ],
      ),
    );
  }

  Widget buildTextField(BuildContext context, int index) {
    FocusNode? focusNode = _focusNodes[index];
    TextEditingController? textEditingController = _textControllers[index];
    FocusNode? focusNodeKeyboard = _focusNodesKeyboard[index];
    if (focusNode == null) {
      _focusNodes[index] = FocusNode();
      focusNode = _focusNodes[index];
      focusNode?.addListener((() => handleFocusChange(index)));
    }
    if (textEditingController == null) {
      _textControllers[index] = TextEditingController();
      textEditingController = _textControllers[index];
    }

    return Container(
      width: 33,
      height: 35,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral200,
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(-2, -2), // changes position of shadow
          ),
        ],
      ),
      child: KeyboardListener(
        focusNode: focusNodeKeyboard,
        onKeyEvent: (keyEvent) {
          if (keyEvent is KeyDownEvent) {
            if (keyEvent.logicalKey == LogicalKeyboardKey.backspace) {
              if (_textControllers[index]!.text.isEmpty) {
                _focusNodes[index]!.unfocus();
                _focusNodes[index - 1]!.requestFocus();
              }
            }
          }
        },
        child: TextField(
          controller: _textControllers[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          maxLines: null,
          minLines: null,
          expands: true,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textCapitalization: TextCapitalization.none,
          focusNode: _focusNodes[index],
          cursorHeight: 15,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            filled: true,

            fillColor: Colors.transparent,
            counterText: "",
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.neutral200),
              borderRadius: BorderRadius.circular(10),
            ),
            isDense: true,
            errorText: null,
            // to hide the error text
            errorStyle: const TextStyle(height: 0, fontSize: 0),
          ),
          onChanged: (String str) {
            if (str.length > 1) {
              _handlePaste(str);
              return;
            }

            if (str.isEmpty) {
              if (index == 0) return;
              _focusNodes[index]!.unfocus();
              _focusNodes[index - 1]!.requestFocus();
            }
            setState(() {
              _pin[index] = str;
            });
            widget.onChange?.call(_getCurrentPin());

            if (str.isNotEmpty) _focusNodes[index]!.unfocus();
            if (index + 1 != 7 && str.isNotEmpty) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            }
          },
        ),
      ),
    );
  }

  String _getCurrentPin() {
    String currentPin = "";
    for (var (index, value) in _pin.indexed) {
      if (_textControllers[index]!.text.isEmpty) {
        currentPin += 'x';
      } else {
        currentPin += value.isEmpty ? 'x' : value;
      }
    }
    return currentPin;
  }

  void _handlePaste(String str) {
    if (str.length > 7) {
      str = str.substring(0, 7);
    }

    for (int i = 0; i < str.length; i++) {
      String digit = str.substring(i, i + 1);
      _textControllers[i]!.text = digit;
      _pin[i] = digit;
    }

    FocusScope.of(context).requestFocus(_focusNodes[7 - 1]);
  }

  void handleFocusChange(int index) {
    print("Focus changed for index $index");
    FocusNode? focusNode = _focusNodes[index];
    TextEditingController? controller = _textControllers[index];

    if (focusNode == null || controller == null) return;

    if (focusNode.hasFocus) {
      controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
    }
  }
}
