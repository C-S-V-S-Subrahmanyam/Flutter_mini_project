import 'package:flutter/material.dart';
import 'sign_up.dart'; // Import the SignUpScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, // Dark theme for background
        primaryColor: Colors.blue,  // Blue buttons and accents
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to XYZ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Email Id',
              hintText: 'Enter your mail id',
              obscureText: false,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Password',
              hintText: 'Enter your password',
              obscureText: !_isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSignInButton(),
            const SizedBox(height: 20),
            Center(
              child: Row(
                  children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    "or sign in with",
                    style: TextStyle(color: Colors.blue),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                      indent: 10,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildSocialIcons(),
            const SizedBox(height: 20),
            _buildSignUpOption(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 5),
        TextField(
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity, // Makes the button stretch to full width
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          // Sign-in logic goes here
        },
        child: const Text(
          "Sign in",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }


  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Handle Google sign-in
          },
          child: CircleAvatar(
            radius: 10, // Adjust size as needed
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/img_3.png', // Ensure you have the Google logo in your assets
              width: 40, // Adjust image size
              height: 40, // Adjust image size
            ),
          ),
        ),
        const SizedBox(width: 20), // Space between icons
        GestureDetector(
          onTap: () {
            // Handle Apple sign-in
          },
          child: CircleAvatar(
            radius: 20, // Adjust size as needed
            backgroundColor: Colors.black,
            child: Image.asset(
              'assets/img_5.png', // Ensure you have the Apple logo in your assets
              width: 30, // Adjust image size
              height: 30, // Adjust image size
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpOption() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Text("Don't have an account?", style: TextStyle(color: Colors.white)),
        TextButton(
        onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      ); // Navigate to SignUpScreen
    },
    child: const Text(
    "Sign Up",
    style: TextStyle(color: Colors.blue,
      decoration: TextDecoration.underline,
      decorationColor: Colors.blue,
    ),
    ),
    ),
    ],
    );
  }
}