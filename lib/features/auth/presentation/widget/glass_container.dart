import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  const GlassContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            // width: 300,
            // height: 200,
            // margin: const EdgeInsets.symmetric(
            //     horizontal: 30, vertical: 20),
            padding: const EdgeInsets.all(25),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),

              // glass gradient
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.35),
                  Colors.white.withOpacity(0.15),
                ],
              ),

              // glass border
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5,
              ),

              // soft glow
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 25,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
