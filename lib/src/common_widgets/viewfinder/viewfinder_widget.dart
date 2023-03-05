// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:camulator/gen/assets.gen.dart';
import 'package:camulator/src/constants/constants.dart';
import 'package:camulator/src/features/domain.dart';
import 'package:camulator/src/features/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const ballDiameter = 48.0;

class ViewFinderWidget extends ConsumerWidget {
  const ViewFinderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanControllerProvider);
    final controller = ref.read(scanControllerProvider.notifier);

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          top: state.top,
          left: state.left,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                ColorApp.white.withOpacity(0.1),
                BlendMode.overlay,
              ),
              child: Container(
                color: Colors.transparent,
                height: state.height,
                width: state.width,
              ),
            ),
          ),
        ),
        // top left
        Positioned(
          top: state.top,
          left: state.left,
          child: CornerViewFinder(
            cornerType: CornerType.leftTop,
            onDrag: (dx, dy) {
              var newHeight = state.height - dy * 2;
              var newWidth = state.width - dx * 2;

              controller.updateViewFinder(
                height:
                    newHeight >= 72 && state.top + dy >= 16 ? newHeight : null,
                width:
                    newWidth >= 72 && state.left + dx >= 16 ? newWidth : null,
                top: newHeight >= 72 && state.top + dy >= 16
                    ? state.top + dy
                    : null,
                left: newWidth >= 72 && state.left + dx >= 16
                    ? state.left + dx
                    : null,
              );
            },
          ),
        ),
        // // top middle
        // Positioned(
        //   top: state.top - ballDiameter / 2,
        //   left: state.left + state.width / 2 - ballDiameter / 2,
        //   child: CornerViewFinder(
        //     onDrag: (dx, dy) {
        //       var newHeight = state.height - (dy * 2);
        //       log(dy.toString());

        //       controller.updateViewFinder(
        //         height: newHeight >= 72 ? newHeight : null,
        //         top: newHeight >= 72
        //             ? newHeight >= 72
        //                 ? state.top + dy
        //                 : null
        //             : null,
        //       );
        //     },
        //   ),
        // ),
        // top right
        Positioned(
          top: state.top,
          left: state.left + state.width - ballDiameter / 2,
          child: CornerViewFinder(
            cornerType: CornerType.rightTop,
            onDrag: (dx, dy) {
              var newHeight = state.height - dy * 2;
              var newWidth = state.width + dx * 2;

              controller.updateViewFinder(
                height:
                    newHeight >= 72 && state.top + dy >= 16 ? newHeight : null,
                width:
                    newWidth >= 72 && state.left - dx >= 16 ? newWidth : null,
                top: newHeight >= 72 && state.top + dy >= 16
                    ? state.top + dy
                    : null,
                left: newWidth >= 72 && state.left - dx >= 16
                    ? state.left - dx
                    : null,
              );
            },
          ),
        ),
        // // center right
        // Positioned(
        //   top: state.top + state.height / 2 - ballDiameter / 2,
        //   left: state.left + state.width - ballDiameter / 2,
        //   child: CornerViewFinder(
        //     onDrag: (dx, dy) {
        //       var newWidth = state.width + (dx * 2);

        //       controller.updateViewFinder(
        //         left: newWidth >= 72 ? state.left - dx : null,
        //         width: newWidth >= 72 ? newWidth : null,
        //       );
        //     },
        //   ),
        // ),
        // bottom right
        Positioned(
          top: state.top + state.height - ballDiameter / 2,
          left: state.left + state.width - ballDiameter / 2,
          child: CornerViewFinder(
            cornerType: CornerType.rightBottom,
            onDrag: (dx, dy) {
              var newHeight = state.height + dy * 2;
              var newWidth = state.width + dx * 2;

              controller.updateViewFinder(
                height:
                    newHeight >= 72 && state.top - dy >= 16 ? newHeight : null,
                width:
                    newWidth >= 72 && state.left - dx >= 16 ? newWidth : null,
                top: newHeight >= 72 && state.top - dy >= 16
                    ? state.top - dy
                    : null,
                left: newWidth >= 72 && state.left - dx >= 16
                    ? state.left - dx
                    : null,
              );
            },
          ),
        ),
        // // bottom center
        // Positioned(
        //   top: state.top + state.height - ballDiameter / 2,
        //   left: state.left + state.width / 2 - ballDiameter / 2,
        //   child: CornerViewFinder(
        //     onDrag: (dx, dy) {
        //       var newHeight = state.height + (dy * 2);

        //       controller.updateViewFinder(
        //         top: newHeight >= 72 ? state.top - dy : null,
        //         height: newHeight >= 72 ? newHeight : null,
        //       );
        //     },
        //   ),
        // ),
        // bottom left
        Positioned(
          top: state.top + state.height - ballDiameter / 2,
          left: state.left,
          child: CornerViewFinder(
            cornerType: CornerType.leftBottom,
            onDrag: (dx, dy) {
              var newHeight = state.height + dy * 2;
              var newWidth = state.width - dx * 2;

              controller.updateViewFinder(
                height:
                    newHeight >= 72 && state.top - dy >= 16 ? newHeight : null,
                width:
                    newWidth >= 72 && state.left + dx >= 16 ? newWidth : null,
                top: newHeight >= 72 && state.top - dy >= 16
                    ? state.top - dy
                    : null,
                left: newWidth >= 72 && state.left + dx >= 16
                    ? state.left + dx
                    : null,
              );
            },
          ),
        ),
        // //left center
        // Positioned(
        //   top: state.top + state.height / 2 - ballDiameter / 2,
        //   left: state.left - ballDiameter / 2,
        //   child: CornerViewFinder(
        //     onDrag: (dx, dy) {
        //       var newWidth = state.width - (dx * 2);

        //       controller.updateViewFinder(
        //         left: newWidth >= 72 ? state.left + dx : null,
        //         width: newWidth >= 72 ? newWidth : null,
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}

class CornerViewFinder extends StatefulWidget {
  final CornerType cornerType;
  const CornerViewFinder({
    Key? key,
    required this.cornerType,
    required this.onDrag,
  }) : super(key: key);

  final Function onDrag;

  @override
  State<CornerViewFinder> createState() => _CornerViewFinderState();
}

class _CornerViewFinderState extends State<CornerViewFinder> {
  double _initX = 0;
  double _initY = 0;

  _handleDrag(DragStartDetails? details) {
    if (details != null) {
      setState(() {
        _initX = details.globalPosition.dx;
        _initY = details.globalPosition.dy;
      });
    }
  }

  _handleUpdate(DragUpdateDetails details) {
    var dx = details.globalPosition.dx - _initX;
    var dy = details.globalPosition.dy - _initY;
    _initX = details.globalPosition.dx;
    _initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  int get quarterTurn {
    switch (widget.cornerType) {
      case CornerType.leftTop:
        return 3;
      case CornerType.rightTop:
        return 4;
      case CornerType.rightBottom:
        return 1;
      case CornerType.leftBottom:
        return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      behavior: HitTestBehavior.translucent,
      child: RotatedBox(
        quarterTurns: quarterTurn,
        child: Assets.svgs.corner.svg(width: SizeApp.w24, height: SizeApp.w24),
      ),
    );
  }
}
