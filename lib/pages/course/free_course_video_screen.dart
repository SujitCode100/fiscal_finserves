import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joyn/pages/settings/my_documents.dart';
import 'package:video_player/video_player.dart';

import '../../components/ui.dart';
import '../../main.dart';
import '../../model/UserCourseModel.dart';
import '../../utils/DataBase.dart';

class FreeVideoScreen extends StatefulWidget {
  final String? videoLink;
  final String? courseName;
  final int? videono;

  const FreeVideoScreen({Key? key, this.videoLink,this.courseName,this.videono}) : super(key: key);

  @override
  State<FreeVideoScreen> createState() => _FreeVideoScreenState();
}

class _FreeVideoScreenState extends State<FreeVideoScreen> {
  late ChewieController _chewieController;
  late VideoPlayerController videoPlayerController;

   DataBase handler = new DataBase();

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.network(widget.videoLink.toString());

    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false, // Set to true if you want the video to loop
      // Other chewie options...
    );


    videoPlayerController.addListener(() {
      if (videoPlayerController.value.position ==
          videoPlayerController.value.duration) {
        // Video has completed
        UserCourseModel videos = UserCourseModel(name: widget.courseName.toString(), userId: dataStorage!.read("_id").toString(), id: 1, videono: widget.videono!.toInt());
        List<UserCourseModel> planets = [videos];
        handler.insertUserCourses(planets);

        setState(() {
          // Get.to(
          //   () => video_option(),
          // );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => my_documents(),
            ),
          );

        });
      }
    });
  }


  @override
  void dispose() {
    videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: UiInterface.CustomAppBar(
              titleShow: true, title: "Videos"),
          body: Padding(
           padding: const EdgeInsets.only(top: 16, bottom: 35).r,
            child: Center(
              child: Chewie(
                controller: _chewieController,
              ),
            ),
          )),
    );
  }
}
