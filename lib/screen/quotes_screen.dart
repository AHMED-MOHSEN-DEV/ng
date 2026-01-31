import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> quotes = [
      {
        'text': 'الحياة لا تعطي الأشخاص ما يستحقونه، بل تعطي كل شخص ما يستحق أن يحصل عليه.',
        'category': 'الحياة',
        'image': 'assets/a.jpg',
        'color': const Color(0xFFFFD54F),
      },
      {
        'text': 'العقل البشري هو الخزانة التي تحتوي على كل المعرفة والحكمة.',
        'category': 'العقل',
        'image': 'assets/brain.jpg',
        'color': const Color(0xFF42A5F5),
      },
      {
        'text': 'الحب هو النور الذي يضيء دروب الحياة المظلمة.',
        'category': 'الحب',
        'image': 'assets/quotes/love.jpg',
        'color': const Color(0xFFE91E63),
      },
      {
        'text': 'الصبر مفتاح الفرج والفرح.',
        'category': 'الصبر',
        'image': 'assets/quotes/patience.jpg',
        'color': const Color(0xFF9C27B0),
      },
      {
        'text': 'الجهل هو أكبر أعداء الإنسان.',
        'category': 'الجهل',
        'image': 'assets/quotes/ignorance.jpg',
        'color': const Color(0xFFFF5722),
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.deepBlack,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // SliverAppBar مع Blur أسود
          SliverAppBar(
            expandedHeight: 180,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.charcoal,
            leading: IconButton(
              icon: Icon(Icons.arrow_forward_rounded, color: AppColors.softGold),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'حكم نجيب محفوظ',
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.warmWhite,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/quotes/quotes_bg.jpg',
                    fit: BoxFit.cover,
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.deepBlack.withOpacity(0.7),
                            AppColors.deepBlack.withOpacity(0.95),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Grid المقولات
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final quote = quotes[index];
                  
                  return GestureDetector(
                    onTap: () {
                      _showQuoteDialog(context, quote);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: quote['color'].withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            // صورة الخلفية
                            Image.asset(
                              quote['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            
                            // Overlay تدريجي
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    AppColors.deepBlack.withOpacity(0.9),
                                  ],
                                ),
                              ),
                            ),
                            
                            // محتوى الكارد
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      AppColors.deepBlack.withOpacity(0.95),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // الفئة
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: quote['color'].withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        quote['category'],
                                        style: GoogleFonts.tajawal(
                                          fontSize: 12,
                                          color: AppColors.softGold,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    
                                    const SizedBox(height: 8),
                                    
                                    // جزء من المقولة
                                    Text(
                                      '${quote['text'].toString().split(' ').take(4).join(' ')}...',
                                      maxLines: 2,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.warmWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: quotes.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showQuoteDialog(BuildContext context, Map<String, dynamic> quote) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.charcoal.withOpacity(0.95),
                  AppColors.deepBlack.withOpacity(0.95),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: quote['color'].withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    quote['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.deepBlack.withOpacity(0.8),
                          Colors.black.withOpacity(0.9),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: quote['color'].withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              quote['category'],
                              style: GoogleFonts.tajawal(
                                fontSize: 13,
                                color: AppColors.softGold,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.close_rounded, color: AppColors.softGold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            quote['text'],
                            style: GoogleFonts.tajawal(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.warmWhite,
                              height: 1.8,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  quote['color'].withOpacity(0.4),
                                  quote['color'].withOpacity(0.2),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.format_quote_rounded,
                              color: AppColors.warmWhite,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'نجيب محفوظ',
                            style: GoogleFonts.tajawal(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryGold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
