import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/bottom_navigation/bottom_navigation.dart';
import 'package:grocery_app/utils/constant.dart';
import 'package:grocery_app/utils/validation.dart';
import 'package:grocery_app/viewModel/auth_view_model.dart';
import 'package:grocery_app/views/auth/clipper/clipper.dart';
import 'package:grocery_app/views/auth/signup.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  IconData iconPassword = CupertinoIcons.eye_slash_fill;
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: true);
    Widget _email() {
      return Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 6,
                  offset: const Offset(3, 3)),
            ]),
        child: TextFormField(
          controller: emailController,
          validator: validateEmail,
          decoration: InputDecoration(
              labelText: 'Enter your email',
              labelStyle: TextStyle(color: Colors.grey.shade400),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.grey.shade400,
              ),
              border: InputBorder.none,
              focusColor: Colors.grey.shade400,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade400),
                borderRadius: BorderRadius.circular(20),
              )),
        ),
      );
    }

    Widget _password() {
      return Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 6,
                  offset: const Offset(3, 3)),
            ]),
        child: TextFormField(
          controller: passwordController,
          validator: validatePassword,
          obscureText: obscurePassword,
          decoration: InputDecoration(
              labelText: 'Enter your password',
              labelStyle: TextStyle(color: Colors.grey.shade400),
              prefixIcon: Icon(
                Icons.password,
                color: Colors.grey.shade400,
              ),
              border: InputBorder.none,
              focusColor: Colors.grey,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(20),
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                      iconPassword = obscurePassword
                          ? CupertinoIcons.eye_slash_fill
                          : CupertinoIcons.eye_fill;
                    });
                  },
                  icon: Icon(
                    iconPassword,
                    color: Colors.grey.shade400,
                  ))),
        ),
      );
    }

    return Scaffold(
      backgroundColor: secondryColor,
      body: Column(children: [
        Stack(
          children: [
            Positioned(
              top: 80,
              left: 10,
              child: SvgPicture.asset(
                'assets/svg/Grabber.svg',
              ),
            ),
            CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 300),
                painter: RPSCustomPainter()),
            Positioned(
              top: 16,
              right: -5,
              child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 300),
                  painter: RPSCustomPainter()),
            ),
            const Positioned(
                top: 220,
                left: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Please Sign in to Continue',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ],
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _loginFormKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              const SizedBox(
                height: 25,
              ),
              _email(),
              const SizedBox(
                height: 25,
              ),
              _password(),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(color: primaryColor),
                  )),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  final user = authViewModel.login(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context);

                  if (user != null) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavigation()),
                        (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login successful!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else if (authViewModel.errorMssge != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(authViewModel.errorMssge!),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ),
      ]),
    );
  }
}
