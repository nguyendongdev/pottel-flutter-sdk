import 'package:flutter/material.dart';

class PackageDetailHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBackPressed;

  const PackageDetailHeader({
    super.key,
    required this.title,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              // Back button
              GestureDetector(
                onTap: onBackPressed,
                child: Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.chevron_left,
                    size: 24,
                    color: Color(0xFF333333),
                  ),
                ),
              ),

              const SizedBox(width: 20),

              // Title
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(width: 44), // Balance the back button space
            ],
          ),
        ),
      ),
    );
  }
}
