import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramy/chapters/bayn_alqasrayn_chapters.dart';
import 'package:ramy/chapters/qasr_alshawq_chapters.dart';
import '../../constants/app_colors.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> books = [
      {
        'title': 'بين القصرين',
        'subtitle': 'الجزء الأول من ثلاثية القاهرة',
        'image': 'assets/books/ben2asren.jpg',
        'author': 'نجيب محفوظ',
        'color': const Color(0xFFFFD54F),
      },
      {
        'title': 'قصر الشوق',
        'subtitle': 'الجزء الثاني من ثلاثية القاهرة',
        'image': 'assets/books/2asrsho2.jpg',
        'author': 'نجيب محفوظ',
        'color': const Color(0xFFFFB74D),
      },
      {
        'title': 'السكرية',
        'subtitle': 'الجزء الثالث من ثلاثية القاهرة',
        'image': 'assets/books/sokaria.jpg',
        'author': 'نجيب محفوظ',
        'color': const Color(0xFFFF8F00),
      },
      {
        'title': 'أولاد حارتنا',
        'subtitle': 'رواية رمزية مثيرة للجدل',
        'image': 'assets/books/awlad7artna.jpg',
        'author': 'نجيب محفوظ',
        'color': const Color(0xFFE53935),
      },
      {
        'title': 'زقاق المدق',
        'subtitle': 'صورة واقعية لحياة حارة مصرية',
        'image': 'assets/books/z2a2.jpg',
        'author': 'نجيب محفوظ',
        'color': const Color(0xFFAB47BC),
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
                'مكتبة نجيب محفوظ',
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.warmWhite,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // الصورة
                  Image.asset(
                    'assets/ng3.jpg',
                    fit: BoxFit.cover,
                  ),
                  // Blur أسود
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
          
          // Grid الكتب
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
                  final book = books[index];
                  
                  return GestureDetector(
                    onTap: () {
  Widget? chapterScreen;
  
  switch (book['title']) {
    case 'بين القصرين':
      chapterScreen = const BaynAlqasraynChapters();
      break;
    case 'قصر الشوق':
      chapterScreen = const QasrAlshawqChapters();
      break;
    
  }
  
  if (chapterScreen != null) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => chapterScreen!),
    );
  }
},

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: book['color'].withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            // صورة الكتاب
                            Image.asset(
                              book['image'],
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
                                    // نوع الكتاب
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: book['color'].withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'رواية',
                                        style: GoogleFonts.tajawal(
                                          fontSize: 12,
                                          color: AppColors.softGold,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    
                                    const SizedBox(height: 8),
                                    
                                    // اسم الكتاب
                                    Text(
                                      book['title'],
                                      maxLines: 2,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.warmWhite,
                                      ),
                                    ),
                                    
                                    const SizedBox(height: 4),
                                    
                                    // الوصف
                                    Text(
                                      book['subtitle'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 12,
                                        color: AppColors.softGold.withOpacity(0.8),
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
                childCount: books.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
