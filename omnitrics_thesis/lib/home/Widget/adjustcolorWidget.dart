import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container adjustColorTiles() {
    return Container(
          margin: const EdgeInsets.all(10), 
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10), 
            boxShadow: [
              BoxShadow(
              color: Colors.grey, 
              spreadRadius: 2, 
              blurRadius: 5,
              offset: const Offset(0, 3), 
              ),
            ],
          ),
          child: ListTile(
            title: Text('Adjust Color Settings',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            )
            ),
            leading: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                'assets/icons/Camera.svg',
                width: 30,
                height: 30,),
            ),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              onPressed: () {},
              child: Text(
                'Apply',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
              ),
            )
          ),
        );
  }