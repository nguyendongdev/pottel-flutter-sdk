import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';
import '../models/compatible_device_response.dart';

class BrandSection extends StatefulWidget {
  final BrandDevices brandDevices;

  const BrandSection({
    super.key,
    required this.brandDevices,
  });

  @override
  _BrandSectionState createState() => _BrandSectionState();
}

class _BrandSectionState extends State<BrandSection> {
  late bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.border,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.brandDevices.brand,
                  style: AppTextStyles.title.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                icon: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
        ),
        _isExpanded
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.brandDevices.devices.length,
                itemBuilder: (context, index) {
                  final device = widget.brandDevices.devices[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      device.name,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.text,
                      ),
                    ),
                  );
                },
              )
            : SizedBox(),
      ],
    );
  }
}
