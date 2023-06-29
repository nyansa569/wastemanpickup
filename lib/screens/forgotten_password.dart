import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ForgottenPassword extends StatefulWidget {
  const ForgottenPassword({super.key});

  @override
  State<ForgottenPassword> createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Forgotten password?'),
        ),
      ),
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                "Oops!\nDo you need any help concerning your account? \nKindly come to the office while you help us recover your account",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 80),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Okay",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
