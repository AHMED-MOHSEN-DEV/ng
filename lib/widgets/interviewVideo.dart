import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class InterviewVideoScreen extends StatefulWidget {
  final String title;
  final String videoUrl;
  final String image;
  final Color color;

  const InterviewVideoScreen({
    Key? key,
    required this.title,
    required this.videoUrl,
    required this.image,
    required this.color,
  }) : super(key: key);

  @override
  State<InterviewVideoScreen> createState() => _InterviewVideoScreenState();
}

class _InterviewVideoScreenState extends State<InterviewVideoScreen> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;
  bool _isLoading = true;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      _controller = VideoPlayerController.network(widget.videoUrl);
      await _controller!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _controller!,
        autoPlay: true,
        looping: false,
        showControls: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: widget.color,
          handleColor: AppColors.softGold,
          backgroundColor: Colors.grey,
          bufferedColor: widget.color.withOpacity(0.3),
        ),
      );

      setState(() {
        _isInitialized = true;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlack,
      body: Column(
        children: [
          // AppBar مخصص
          Container(
            height: 100,
            padding: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.charcoal,
                  AppColors.deepBlack,
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_forward_rounded, 
                              color: AppColors.softGold),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: GoogleFonts.tajawal(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.warmWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          Expanded(
            child: _isLoading
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: widget.color),
                        const SizedBox(height: 16),
                        Text(
                          'جاري تحميل اللقاء...',
                          style: GoogleFonts.tajawal(
                            color: AppColors.softGold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : _isInitialized && _chewieController != null
                    ? Chewie(controller: _chewieController!)
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.videocam_off, 
                                color: widget.color, size: 64),
                            const SizedBox(height: 16),
                            Text(
                              'فشل في تحميل اللقاء',
                              style: GoogleFonts.tajawal(
                                color: AppColors.softGold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: _initializePlayer,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: widget.color,
                              ),
                              child: Text(
                                'إعادة المحاولة',
                                style: GoogleFonts.tajawal(
                                  color: AppColors.deepBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
