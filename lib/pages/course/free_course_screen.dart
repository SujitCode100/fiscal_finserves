import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joyn/components/app_asset.dart';
import 'package:joyn/components/static_decoration.dart';
import 'package:joyn/pages/course/free_course_video_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';
import '../../controller/course_controller.dart';
import '../../main.dart';
import '../../model/UserCourseModel.dart';
import '../../utils/DataBase.dart';
import 'course_pdf.dart';
import 'free_courses_quiz_screen.dart';

class FreeCourseScreen extends StatefulWidget {
  final String? courseName;

  const FreeCourseScreen({Key? key, this.courseName}) : super(key: key);

  @override
  State<FreeCourseScreen> createState() => _FreeCourseScreenState();
}

class _FreeCourseScreenState extends State<FreeCourseScreen> {
  final courseController = Get.put(CourseController());

  DataBase handler = new DataBase();

  List<UserCourseModel> _courses = [];



  List videolist = [
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/01+BASIC+DEFIMATIOM.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/02+IN+DETAILS+OF+STOCK+MARKET.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/03+DERIVATIVE+MARKET.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/04+OPTION+TRADING.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/05+OPTION+VALUATION.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/06+OPNE+INTREST+%26+OPTION+CHAIN.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/07+FUNDAMENTALS+%26+TECNICAL.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/08+DEFINATION+OF+DMATE+LIVE.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/09+FUNDAMENTALS+%26+TECNICALS+LIVE.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/10+DISCIPLINE.mp4'
  ];

  List videolistAdvanceCourse = [
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/ARBITRAGE+GOLD+SILVER.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/ARBITRAGE+MINRAL+TRADING.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/BANKNIFTY+BULISH+BARISH+FLAINGJET.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/BANKNIFTY+BULISH+BEARISH+CAPTAIN.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/BANKNIFTY+BULISH+BERISH+IRONFLY.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/BANKNIFTY+NUTRUL+EXPIRE+IRONFLY.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/BANKNIFTY+WEEKLY+IRONFLY.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/BEAR+BULL+SPRED.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/cloud+trading1.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/DEFINATION++OF+HEDGING+PART+01.mp4 '
        'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/DESIPLAN.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/HADGING+FREE+HIT.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/nifty+4th+empayar.mp4'
        'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/NIFTY+BULISH+BARISH+CONDOR.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/NIFTY+BULISH+BEARISH+IRONFLY.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/NIFTY+BUTTERFLY.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/NIFTY+CALANDER.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/NIFTY+NUTRUL+IRONFLY+EXPIRY.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/NIFTY+THETA+HUNTER.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/NIFTY+WEEKLY+IRONFLY.mp4',
    'https://fiscalfinserv.s3.ap-south-1.amazonaws.com/656047711bbee7ad03c08320/lectureVideo/temp_BANKNIFTY+BARISH+BULISH+CONDER.mp4'
  ];

  List advanceTitle = [
    'ARBITRAGE GOLD SILVER',
    'ARBITRAGE MINRAL TRADING',
    'BANKNIFTY BULISH BARISH FLAINGJET',
    'BANKNIFTY BULISH BEARISH CAPTAIN',
    'BANKNIFTY BULISH BERISH IRONFLY',
    'BANKNIFTY NUTRUL EXPIRE IRONFLY',
    'BANKNIFTY WEEKLY IRONFLY',
    'BEAR BULL SPRED',
    'Cloud Trading1',
    'DEFINATION  OF HEDGING PART 01',
    'DESIPLAN',
    'HADGING FREE HIT',
    'nifty 4th empayar',
    'NIFTY BULISH BARISH CONDOR',
    'NIFTY BULISH BEARISH IRONFLY',
    'NIFTY BUTTERFLY',
    'NIFTY CALANDER',
    'NIFTY NUTRUL IRONFLY EXPIRY',
    'NIFTY THETA HUNTER',
    'NIFTY WEEKLY IRONFLY',
    'temp_BANKNIFTY BARISH BULISH CONDER'
  ];

  List freeTitle = [
    'Lecture 1',
    'Lecture 2',
    'Lecture 3',
  ];

  List basicTitle = [
    'BASIC DEFIMATIOM',
    'IN DETAILS OF STOCK MARKET',
    'DERIVATIVE MARKET',
    'OPTION TRADING',
    'OPTION VALUATION',
    'OPNE INTREST OPTION CHAIN',
    'FUNDAMENTALS TECNICAL',
    'DEFINATION OF DMATE LIVE',
    'FUNDAMENTALS TECNICALS LIVE',
    'DISCIPLINE'
  ];

  List basicDescription = [
    'In this course, you will be able to read \nthis course, you will be able to read...',
    'The stock market, also known as the equity market, is a centralized platform where buyers and sellers trade ownership shares in public companies. ',
    'The derivative market is a financial market where financial instruments known as derivatives are traded.',
    'Option trading is a financial derivative strategy that involves buying and selling options contracts.',
    'Option valuation is the process of determining the fair market value of options, which are financial derivatives that give the holder the right, but not the obligation, to buy or sell an underlying asset at a specified price (strike price) within a specified period (expiration date). ',
    'Open interest refers to the total number of outstanding or open options contracts for a particular security',
    'In this course, you will be able to read \nthis course, you will be able to read...',
    'Demat, short for dematerialization, is a process where physical certificates of an investor\'s securities such as stocks and bonds are converted into electronic form. ',
    'Fundamental analysis involves evaluating a security\'s intrinsic value by examining related economic, financial, and other qualitative and quantitative factors.',
    ' Discipline is a crucial aspect in the world of finance, especially when it comes to trading and investment.'
  ];

  List advanceDecripotion = [
    'Arbitrage refers to the practice of exploiting price differences of the same asset in different markets.',
    'Arbitrage in mineral trading involves taking advantage of price differences for the same minerals in different markets or regions. ',
    'The Bank Nifty is a stock index that represents the performance of the banking sector in the National Stock Exchange of India (NSE). It consists of the most liquid and large capitalized banking stocks.',
    'Bank Nifty is an index on the National Stock Exchange of India (NSE) that represents the performance of the banking sector.',
    'A Bank Nifty Iron Fly is an options trading strategy that involves selling an at-the-money (ATM) call and put option while also buying a further out-of-the-money (OTM) call and put option.',
    'A neutral Iron Fly is an options strategy that profits from low volatility and a minimal price movement in the underlying asset',
    'Constructing a weekly Iron Fly on Bank Nifty involves setting up a combination of short and long call and put options with the aim of benefiting from low volatility and the underlying index staying close to a specific strike price.',
    'Buy a call option with a lower strike price (in-the-money or at-the-money).',
    'Cloud trading can refer to the use of cloud computing technology in trading platforms',
    'Hedging is a financial strategy aimed at minimizing or neutralizing the impact of potential risks on the value of assets, investments, or liabilities.',
    'In this course, you will be able to read \nthis course, you will be able to read...',
    'Hedging is a financial strategy used to minimize or offset the risk of adverse price movements in assets.',
    'In this course, you will be able to read \nthis course, you will be able to read...',
    'Nifty typically refers to the Nifty 50, which is the National Stock Exchange of India\'s benchmark stock market index.',
    'An iron fly is an options trading strategy that involves selling an at-the-money (ATM) straddle and buying an out-of-the-money (OTM) strangle. ',
    'In this course, you will be able to read \nthis course, you will be able to read...',
    ' A calendar spread, also known as a time spread, is an options trading strategy that involves buying and selling options of the same type (either calls or puts) with the same strike price but different expiration dates.',
    'In this course, you will be able to read \nthis course, you will be able to read...',
    'A Theta Hunter strategy typically involves taking advantage of this time decay by selling options and collecting premium.',
    'The Ironfly is an advanced options strategy that combines elements of a straddle and a strangle.',
    ' The Bullish Condor is an options strategy designed to profit from a moderately bullish outlook on the underlying asset'
  ];

  List freeVideo = [
    'https://youtu.be/HljVALQxt3I?si=l0L3QMuKLHx4EUlH',
    'https://youtu.be/ZuSinwQjf64?si=lxCxG4Vxt7Fe62RP',
    'https://youtu.be/OJWj4b5U4mk?si=kCMtR2CmUk5aTzSf',
  ];

  List basicThumbanil = [
    'assets/images/png/basic_thumbanil_1.jpg',
    'assets/images/png/basic_thumbanil_2.jpg',
    'assets/images/png/basic_thumbanil_3.jpg',
    'assets/images/png/basic_thumbanil_4.jpg',
    'assets/images/png/basic_thumbanil_5.jpg',
    'assets/images/png/basic_thumbanil_6.jpg',
    'assets/images/png/basic_thumbanil_7.jpg',
    'assets/images/png/basic_thumbanil_8.jpg',
    'assets/images/png/basic_thumbanil_9.jpg',
    'assets/images/png/basic_thumbanil_10.jpg'
  ];

  int advancelength = 19;

  int freelength = 3;

  List<dynamic> quizcourseno =[];

  Future<void> launchYoutubeUrl(String videoUrl) async {
    var url = videoUrl;
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshcourses();
    courseController.getLectureByCourseIdData(context);
  }

  void _refreshcourses() async {
    final data = await handler.retrieveUserCourseModel();
    setState(() {
      _courses = data;
      print("videosno "+ _courses.length.toString());
      for (int i = 0; i < _courses.length; i++) {

        if (_courses[i].userId == dataStorage?.read("_id").toString()) {
          if(_courses[i].name == widget.courseName)
            {
              quizcourseno.add(_courses[i].videono);
            }
        }
      }
      print("quiz"+quizcourseno.toString());

    });
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed){
      print("hello");
      _refreshcourses();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(
            titleShow: true, title: "${widget.courseName} Courses"),
        body: ListView(
          padding: const EdgeInsets.only(top: 16).r,
          children: [
            // Container(
            //   margin: EdgeInsets.only(left: 24, right: 24, bottom: 16).r,
            //   height: 230.h,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //       color: bordersColor,
            //       borderRadius: BorderRadius.circular(24).r,
            //       image: DecorationImage(
            //           image: AssetImage(AppAsset.freeCourseBanner),
            //           fit: BoxFit.cover)),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: 24, right: 24, bottom: 24).r,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Stock Market Training Program',
            //         style: TextStyle(
            //             fontSize: 18.sp,
            //             color: textBoldColor,
            //             fontFamily: "Montserrat-Bold"),
            //       ),
            //       customHeight(7.h),
            //       Text(
            //         'In this course, you will be able to read ch...',
            //         style: TextStyle(
            //             fontFamily: "Montserrat-Regular",
            //             fontSize: 10.sp,
            //             color: courseTextColor),
            //       ),
            //       customHeight(8.h),
            //       Text(
            //         'Lesson 16   |  1h 35 min',
            //         style: TextStyle(
            //             fontFamily: "Montserrat-Medium",
            //             fontSize: 12.sp,
            //             color: textBoldColor),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 20).r,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ).r,
                  color: cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lesson',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: textBoldColor,
                        fontFamily: "Montserrat-Bold"),
                  ),
                  customHeight(15.h),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.courseName == "Advance"
                        ? advancelength
                        : widget.courseName == "Free"
                            ? freelength
                            : courseController.getLectureData.length,
                    itemBuilder: (c, i) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15).r,
                        child: GestureDetector(
                          onTap: () {
                            widget.courseName == "Free"
                                ? launchYoutubeUrl(freeVideo[i])
                                : Get.to(
                                    () => FreeVideoScreen(
                                      videoLink: widget.courseName == "Advance"
                                          ? videolistAdvanceCourse[i]
                                          : videolist[i],
                                      courseName: widget.courseName,
                                      videono : i,
                                    ),
                                  );
                          },
                          child: Container(
                            padding: EdgeInsets.all(5).w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20).r,
                                color: primaryWhite),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 78.h,
                                      width: 110.w,
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15).r,
                                            child: Image.asset(
                                              widget.courseName=="Basic"?basicThumbanil[i]:AppAsset.banner1,
                                              height: 78.h,
                                              width: 110.w,
                                            ),
                                          ),
                                          Center(
                                            child: Image.asset(
                                              AppAsset.playButton,
                                              height: 15.h,
                                              width: 15.w,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    customWidth(7.w),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width -
                                              200,
                                          child: Text(
                                            widget.courseName == "Advance"
                                                ? advanceTitle[i]
                                                : widget.courseName == "Free"
                                                    ? freeTitle[i]
                                                    : basicTitle[i],
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: textBoldColor,
                                                fontFamily: "Montserrat-Bold"),
                                          ),
                                        ),
                                        customHeight(8.h),
                                        Container(
                                          width: MediaQuery.of(context).size.width -
                                              200,
                                          child: Text(
                                            widget.courseName == "Basic"?basicDescription[i]:
                                            widget.courseName == "Advance"?advanceDecripotion[i]:
                                            'In this course, you will be able to read \nthis course, you will be able to read...',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: "Montserrat-Regular",
                                                fontSize: 10.sp,
                                                color: courseTextColor),
                                          ),
                                        ),
                                        customHeight(2.h),

                                      ],
                                    ),
                                  ],
                                ),
                                if(quizcourseno.contains(i))
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => FreeCourseQuizScreen(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding:
                                          EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12)
                                              .r
                                              .r,
                                          decoration: BoxDecoration(
                                            color: primaryWhite,
                                            borderRadius: BorderRadius.circular(15).r,
                                          ),
                                          child: Text(
                                            'Quiz',
                                            style: TextStyle(
                                                fontFamily: "Montserrat-Bold",
                                                fontSize: 20.sp,
                                                color: courseButtonColor),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => CoursePDF(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          padding:
                                          EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12)
                                              .r
                                              .r,
                                          decoration: BoxDecoration(
                                            color: primaryWhite,
                                            borderRadius: BorderRadius.circular(15).r,
                                          ),
                                          child: Text(
                                            'PDF',
                                            style: TextStyle(
                                                fontFamily: "Montserrat-Bold",
                                                fontSize: 20.sp,
                                                color: courseButtonColor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
