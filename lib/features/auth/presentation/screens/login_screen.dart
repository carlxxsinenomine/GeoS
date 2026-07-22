import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geos/core/theme/theme.dart';
import 'package:geos/features/auth/presentation/screens/register_screen.dart';
import 'package:geos/features/auth/presentation/widgets/custom_outlined_button.dart';
import 'package:geos/features/auth/presentation/widgets/input_field.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static const String path = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  late final TextEditingController _emailOrNumberController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailOrNumberController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailOrNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            Center(
              child: Text(
                "Welcome Back",
                style: GoogleFonts.manrope(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                "Login to securely access your account.",
                style: GoogleFonts.manrope(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            InputField(
              label: "Email or Phone Number",
              controller: _emailOrNumberController,
              inputDecoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Enter your details",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
            const SizedBox(height: 24),
            InputField(
              label: "Password",
              controller: _passwordController,
              inputDecoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "Enter your password",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              child: Text(
                "Forgot password?",
                style: GoogleFonts.manrope(color: Themes.primary),
              ),
            ),
            const SizedBox(height: 31),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(backgroundColor: Themes.primary),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 31),
            Row(
              children: [
                Expanded(child: Divider(thickness: 2, color: Colors.grey[400])),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'OTHER LOGIN OPTIONS',
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(child: Divider(thickness: 2, color: Colors.grey[400])),
              ],
            ),
            const SizedBox(height: 31),
            CustomOutlinedButton(
              label: "Login with SMS code",
              icon: Icons.message,
            ),
            const SizedBox(height: 10),
            CustomOutlinedButton(label: "Login with Google", icon: Icons.email),
            const Expanded(child: SizedBox()),
            SafeArea(
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight(400),
                    ),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            GoRouter.of(context).push(RegisterScreen.path);
                          },
                        style: GoogleFonts.manrope(
                          color: Themes.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
