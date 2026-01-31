import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';

class BioScreen extends StatelessWidget {
  const BioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlack,
      body: Stack(
        children: [
          // صورة الخلفية مع blur
          Positioned.fill(
            child: Stack(
              children: [
                Image.asset(
                  'assets/ng2.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.deepBlack.withOpacity(0.25),
                          AppColors.deepBlack.withOpacity(0.72),
                          AppColors.deepBlack.withOpacity(0.95),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // المحتوى
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.charcoal.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.softGold.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: AppColors.softGold,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'نبذة عن الأديب',
                        style: GoogleFonts.tajawal(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.warmWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // المحتوى القابل للتمرير
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        
                        // صورة البروفايل
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(4),
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
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.deepBlack,
                              ),
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage: AssetImage('assets/ng2.jpg'),
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // الاسم
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'نجيب محفوظ',
                                style: GoogleFonts.tajawal(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.warmWhite,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '١٩١١ - ٢٠٠٦',
                                style: GoogleFonts.tajawal(
                                  fontSize: 16,
                                  color: AppColors.softGold.withOpacity(0.8),
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // جائزة نوبل
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primaryGold.withOpacity(0.15),
                                AppColors.accentGold.withOpacity(0.08),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.softGold.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryGold.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.emoji_events_rounded,
                                  color: AppColors.softGold,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'جائزة نوبل في الأدب',
                                      style: GoogleFonts.tajawal(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.warmWhite,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'أول عربي يحصل عليها - ١٩٨٨',
                                      style: GoogleFonts.tajawal(
                                        fontSize: 13,
                                        color: AppColors.softGold.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 28),
                        
                        // نبذة عامة
                        _buildSectionTitle('من هو؟'),
                        const SizedBox(height: 12),
                        _buildParagraph(
                          'أديب وروائي مصري بارز، يُعد رائد الرواية العربية الحديثة. وُلد في القاهرة، وتتميز أعماله بتصوير الحياة الاجتماعية والسياسية المصرية ببراعة، خاصة في حارات القاهرة القديمة.',
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // أشهر الأعمال
                        _buildSectionTitle('أشهر الأعمال'),
                        const SizedBox(height: 12),
                        _buildBookItem('ثلاثية القاهرة', 'بين القصرين، قصر الشوق، السكرية'),
                        _buildBookItem('أولاد حارتنا', 'من أهم أعماله التي أثارت جدلاً واسعاً'),
                        _buildBookItem('زقاق المدق', 'رواية واقعية عن الحياة الشعبية'),
                        
                        const SizedBox(height: 24),
                        
                        // أبرز المحطات
                        _buildSectionTitle('أبرز المحطات'),
                        const SizedBox(height: 12),
                        
                        _buildMilestone(
                          Icons.school_rounded,
                          'النشأة والتعليم',
                          'وُلد في حي الجمالية بالقاهرة عام ١٩١١، وحصل على ليسانس الفلسفة من جامعة القاهرة.',
                        ),
                        
                        _buildMilestone(
                          Icons.edit_rounded,
                          'المسيرة الأدبية',
                          'بدأ الكتابة في ثلاثينيات القرن العشرين، ونشر أكثر من ٥٥ كتاباً بين روايات ومجموعات قصصية ومسرحيات.',
                        ),
                        
                        _buildMilestone(
                          Icons.palette_rounded,
                          'الأسلوب',
                          'تنوعت أعماله بين الواقعية والتاريخية والرمزية، حيث ركزت على تحليل النفس البشرية وتطور المجتمع.',
                        ),
                        
                        _buildMilestone(
                          Icons.favorite_rounded,
                          'الإرث',
                          'توفي في ٣٠ أغسطس ٢٠٠٦ تاركاً إرثاً أدبياً ضخماً تم تحويل الكثير منه إلى أعمال سينمائية وتلفزيونية.',
                        ),
                        
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.tajawal(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryGold,
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.charcoal.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.softGold.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.tajawal(
          fontSize: 15,
          height: 1.8,
          color: AppColors.warmWhite.withOpacity(0.9),
        ),
      ),
    );
  }

  Widget _buildBookItem(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.charcoal.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.softGold.withOpacity(0.15),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryGold.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.menu_book_rounded,
              color: AppColors.softGold,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.tajawal(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.warmWhite,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.tajawal(
                    fontSize: 13,
                    color: AppColors.softGold.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestone(IconData icon, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.charcoal.withOpacity(0.5),
            AppColors.charcoal.withOpacity(0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.softGold.withOpacity(0.15),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryGold.withOpacity(0.2),
                  AppColors.accentGold.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: AppColors.softGold,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.tajawal(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.warmWhite,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: GoogleFonts.tajawal(
                    fontSize: 14,
                    height: 1.6,
                    color: AppColors.warmWhite.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
