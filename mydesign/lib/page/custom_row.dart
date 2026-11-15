import '../model/post_model.dart';

import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String? text;
  const CustomRow({
    super.key,
    required this.text,
  });

 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
            color: Color(0xffE96C9B),
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
               fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
