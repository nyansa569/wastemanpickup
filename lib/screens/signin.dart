import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/widget.dart';
import './screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // void signInUser() async {
  //   String res = 'success';
  //   // String res = await MainAuthMethods().signInUser(
  //   //   email: emailController.text,
  //   //   password: passwordController.text,
  //   // );

  //   if (res == 'success') {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => HomeScreen(),
  //       ),
  //     );
  //   } else {
  //     print('User error');
  //   }
  // }

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/borla.png'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 600,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(26, 40, 39, 39),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                  // right: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    WelcomeText(
                      text: 'Welcome back! Glad to see you again!',
                    ),
                    SizedBox(height: 20),
                    buildTextField(
                      textInputType: TextInputType.emailAddress,
                      label: 'Email',
                      hintText: 'zyx@gmail.com',
                      icon: Icons.mail,
                    ),
                    SizedBox(height: 20),
                    BuildPassword(isVisible: isVisible),
                    // SizedBox(height: 10),
                    BuildForgottenPassword(someWidget: ForgottenPassword()),
                    // SizedBox(height: ),
                    BuildSignButton(
                      text: 'Sign me in',
                      // onPressed: signInUser,
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                    ),
                    const Expanded(child: SizedBox()),
                    Text('To create an account, please visit any office nearby')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
