import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_tutorial/pages/login_page.dart';
import 'package:instagram_tutorial/resources/auth_methods.dart';
import 'package:instagram_tutorial/utils/util.dart';

import '../responsive/mobile_page_layout.dart';
import '../responsive/responsive_layout_page.dart';
import '../responsive/web_page_layout.dart';
import '../utils/colors.dart';
import '../widgets/text_field_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  // Dispose the controller
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  // Image
  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  // signup USer
  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().SignUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _userNameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });

    if (res != "Success") {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayoutPage(
            webPageLayout: WebPageLayout(),
            mobilePageLayout: MobilePageLayout(),
          ),
        ),
      );
    }
  }

  // Login
  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
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

              const SizedBox(height: 54),
              // Circular widget to show profile
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://static.thenounproject.com/png/1995071-200.png'),
                          backgroundColor: Colors.white,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Username
              TextInputField(
                textEditingController: _userNameController,
                hintText: 'Username',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 18),

              // Email
              TextInputField(
                textEditingController: _emailController,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 18),

              // Password
              TextInputField(
                textEditingController: _passwordController,
                hintText: 'Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 18),

              // Bio
              TextInputField(
                textEditingController: _bioController,
                hintText: 'Bio',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 18),

              // Login Button
              InkWell(
                onTap: signUpUser,
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
                      : Text("Sign Up"),
                ),
              ),
              const SizedBox(height: 18),
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
                      "Already a member > ",
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
