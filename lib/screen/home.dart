import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramy/screen/bio_screen.dart';
import 'package:ramy/screen/books_screen.dart';
import 'package:ramy/screen/interviews_screen.dart';
import 'package:ramy/screen/naguib_mahfouz_info_screen.dart';
import 'package:ramy/screen/quotes_screen.dart';
import 'package:ramy/widgets/arabic_button.dart';
import '../../constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlack,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.deepBlack,
              AppColors.charcoal,
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Header مودرن
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primaryGold,
                                  AppColors.accentGold,
                                ],
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.deepBlack,
                              ),
                              child: CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage('assets/ng2.jpg'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'نجيب محفوظ',
                                  style: GoogleFonts.tajawal(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.warmWhite,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'أديب ومفكر مصري',
                                  style: GoogleFonts.tajawal(
                                    fontSize: 14,
                                    color: AppColors.softGold.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'استكشف المحتوى',
                          style: GoogleFonts.tajawal(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.warmWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Grid الكروت
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  delegate: SliverChildListDelegate([
                    ModernCard(
  icon: Icons.person_outline_rounded,
  title: 'نبذة عنه',
  subtitle: 'السيرة الذاتية',
  gradient: LinearGradient(
    colors: [
      AppColors.primaryGold.withOpacity(0.12),
      AppColors.accentGold.withOpacity(0.08),
    ],
  ),
  onTap: () {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const BioScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  },
),

                    ModernCard(
                      icon: Icons.menu_book_rounded,
                      title: 'الكتب',
                      subtitle: 'مكتبة المؤلفات',
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryGold.withOpacity(0.15),
                          AppColors.accentGold.withOpacity(0.05),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BooksScreen()),
    );
                      },
                    ),
ModernCard(
  icon: Icons.format_quote_rounded,
  title: 'المقولات',
  subtitle: 'حكم وأقوال',
  gradient: LinearGradient(
    colors: [
      AppColors.accentGold.withOpacity(0.15),
      AppColors.primaryGold.withOpacity(0.05),
    ],
  ),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuotesScreen()),
    );
  },
),

                    
ModernCard(
  icon: Icons.info_outline_rounded,
  title: 'معلومات',
  subtitle: 'سيرة نجيب محفوظ',
  gradient: LinearGradient(
    colors: [
      AppColors.primaryGold.withOpacity(0.1),
      AppColors.accentGold.withOpacity(0.05),
    ],
  ),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NaguibMahfouzInfoScreen(),
      ),
    );
  },
),

ModernCard(
  icon: Icons.mic_rounded,
  title: 'اللقاءات',
  subtitle: 'حوارات مع المفكر',
  gradient: LinearGradient(
    colors: [
      AppColors.primaryGold.withOpacity(0.12),
      AppColors.accentGold.withOpacity(0.08),
    ],
  ),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InterviewsScreen()),
    );
  },
),

                  ]),
                ),
              ),
              
              const SliverToBoxAdapter(
                child: SizedBox(height: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
