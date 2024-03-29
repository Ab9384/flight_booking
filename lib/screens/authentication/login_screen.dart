import 'package:flight/firebase/auth_function.dart';
import 'package:flight/functions/navigator_function.dart';
import 'package:flight/functions/regex_function.dart';
import 'package:flight/screens/authentication/signup_screen.dart';
import 'package:flight/utils/app_colors.dart';
import 'package:flight/widgets/custom_textfield.dart';
import 'package:flight/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? emailError;
  String? passwordError;
  bool obscureText = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: PopScope(
        canPop: !isLoading,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
              ),
              Expanded(
                child: SlideTransition(
                  position: _animation,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Let\'s Sign You In',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 26,
                                fontFamily: 'roboto-bold',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Welcome back, you\'ve been missed!',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            CustomTextField(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              keyboardType: TextInputType.emailAddress,
                              errorText: emailError,
                              controller: _emailController,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: obscureText,
                              errorText: passwordError,
                              controller: _passwordController,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: Icon(
                                  obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            PrimaryButton(
                              text: 'Sign In',
                              onPressed: () async {
                                if (!RegexFunction.isEmailValid(
                                    _emailController.text)) {
                                  setState(() {
                                    emailError = 'Please enter a valid email';
                                    passwordError = null;
                                  });
                                  return;
                                }
                                if (!RegexFunction.isPasswordValid(
                                    _passwordController.text)) {
                                  setState(() {
                                    emailError = null;
                                    passwordError =
                                        'Password must be 8 characters long and contain at least one letter and one number';
                                  });
                                  return;
                                }
                                debugPrint('Sign in');
                                setState(() {
                                  emailError = null;
                                  passwordError = null;
                                  isLoading = true;
                                });

                                await AuthFunction().signInWithEmailAndPassword(
                                    _emailController.text,
                                    _passwordController.text,
                                    context);
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              isBusy: isLoading,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // or with divider and text
                            const Row(
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: AppColors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // sign in with google
                            Center(
                              child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/icons/google.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.backgroundColor,
                                    surfaceTintColor: AppColors.backgroundColor,
                                    splashFactory: NoSplash.splashFactory,
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  label: const Text('Sign in with Google',
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w500))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // don't have an account yet
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        NavigatorFunctions.navigateTo(
                            context, const SignUpScreen());
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
