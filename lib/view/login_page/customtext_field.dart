import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String heading;
  final String labelText;
  // final Icon prefixIcon;
  final TextInputType keyboard;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.heading,
    required this.labelText,
    // required this.prefixIcon,
    required this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,

                  // prefixIcon: prefixIcon,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  labelText: labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10),
                  // contentPadding: const EdgeInsets.all(5),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: keyboard,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '* Required Field';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
