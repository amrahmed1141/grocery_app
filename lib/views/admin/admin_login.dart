import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eshop_app/utils/constant.dart';
import 'package:eshop_app/views/admin/admin_home.dart';
import 'package:eshop_app/views/admin/widgets/my_textfield.dart';
import 'package:eshop_app/views/auth/login.dart';
import 'package:iconsax/iconsax.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            const SizedBox(height: 80),
           Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'EShop',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/logo/logo-big.png',
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
            const SizedBox(height: 30),
            Text(
              'Welcome to Admin Side',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30),
            MyTextfield(
              controller: emailController,
              text: 'Email',
              obscureText: false,
              icons: const Icon(Icons.email, color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            MyTextfield(
              controller: passwordController,
              text: 'Password',
              obscureText: true,
              icons: const Icon(Icons.password, color: Colors.deepPurple),
            ),
            const SizedBox(height: 80),
            MaterialButton(
              onPressed: _isLoading ? null : () => _handleLogin(context),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              color: Colors.deepPurple,
              disabledColor: primaryColor.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.lock, color: Colors.white),
                          SizedBox(width: 3),
                          Text(
                            'Login',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      
      try {
        final snapshot = await FirebaseFirestore.instance
            .collection('Admin2')
            .where('id', isEqualTo: emailController.text.trim())
            .where('password', isEqualTo: passwordController.text.trim())
            .limit(1)
            .get();

        if (snapshot.docs.isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AdminHome()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid credentials'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }
}