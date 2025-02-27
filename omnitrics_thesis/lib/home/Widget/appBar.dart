import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnitrics_thesis/profile/profileTemporary.dart';

AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text('OmniTrics',
        style: TextStyle(
          color: Colors.black,
          fontSize: 38,
          fontWeight: FontWeight.bold,
        )
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 6.0,
      shadowColor: Colors.grey,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePageTemp())
            );
        },
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/Display Picture Variants.svg',
          ),
        ),
        ),
      ],
    );
}