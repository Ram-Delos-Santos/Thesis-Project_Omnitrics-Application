import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class getStartedButton extends StatelessWidget {
  final VoidCallback onPressed;
  const getStartedButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Call the function when pressed
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.deepPurple.shade900;
              }
              return Colors.deepPurple;
              }
            ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0.r),
          ),
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: 120.w,
            vertical: 16.h,
          ),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
