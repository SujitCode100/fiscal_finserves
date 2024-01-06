// import 'package:extended_image/extended_image.dart';
// ignore_for_file: unused_element, deprecated_member_use

import 'dart:developer';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joyn/components/colors.dart';
import 'package:lottie/lottie.dart';

// checkImageLoadState(ExtendedImageState state) {
//   switch (state.extendedImageLoadState) {
//     case LoadState.completed:
//       // print("Image Load completely");
//       return null;
//     case LoadState.loading:
//       // print("Image Still Loading...");
//       return CupertinoActivityIndicator();

//     case LoadState.failed:
//       // print("Image Load Failed");
//       return SvgPicture.asset(
//         AppAsset.logo,
//         fit: BoxFit.cover,
//         color: appColor,
//         alignment: Alignment.center,
//         // height: 50,
//         // width: 50,
//       );
//   }
// }

class NetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  const NetworkImageWidget({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.imageUrl,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  static Map? header;
  @override
  Widget build(BuildContext context) {
    // _cleancach();
    // return Container(
    //   child: FadeInImage.assetNetwork(
    //       // imageCacheWidth: 100,
    //       // imageCacheHeight: 200,
    //       placeholder: AppAsset.staticProfile,
    //       image: imageUrl ?? ""),
    // );
    // return OptimizedCacheImage(
    //   imageUrl: imageUrl.toString(),
    //   maxHeightDiskCache: 500,
    //   memCacheHeight: 200,
    //   memCacheWidth: 200,
    //   filterQuality: FilterQuality.low,
    //   fit: fit ?? BoxFit.cover,
    //   placeholder: (context, url) => Center(
    //     child: Lottie.asset(
    //       'assets/json/loader.json',
    //       height: 100,
    //       width: 100,
    //     ),
    //   ),
    //   errorWidget: (context, url, error) => Icon(Icons.error),
    // );
    return ClipRRect(
      borderRadius: borderRadius!,
      child: new CachedNetworkImage(
          fit: fit ?? BoxFit.cover,
          height: height,
          // httpHeaders: NetworkHttp.getHeaders(),
          // maxHeightDiskCache: 100,
          maxWidthDiskCache: (Get.width * 0.4).toInt(),
          // memCacheHeight: 500,
          memCacheWidth: (Get.width * 0.4).toInt(),
          cacheKey: imageUrl,
          width: width,
          color: color,
          useOldImageOnUrlChange: true,
          imageUrl: imageUrl!,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: Lottie.asset(
                  'assets/json/loader.json',
                  height: 100,
                  width: 100,
                ),
              ),
          errorWidget: (context, url, error) {
            log("image Widget load error $error");
            return const Icon(Icons.error, color: primaryBlack);
          }),
    );
    // return ExtendedImage.network(
    //   imageUrl!,
    //   // width: ScreenUtil.instance.setWidth(400),
    //   // height: ScreenUtil.instance.setWidth(400),
    //   fit: fit ?? BoxFit.cover,
    //   height: height,
    //   width: width,
    //   color: color,
    //   cache: true,
    //   clearMemoryCacheIfFailed: true,
    //   enableMemoryCache: true,
    //   handleLoadingProgress: false,
    //   loadStateChanged: (state) => checkImageLoadState(state),
    //   // loadStateChanged: (ExtendedImageState state) {
    //   //   switch (state.extendedImageLoadState) {
    //   //     case LoadState.loading:
    //   //       return CupertinoActivityIndicator();

    //   //     ///if you don't want override completed widget
    //   //     ///please return null or state.completedWidget
    //   //     // return null;
    //   //     // return state.completedWidget;

    //   //     case LoadState.completed:
    //   //       return null;
    //   //     case LoadState.failed:
    //   //       return Image.asset(
    //   //         "assets/images/pvr_logo.png",
    //   //         fit: BoxFit.fill,
    //   //         height: 50,
    //   //         width: 50,
    //   //       );
    //   //   }
    //   // },
    //   // borderRadius: borderRadius ??
    //   //     BorderRadius.only(
    //   //       topLeft: Radius.circular(8),
    //   //       topRight: Radius.circular(8),
    //   //     ),
    //   borderRadius: circular5BorderRadius,
    // );
  }
}

class FullNetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  const FullNetworkImageWidget({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.imageUrl,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.cover,
      height: height,
      cacheKey: imageUrl,
      width: width,
      color: color,
      imageUrl: imageUrl!,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Lottie.asset(
        'assets/json/loader.json',
        height: 100,
        width: 100,
      ),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error, color: primaryBlack),
    );
    // return ExtendedImage.network(
    //   imageUrl!,
    //   // width: ScreenUtil.instance.setWidth(400),
    //   // height: ScreenUtil.instance.setWidth(400),
    //   fit: fit ?? BoxFit.cover,
    //   height: height,
    //   width: width,
    //   color: color,
    //   cache: true,
    //   clearMemoryCacheIfFailed: true,
    //   enableMemoryCache: true,
    //   handleLoadingProgress: false,
    //   loadStateChanged: (state) => checkImageLoadState(state),
    //   // loadStateChanged: (ExtendedImageState state) {
    //   //   switch (state.extendedImageLoadState) {
    //   //     case LoadState.loading:
    //   //       return CupertinoActivityIndicator();

    //   //     ///if you don't want override completed widget
    //   //     ///please return null or state.completedWidget
    //   //     // return null;
    //   //     // return state.completedWidget;

    //   //     case LoadState.completed:
    //   //       return null;
    //   //     case LoadState.failed:
    //   //       return Image.asset(
    //   //         "assets/images/pvr_logo.png",
    //   //         fit: BoxFit.fill,
    //   //         height: 50,
    //   //         width: 50,
    //   //       );
    //   //   }
    //   // },
    //   // borderRadius: borderRadius ??
    //   //     BorderRadius.only(
    //   //       topLeft: Radius.circular(8),
    //   //       topRight: Radius.circular(8),
    //   //     ),
    //   borderRadius: circular5BorderRadius,
    // );
  }
}

// class CarouselImageWidget extends StatelessWidget {
//   final String imageUrl;
//   final double? height;
//   final double? width;
//   final Color? color;
//   CarouselImageWidget({
//     Key? key,
//     this.height,
//     this.width,
//     this.color,
//     required this.imageUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExtendedImage.network(
//       imageUrl,
//       // width: ScreenUtil.instance.setWidth(400),
//       // height: ScreenUtil.instance.setWidth(400),
//       fit: BoxFit.cover,
//       cache: true,
//       loadStateChanged: (state) => checkImageLoadState(state),
//       clearMemoryCacheIfFailed: true,
//       enableMemoryCache: true,
//       border: Border.all(color: primaryBlack, width: 1.0),
//       shape: BoxShape.circle,
//       handleLoadingProgress: false,
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(21),
//         topRight: Radius.circular(21),
//       ),
//     );
//   }
// }

// class CircleNetworkImageWidget extends StatelessWidget {
//   final String imageUrl;
//   final Border? border;

//   CircleNetworkImageWidget({Key? key, required this.imageUrl, this.border})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExtendedImage.network(
//       imageUrl,
//       fit: BoxFit.cover,
//       cache: true,

//       clearMemoryCacheIfFailed: true,
//       enableMemoryCache: true,
//       border: border, //?? Border.all(color: blackGreyColor, width: 1.0),
//       shape: BoxShape.circle,
//       handleLoadingProgress: false,
//       borderRadius: BorderRadius.all(Radius.circular(30.0)),
//       loadStateChanged: (state) => checkImageLoadState(state),
//     );
//   }
// }

// class SliderImageWidget extends StatelessWidget {
//   final String imageUrl;
//   final double? height;
//   final double? width;
//   SliderImageWidget({
//     Key? key,
//     this.height,
//     this.width,
//     required this.imageUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExtendedImage.network(
//       imageUrl,
//       // width: ScreenUtil.instance.setWidth(400),
//       // height: ScreenUtil.instance.setWidth(400),
//       fit: BoxFit.cover,
//       cache: false,
//       height: height,
//       width: width,

//       loadStateChanged: (state) => checkImageLoadState(state),
//       clearMemoryCacheIfFailed: true,
//       enableMemoryCache: true,
//       border: Border.all(color: primaryBlack, width: 1.0),
//       shape: BoxShape.circle,
//       handleLoadingProgress: false,
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(30),
//         topRight: Radius.circular(30),
//       ),
//     );
//   }
// }

// class SquareNetworkImageWidget extends StatelessWidget {
//   final String imageUrl;
//   final double? height, width;
//   SquareNetworkImageWidget(
//       {Key? key, required this.imageUrl, this.height, this.width})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExtendedImage.network(
//       imageUrl,
//       width: width ?? 80,
//       height: height ?? 100,
//       fit: BoxFit.cover,
//       cache: true,
//       loadStateChanged: (state) => checkImageLoadState(state),
//       clearMemoryCacheIfFailed: true,
//       enableMemoryCache: true,
//       handleLoadingProgress: false,
//       borderRadius: circular5BorderRadius,
//     );
//   }
// }

// class SVGAseetsImageWidget extends StatelessWidget {
//   final double? height;
//   final double? width;
//   final String? imagePath;
//   final Color? imageColor;
//   const SVGAseetsImageWidget({
//     Key? key,
//     required this.imagePath,
//     this.imageColor,
//     this.height,
//     this.width,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SvgPicture.asset(
//         imagePath.toString(),
//         height: height ?? 30,
//         width: width ?? 50,
//         alignment: Alignment.center,
//         allowDrawingOutsideViewBox: true,
//         color: imageColor,
//       ),
//     );
//   }
// }

void _cleancach() {
  ImageCache _imagecach = PaintingBinding.instance.imageCache;
  // print(
  //     "------------------>cachimage cleared--->${((_imagecach.currentSizeBytes / 1024) / 1024) > 80}");
  // print(
  //     "------------------>liveImageCount cleared${_imagecach.liveImageCount}");

  if (_imagecach.liveImageCount > 20) {
    _imagecach.clearLiveImages();
    // _imagecach.clear();
  }
}

class CBouncingScrollPhysics extends ScrollPhysics {
  /// Creates scroll physics that bounce back from the edge.
  const CBouncingScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  CBouncingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CBouncingScrollPhysics(parent: buildParent(ancestor));
  }

  /// The multiple applied to overscroll to make it appear that scrolling past
  /// the edge of the scrollable contents is harder than scrolling the list.
  /// This is done by reducing the ratio of the scroll effect output vs the
  /// scroll gesture input.
  ///
  /// This factor starts at 0.52 and progressively becomes harder to overscroll
  /// as more of the area past the edge is dragged in (represented by an increasing
  /// `overscrollFraction` which starts at 0 when there is no overscroll).
  double frictionFactor(double overscrollFraction) =>
      0.2 * math.pow(1 - overscrollFraction, 2);

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    assert(offset != 0.0);
    assert(position.minScrollExtent <= position.maxScrollExtent);

    if (!position.outOfRange) return offset;

    final double overscrollPastStart =
        math.max(position.minScrollExtent - position.pixels, 0.0);
    final double overscrollPastEnd =
        math.max(position.pixels - position.maxScrollExtent, 0.0);
    final double overscrollPast =
        math.max(overscrollPastStart, overscrollPastEnd);
    final bool easing = (overscrollPastStart > 0.0 && offset < 0.0) ||
        (overscrollPastEnd > 0.0 && offset > 0.0);

    final double friction = easing
        // Apply less resistance when easing the overscroll vs tensioning.
        ? frictionFactor(
            (overscrollPast - offset.abs()) / position.viewportDimension)
        : frictionFactor(overscrollPast / position.viewportDimension);
    final double direction = offset.sign;

    return direction * _applyFriction(overscrollPast, offset.abs(), friction);
  }

  static double _applyFriction(
      double extentOutside, double absDelta, double gamma) {
    assert(absDelta > 0);
    double total = 0.0;
    if (extentOutside > 0) {
      final double deltaToLimit = extentOutside / gamma;
      if (absDelta < deltaToLimit) return absDelta * gamma;
      total += extentOutside;
      absDelta -= deltaToLimit;
    }
    return total + absDelta;
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) => 0.0;

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    final Tolerance tolerance = this.tolerance;
    if (velocity.abs() >= tolerance.velocity || position.outOfRange) {
      return BouncingScrollSimulation(
        spring: spring,
        position: position.pixels,
        velocity: velocity,
        leadingExtent: position.minScrollExtent,
        trailingExtent: position.maxScrollExtent,
        tolerance: tolerance,
      );
    }
    return null;
  }

  // The ballistic simulation here decelerates more slowly than the one for
  // ClampingScrollPhysics so we require a more deliberate input gesture
  // to trigger a fling.
  @override
  double get minFlingVelocity => 2 * 2.0;

  // Methodology:
  // 1- Use https://github.com/flutter/platform_tests/tree/master/scroll_overlay to test with
  //    Flutter and platform scroll views superimposed.
  // 3- If the scrollables stopped overlapping at any moment, adjust the desired
  //    output value of this function at that input speed.
  // 4- Feed new input/output set into a power curve fitter. Change function
  //    and repeat from 2.
  // 5- Repeat from 2 with medium and slow flings.
  /// Momentum build-up function that mimics iOS's scroll speed increase with repeated flings.
  ///
  /// The velocity of the last fling is not an important factor. Existing speed
  /// and (related) time since last fling are factors for the velocity transfer
  /// calculations.
  @override
  double carriedMomentum(double existingVelocity) {
    return existingVelocity.sign *
        math.min(
            0.000516 * math.pow(existingVelocity.abs(), 2).toDouble(), 4000.0);
  }

  // Eyeballed from observation to counter the effect of an unintended scroll
  // from the natural motion of lifting the finger after a scroll.
  @override
  double get dragStartDistanceMotionThreshold => 3.5;
}
