import 'package:flutter/material.dart';
import 'package:instagram_tutorial/pages/register_page.dart';
import 'package:instagram_tutorial/resources/auth_methods.dart';
import 'package:instagram_tutorial/utils/util.dart';
import 'package:instagram_tutorial/widgets/text_field_input.dart';

import '../responsive/mobile_page_layout.dart';
import '../responsive/responsive_layout_page.dart';
import '../responsive/web_page_layout.dart';
import '../utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  // Dispose the controller
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  // Login
  void loginUser() async {
    // Loding
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (res == "Success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayoutPage(
            webPageLayout: WebPageLayout(),
            mobilePageLayout: MobilePageLayout(),
          ),
        ),
      );
      //
    } else {
      //
      showSnackBar(res, context);
    }
    // Loding
    setState(() {
      _isLoading = false;
    });
  }

  // Sign up
  void navigateToSignUp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Image.asset(
                'assets/instagram-log-white.png',
                height: 64,
              ),

              // Email
              const SizedBox(height: 64),
              TextInputField(
                textEditingController: _emailController,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),

              // Password
              TextInputField(
                textEditingController: _passwordController,
                hintText: 'Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24),

              // Login Button
              InkWell(
                onTap: loginUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : Text("Login"),
                ),
              ),
              const SizedBox(height: 24),
              Flexible(
                child: Container(),
                flex: 2,
              ),

              // Register
              //Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Not a member? ",
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: navigateToSignUp,
                    child: Container(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
