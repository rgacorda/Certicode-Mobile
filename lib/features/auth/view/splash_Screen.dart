import 'package:flutter/material.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import '../../../utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500), // 1.5s fade
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start fade-in
    _controller.forward();

    // Wait, then fade out, then navigate
    Future.delayed(const Duration(seconds: 2), () {
      _controller.reverse(); // fade-out
    });

    // Navigate after fade-out finishes
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/'); // Change to your actual first route, like '/get_started'
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Image.asset(
            'assets/images/logo2.png',
            width: 300,
            height: 100,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
