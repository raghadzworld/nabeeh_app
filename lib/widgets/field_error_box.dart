import 'package:flutter/material.dart';

class FieldErrorBox extends StatelessWidget {
  const FieldErrorBox({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5F5),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF4D1D1), width: 1.2),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          const Icon(
            Icons.error_outline_rounded,
            size: 20,
            color: Color(0xFFD9564F),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontFamily: 'IBMPlexSansArabic',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFD9564F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}