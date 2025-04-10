import 'package:flutter/material.dart';
import 'package:omnitrics_thesis/auth/emailVerification/email_verification_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnitrics_thesis/auth/services/authentication.dart';
import 'package:omnitrics_thesis/auth/sign-in/Widget/privacyPopUp.dart';
import 'package:omnitrics_thesis/auth/sign-in/Widget/snack_bar.dart';
import 'package:omnitrics_thesis/auth/sign-in/Widget/termsPopUp.dart';
import 'package:omnitrics_thesis/auth/sign-in/login.dart'; // Retain login for existing users

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers for the input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void userSignup() async {
    // Check if any field is empty
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      showSnackBar(context, "Please fill all the fields.");
      return;
    }
    // Sign up process
    String res = await AuthServices().userSignup(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
    //Debug
    print("Signup result: $res");
    if (res == "Please verify your email.") {
      setState(() {
        isLoading = true;
      });
      // Redirect to verification
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const VerificationScreen(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepPurple.shade700, Colors.deepPurple.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Center(
        child: Container(
          width: 340.w, // Responsive width using ScreenUtil
          padding: EdgeInsets.all(24.w), // Responsive padding
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                spreadRadius: 4.r,
                blurRadius: 16.r,
                offset: Offset(0.w, 3.w),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Username*',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                height: 53.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 103, 58, 183),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Email*',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                height: 53.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 103, 58, 183),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Password*',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                height: 53.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Create a password',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 103, 58, 183),
                          width: 2.0),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Must be at least 8 characters.',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 14.h),
              Center(child: 
              Wrap (
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    'By signing up, you agree to our ',
                    style: TextStyle(fontSize: 13.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context, 
                      builder: (BuildContextcontext) {
                      return termsPop();
                      }
                      );
                    },
                    child: Text(
                      'Terms and Conditions ',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                    ),
                  ),
                  Text(
                    'and ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context, 
                        builder: (BuildContext context) {
                          return privacypolicyPop();
                        });
                    },
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: userSignup,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Colors.deepPurple.shade900;
                        }
                        return Colors.deepPurple;
                      },
                    ),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(vertical: 16.h),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    elevation: WidgetStateProperty.all<double>(10),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      ' Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}