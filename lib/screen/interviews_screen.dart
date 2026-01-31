import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramy/widgets/interviewVideo.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../constants/app_colors.dart';

class InterviewsScreen extends StatelessWidget {
  const InterviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> interviews = [
      {
        'title': 'لقاء الأول',
        'subtitle': 'حوار مع نجيب محفوظ عن بداياته الأدبية',
        'date': '١٩٨٠',
        'image': 'assets/ng4.jpg',
        'video': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        'color': const Color(0xFFFFD54F),
      },
      {
        'title': 'لقاء الثاني',
        'subtitle': 'نوبل والثلاثية في حوار ممتع',
        'date': '١٩٨٨',
        'image': 'assets/ng4.jpg',
        'video': 'https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_1mb.mp4',
        'color': const Color(0xFF42A5F5),
      },
      {
        'title': 'لقاء الثالث',
        'subtitle': 'رؤية المفكر لمستقبل الأدب العربي',
        'date': '١٩٩٥',
        'image': 'assets/ng4.jpg',
        'video': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
        'color': const Color(0xFFE91E63),
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
                'لقاءات نجيب محفوظ',
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
                    'assets/interviews/interviews_bg.jpg',
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
          
          // Grid اللقاءات
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final interview = interviews[index];
                  
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InterviewVideoScreen(
                            title: interview['title'],
                            videoUrl: interview['video'],
                            image: interview['image'],
                            color: interview['color'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: interview['color'].withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            // صورة اللقاء
                            Image.asset(
                              interview['image'],
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
                                    // نوع اللقاء
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: interview['color'].withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.play_circle_outline,
                                            size: 14,
                                            color: AppColors.softGold,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'فيديو',
                                            style: GoogleFonts.tajawal(
                                              fontSize: 12,
                                              color: AppColors.softGold,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    
                                    const SizedBox(height: 8),
                                    
                                    // اسم اللقاء
                                    Text(
                                      interview['title'],
                                      maxLines: 2,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.warmWhite,
                                      ),
                                    ),
                                    
                                    const SizedBox(height: 4),
                                    
                                    // التاريخ
                                    Text(
                                      interview['date'],
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
                childCount: interviews.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
