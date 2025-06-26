import 'package:flutter/material.dart';
import 'package:sushi/core/utils/color_manger.dart';
import 'package:sushi/core/utils/constans.dart';
import 'package:sushi/core/utils/style_manager.dart';
import '../../core/widgets/form_container.dart';
import '../../routing/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryBg,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              Text(
                'Welcome Back! 🥢',
                style: headlineNew3.copyWith(
                  color: ColorManager.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue',
                style: hintline.copyWith(color: ColorManager.grey),
              ),
              const SizedBox(height: 32),

              FormContainerWidget(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),

              FormContainerWidget(
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                isPasswordField: true,
              ),
              const SizedBox(height: 16),

              // Terms & Conditions
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                },
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: ColorManager.primary,
                      checkColor: ColorManager.white,
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'Accept ',
                      style: hintline.copyWith(color: ColorManager.lightGrey),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Terms and Conditions',
                        style: hintline.copyWith(color: ColorManager.grey),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Create Account Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Routes.home);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    'Login',
                    style: hintline.copyWith(
                      color: ColorManager.lightGrey,
                      fontSize: 18,
                      fontFamily: AppConstants.mPlusRounded,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: hintline.copyWith(
                      color: ColorManager.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(Routes.registerRoute);
                    },
                    child: Text(
                      "Sign Up",
                      style: hintline.copyWith(
                        color: ColorManager.lightGrey,
                        fontSize: 16,
                        fontFamily: AppConstants.mPlusRounded,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
