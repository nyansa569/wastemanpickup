import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class InfoWidget extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String description;
  const InfoWidget({
    this.icon,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        icon == null ? SizedBox() : SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlatformText(
              title,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black87,
                  fontSize: 20),
            ),
            PlatformText(
              description,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  color: Colors.black87,
                  fontSize: 20),
            ),
          ],
        )
      ],
    );
  }
}
