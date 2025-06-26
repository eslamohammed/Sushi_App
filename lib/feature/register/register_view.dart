import 'package:flutter/material.dart';

import '../../core/utils/color_manger.dart';
import '../../core/utils/constans.dart';
import '../../core/utils/style_manager.dart';
import '../../core/widgets/form_container.dart';
import '../../routing/routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      appBar: AppBar(
        backgroundColor: ColorManager.primaryBg,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
          },
          icon: Icon(Icons.arrow_back, color: ColorManager.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                'Create Account',
                style: headlineNew3.copyWith(
                  color: ColorManager.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Simplify your crypto payments with us',
                style: hintline.copyWith(color: ColorManager.grey),
              ),
              const SizedBox(height: 32),

              // Custom Input Fields
              FormContainerWidget(
                controller: _firstNameController,
                labelText: 'First Name',
                icon: Icons.person,
              ),
              const SizedBox(height: 16),

              FormContainerWidget(
                controller: _lastNameController,
                labelText: 'Last Name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),

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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    'Create Account',
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
                    "Already have an account?",
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
                      ).pushReplacementNamed(Routes.loginRoute);
                    },
                    child: Text(
                      "Login",
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
