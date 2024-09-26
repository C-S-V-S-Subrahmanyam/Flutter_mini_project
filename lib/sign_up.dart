import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
              "Sign Up",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTextField(label: 'Name', hintText: 'Enter your name'),
            const SizedBox(height: 20),
            _buildTextField(label: 'Email Id', hintText: 'Enter your mail id'),
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
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Confirm Password',
              hintText: 'Enter your password',
              obscureText: !_isConfirmPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            _buildSignUpButton(),
            const SizedBox(height: 20),
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
            _buildSocialIcons(),
            _buildSignInOption(),
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

  Widget _buildSignUpButton() {
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
          // Sign-up logic goes here
        },
        child: const Text(
          "Sign up",
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
              'assets/img.png', // Ensure you have the Google logo in your assets
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
              'assets/img_2.png', // Ensure you have the Apple logo in your assets
              width: 30, // Adjust image size
              height: 30, // Adjust image size
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildSignInOption() {
    return Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?", style: TextStyle(color: Colors.white)),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Navigate back to the login screen
          },
          child: const Text(
            "Sign In",
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
