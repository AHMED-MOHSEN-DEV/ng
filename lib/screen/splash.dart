import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramy/screen/home.dart';
import '../../constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlack,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // صورة المفكر مع overlay ناعم
          Image.asset(
            'assets/ng.jpg',
            fit: BoxFit.cover,
          ),
          
          // Gradient overlay ناعم
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.deepBlack.withOpacity(0.4),
                  AppColors.deepBlack.withOpacity(0.85),
                  AppColors.deepBlack,
                ],
                stops: const [0.0, 0.6, 1.0],
              ),
            ),
          ),
          
          // محتوى الصفحة
          FadeTransition(
            opacity: _fadeAnimation,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const Spacer(flex: 3),
                    const SizedBox(height: 40),
                    
                    // العنوان
                    Text(
                      'نجيب محفوظ',
                      style: GoogleFonts.tajawal(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        color: AppColors.warmWhite,
                        letterSpacing: 1,
                        height: 1.2,
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // وصف
                    Text(
                      'استكشف عالم المفكر نجيب محفوظ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.tajawal(
                        fontSize: 16,
                        color: AppColors.softGold.withOpacity(0.9),
                        letterSpacing: 0.5,
                        height: 1.5,
                      ),
                    ),
                    
                    const Spacer(flex: 4),
                    
                    // زر الدخول الحديث
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryGold,
                            AppColors.accentGold,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryGold.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(opacity: animation, child: child);
                                },
                                transitionDuration: const Duration(milliseconds: 600),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Center(
                            child: Text(
                              'ابدأ الرحلة',
                              style: GoogleFonts.tajawal(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.deepBlack,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
