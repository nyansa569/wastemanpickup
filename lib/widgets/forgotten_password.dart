import 'package:flutter/material.dart';

class BuildForgottenPassword extends StatelessWidget {
  final Widget someWidget;
  const BuildForgottenPassword({
    super.key,
    required this.someWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: const Text(
          "Forgotten password?",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => someWidget),
            ),
          );
        },
      ),
    );
  }
}
