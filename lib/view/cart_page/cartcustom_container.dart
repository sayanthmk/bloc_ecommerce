import 'package:flutter/material.dart';

class ProductRow extends StatelessWidget {
  final String greyContainerText;
  final Widget redContainerChild;

  const ProductRow({
    super.key,
    required this.greyContainerText,
    required this.redContainerChild,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          color: Colors.grey[100],
          child: Center(
            child: Text(
              greyContainerText,
              style: const TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
        Container(
          width: 210,
          height: 100,
          color: Colors.white,
          child: Center(
            child: redContainerChild,
          ),
        ),
      ],
    );
  }
}
