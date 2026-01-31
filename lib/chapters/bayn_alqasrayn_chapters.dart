import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';

class BaynAlqasraynChapters extends StatelessWidget {
  const BaynAlqasraynChapters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chapters = [
      {'title': 'الفصل الأول', 'subtitle': 'السيد أحمد عبد الجواد', 'number': '١'},
      {'title': 'الفصل الثاني', 'subtitle': 'الأسرة والحياة اليومية', 'number': '٢'},
      {'title': 'الفصل الثالث', 'subtitle': 'فهمي وياسين', 'number': '٣'},
      {'title': 'الفصل الرابع', 'subtitle': 'الحب الأول', 'number': '٤'},
      {'title': 'الفصل الخامس', 'subtitle': 'الثورة والتغيير', 'number': '٥'},
    ];

    return _buildChapterScreen(
      context,
      'بين القصرين',
      'assets/books/ben2asren.jpg',
      const Color(0xFFFFD54F),
      chapters,
    );
  }

  Widget _buildChapterScreen(
    BuildContext context,
    String title,
    String image,
    Color color,
    List<Map<String, String>> chapters,
  ) {
    return Scaffold(
      backgroundColor: AppColors.deepBlack,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.charcoal,
            leading: IconButton(
              icon: Icon(Icons.arrow_forward_rounded, color: AppColors.softGold),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                title,
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.warmWhite,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(image, fit: BoxFit.cover),
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
          
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final chapter = chapters[index];
                  return _buildChapterCard(context, chapter, color);
                },
                childCount: chapters.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChapterCard(BuildContext context, Map<String, String> chapter, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            AppColors.charcoal.withOpacity(0.6),
            AppColors.charcoal.withOpacity(0.3),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${chapter['title']} - قراءة الفصل...'),
                backgroundColor: color,
              ),
            );
          },
          borderRadius: BorderRadius.circular(20),
          splashColor: color.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color.withOpacity(0.4),
                        color.withOpacity(0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      chapter['number']!,
                      style: GoogleFonts.tajawal(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.warmWhite,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chapter['title']!,
                        style: GoogleFonts.tajawal(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.warmWhite,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        chapter['subtitle']!,
                        style: GoogleFonts.tajawal(
                          fontSize: 14,
                          color: AppColors.softGold.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.softGold.withOpacity(0.6),
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
