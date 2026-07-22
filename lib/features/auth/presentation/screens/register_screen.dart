import 'package:flutter/material.dart';
import 'package:geos/core/theme/theme.dart';
import 'package:geos/features/auth/presentation/widgets/input_field.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  static const String path = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController firstNameController;
  late final TextEditingController middleNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController suffixController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController provinceController;
  late final TextEditingController cityController;
  late final TextEditingController barangayController;

  bool _isFilipino = false;
  bool _isOthers = false;
  bool _obscurePass = false;
  bool _obscureConfirmation = false;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    middleNameController = TextEditingController();
    lastNameController = TextEditingController();
    suffixController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    provinceController = TextEditingController();
    cityController = TextEditingController();
    barangayController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    suffixController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    provinceController.dispose();
    cityController.dispose();
    barangayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.backgroundColor,
      appBar: AppBar(
        leadingWidth: 100,
        leading: GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Row(
            children: [
              Expanded(
                child: Icon(Icons.keyboard_backspace, color: Themes.primary),
              ),
              Text(
                "Login",
                style: GoogleFonts.manrope(
                  color: Themes.primary,
                  fontSize: 18,
                  fontWeight: const FontWeight(700),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: ListView(
          children: [
            Text(
              "Create Account",
              style: GoogleFonts.manrope(
                fontSize: 29,
                fontWeight: FontWeight(700),
              ),
            ),
            Text(
              "Kindly fill up the form below with your correct information.",
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight(500),
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
              width: double.infinity,
              decoration: BoxDecoration(color: Themes.cardColor),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: InputField(
                            label: "First Name",
                            hintText: "e.g. Calex",
                            controller: firstNameController,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: InputField(
                            label: "Middle Name",
                            hintText: "e.g. Sine",
                            controller: middleNameController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: InputField(
                            label: "Last Name",
                            hintText: "e.g. Nomine",
                            controller: lastNameController,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: InputField(
                            label: "Suffix",
                            hintText: "e.g. Jr",
                            controller: suffixController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  InputField(
                    label: "Phone Number",
                    controller: phoneNumberController,
                    inputDecoration: const InputDecoration(
                      hintText: "Enter your phone number",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  InputField(
                    label: "Email",
                    hintText: "example@gmail.com",
                    controller: emailController,
                  ),
                  const SizedBox(height: 14),
                  InputField(
                    label: "Password",
                    controller: passwordController,
                    shouldObscure: _obscurePass,
                    inputDecoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (_obscurePass) {
                              _obscurePass = false;
                            } else {
                              _obscurePass = true;
                            }
                          });
                        },
                        icon: _obscurePass
                            ? const Icon(Icons.check_circle)
                            : const Icon(Icons.circle_outlined),
                      ),
                      hintText: "Enter your password",
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  InputField(
                    label: "Confirm Password",
                    controller: confirmPasswordController,
                    shouldObscure: _obscureConfirmation,
                    inputDecoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (_obscureConfirmation) {
                              _obscureConfirmation = false;
                            } else {
                              _obscureConfirmation = true;
                            }
                          });
                        },
                        icon: _obscureConfirmation
                            ? const Icon(Icons.check_circle)
                            : const Icon(Icons.circle_outlined),
                      ),
                      hintText: "Enter your password",
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
              width: double.infinity,
              decoration: BoxDecoration(color: Themes.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nationality",
                    style: GoogleFonts.manrope(
                      fontWeight: const FontWeight(800),
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        shape: const CircleBorder(),
                        value: _isFilipino,
                        onChanged: (bool? value) {
                          setState(() {
                            _isFilipino = value!;
                            if (_isOthers) _isOthers = false;
                          });
                        },
                      ),
                      Text(
                        "Filipino",
                        style: GoogleFonts.manrope(
                          fontWeight: const FontWeight(600),
                          fontSize: 14,
                        ),
                      ),
                      Checkbox(
                        shape: const CircleBorder(),
                        value: _isOthers,
                        onChanged: (bool? value) {
                          setState(() {
                            _isOthers = value!;
                            if (_isFilipino) _isFilipino = false;
                          });
                        },
                      ),
                      Text(
                        "Others",
                        style: GoogleFonts.manrope(
                          fontWeight: const FontWeight(600),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
              width: double.infinity,
              decoration: BoxDecoration(color: Themes.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Addre",
                    style: GoogleFonts.manrope(
                      fontWeight: const FontWeight(800),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
