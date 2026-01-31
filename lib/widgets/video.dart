import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;
  final String chapterTitle;

  const VideoPlayerScreen({
    Key? key,
    required this.videoPath,
    required this.chapterTitle,
  }) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isInitialized = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      _videoPlayerController = VideoPlayerController.asset(widget.videoPath);
      await _videoPlayerController!.initialize();
      
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        looping: false,
        showControls: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.primaryGold,
          handleColor: AppColors.softGold,
          backgroundColor: Colors.grey,
          bufferedColor: AppColors.primaryGold.withOpacity(0.3),
        ),
      );
      
      setState(() {
        _isInitialized = true;
        _isLoading = false;
      });
    } catch (e) {
      print('خطأ في تحميل الفيديو: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepBlack,
      appBar: AppBar(
        backgroundColor: AppColors.charcoal,
        leading: IconButton(
          icon: Icon(Icons.arrow_forward_rounded, color: AppColors.softGold),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.chapterTitle,
          style: GoogleFonts.tajawal(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.warmWhite,
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: AppColors.primaryGold),
                  const SizedBox(height: 16),
                  Text(
                    'جاري تحميل الفصل...',
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
                      Icon(
                        Icons.error_outline,
                        color: AppColors.primaryGold,
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'فشل في تحميل الفيديو',
                        style: GoogleFonts.tajawal(
                          color: AppColors.softGold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _initializeVideoPlayer,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGold,
                        ),
                        child: Text(
                          'إعادة المحاولة',
                          style: GoogleFonts.tajawal(color: AppColors.deepBlack),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
