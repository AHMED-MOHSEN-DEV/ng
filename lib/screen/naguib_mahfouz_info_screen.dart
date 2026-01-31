import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class NaguibMahfouzInfoScreen extends StatelessWidget {
  const NaguibMahfouzInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlack,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.charcoal,
            leading: IconButton(
              icon: Icon(Icons.arrow_forward_rounded, color: AppColors.softGold),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'نجيب محفوظ',
                style: GoogleFonts.tajawal(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.warmWhite,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // صورة افتراضية لو مش موجودة
                 Stack(
  fit: StackFit.expand,
  children: [
    // الصورة
    Image.asset(
      'assets/ng3.jpg',
      fit: BoxFit.cover,
    ),
    // البلور الأسود
    BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.deepBlack.withOpacity(0.4),
              AppColors.deepBlack.withOpacity(0.95),
            ],
          ),
        ),
      ),
    ),
  ],
),

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
                ],
              ),
            ),
          ),

          // نبذة عن الحياة
          SliverToBoxAdapter(
            child: _buildSimpleInfoSection(context, 'نبذة عن الحياة'),
          ),

          // الجوائز
          SliverToBoxAdapter(
            child: _buildSimpleInfoSection(context, 'الجوائز العالمية'),
          ),

          // الحقائق
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
              child: _buildFactsSection(context),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
              child: _buildLegacySection(context),
            ),
          ),
        ],
      ),
    );
  }

  // قسم بسيط بدون صور
  Widget _buildSimpleInfoSection(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.charcoal.withOpacity(0.6),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.primaryGold.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryGold.withOpacity(0.4),
                      AppColors.primaryGold.withOpacity(0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(Icons.info_outline, 
                          color: AppColors.warmWhite, size: 24),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.warmWhite,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildInfoRow('📅 تاريخ الميلاد', '11 ديسمبر 1911'),
          _buildInfoRow('⚰️ تاريخ الوفاة', '30 أغسطس 2006'),
          _buildInfoRow('📍 مكان الميلاد', 'الحسين - القاهرة'),
          _buildInfoRow('💼 المهنة', 'روائي وكاتب وقاضي'),
          if (title == 'الجوائز العالمية') ...[
            const SizedBox(height: 15),
            _buildInfoRow('🏆 جائزة نوبل', '1988 - أول عربي'),
            _buildInfoRow('🥇 جائزة كافاو', '2004 - يونان'),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.tajawal(
              fontSize: 15,
              color: AppColors.primaryGold,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.tajawal(
                fontSize: 16,
                color: AppColors.warmWhite,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFactsSection(BuildContext context) {
    final facts = [
      'كتب أكثر من 500 مقال في الصحف',
      'عمل موظف حكومي لمدة 35 سنة',
      'تعرض لمحاولة اغتيال عام 1994',
      'له تمثال في جامعة كامبريدج',
    ];

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.charcoal.withOpacity(0.6),
            AppColors.deepBlack.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGold.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryGold.withOpacity(0.4),
                      AppColors.primaryGold.withOpacity(0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.lightbulb_outline, 
                              color: Colors.white, size: 24),
              ),
              const SizedBox(width: 16),
              Text(
                'حقائق مثيرة',
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.warmWhite,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...facts.map((fact) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryGold.withOpacity(0.4),
                        AppColors.primaryGold.withOpacity(0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.circle, 
                                color: Colors.white, size: 14),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    fact,
                    style: GoogleFonts.tajawal(
                      fontSize: 15,
                      height: 1.6,
                      color: AppColors.warmWhite,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildLegacySection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.charcoal.withOpacity(0.8),
            AppColors.deepBlack,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.primaryGold.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primaryGold.withOpacity(0.5),
                      AppColors.accentGold.withOpacity(0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.menu_book, 
                              color: Colors.white, size: 28),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الإرث الأدبي',
                      style: GoogleFonts.tajawal(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.warmWhite,
                      ),
                    ),
                    Text(
                      'أعظم روائي عربي في القرن العشرين',
                      style: GoogleFonts.tajawal(
                        fontSize: 14,
                        color: AppColors.primaryGold,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            'نجيب محفوظ ظاهرة ثقافية عالمية. ثلاثيته التي تجسد حياة حارة الجمالية هي من أعظم الأعمال الأدبية في التاريخ الحديث. فوزه بجائزة نوبل عام 1988 كان تتويجاً لعمل أدبي استمر لعقود.',
            style: GoogleFonts.tajawal(
              fontSize: 16,
              height: 1.8,
              color: AppColors.warmWhite.withOpacity(0.9),
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
