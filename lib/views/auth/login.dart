import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eshop_app/bottom_navigation/bottom_navigation.dart';
import 'package:eshop_app/utils/constant.dart';
import 'package:eshop_app/utils/validation.dart';
import 'package:eshop_app/viewModel/auth/auth_view_model.dart';
import 'package:eshop_app/views/auth/clipper/clipper.dart';
import 'package:eshop_app/views/auth/signup.dart';
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
              labelStyle: const TextStyle(color: Colors.cyan),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.grey.shade400,
              ),
              border: InputBorder.none,
              focusColor: primaryColor,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color:primaryColor ),
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
              labelStyle:const  TextStyle(color: Colors.cyan),
              prefixIcon: const Icon(
                Icons.password,
                color: Colors.cyan,
              ),
              border: InputBorder.none,
              focusColor: primaryColor,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: primaryColor),
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
                    color: Colors.cyan,
                  ))),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(children: [
        Stack(
          children: [
            Positioned(
              top: 80,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'EShop',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/logo/logo-big.png',
                    height: 55,
                    width: 55,
                  ),
                ],
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
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500,color: primaryColor),
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
