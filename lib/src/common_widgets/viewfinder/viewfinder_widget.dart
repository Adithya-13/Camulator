import 'dart:developer';

import 'package:camulator/src/features/presentation.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const ballDiameter = 30.0;

class ViewFinderWidget extends ConsumerWidget {
  const ViewFinderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanControllerProvider);
    final controller = ref.read(scanControllerProvider.notifier);

    return Stack(
      children: <Widget>[
        Positioned(
          top: state.top,
          left: state.left,
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(20),
            dashPattern: const [8, 8],
            color: Colors.white,
            strokeWidth: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              height: state.height,
              width: state.width,
            ),
          ),
        ),
        // top left
        Positioned(
          top: state.top - ballDiameter / 2,
          left: state.left - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var newHeight = state.height - dy * 2;
              var newWidth = state.width - dx * 2;

              controller.updateViewFinder(
                height: newHeight >= 72 ? newHeight : null,
                width: newWidth >= 72 ? newWidth : null,
                top: newHeight >= 72 ? newHeight >= 72 ? state.top + dy : null : null,
                left: newWidth >= 72 ? newWidth >= 72 ? state.left + dx : null : null,
              );
            },
          ),
        ),
        // top middle
        Positioned(
          top: state.top - ballDiameter / 2,
          left: state.left + state.width / 2 - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var newHeight = state.height - (dy * 2);
              log(dy.toString());

              controller.updateViewFinder(
                height: newHeight >= 72 ? newHeight : null,
                top: newHeight >= 72 ? newHeight >= 72 ? state.top + dy : null : null,
              );
            },
          ),
        ),
        // top right
        Positioned(
          top: state.top - ballDiameter / 2,
          left: state.left + state.width - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var newHeight = state.height - dy * 2;
              var newWidth = state.width + dx * 2;

              controller.updateViewFinder(
                height: newHeight >= 72 ? newHeight : null,
                width: newWidth >= 72 ? newWidth : null,
                top: newHeight >= 72 ? state.top + dy : null,
                left: newWidth >= 72 ? state.left - dx : null,
              );
            },
          ),
        ),
        // center right
        Positioned(
          top: state.top + state.height / 2 - ballDiameter / 2,
          left: state.left + state.width - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var newWidth = state.width + (dx * 2);

              controller.updateViewFinder(
                left: newWidth >= 72 ? state.left - dx : null,
                width: newWidth >= 72 ? newWidth : null,
              );
            },
          ),
        ),
        // bottom right
        Positioned(
          top: state.top + state.height - ballDiameter / 2,
          left: state.left + state.width - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var newHeight = state.height + dy * 2;
              var newWidth = state.width + dx * 2;

              controller.updateViewFinder(
                height: newHeight >= 72 ? newHeight : null,
                width: newWidth >= 72 ? newWidth : null,
                top: newHeight >= 72 ? state.top - dy : null,
                left: newWidth >= 72 ? state.left - dx : null,
              );
            },
          ),
        ),
        // bottom center
        Positioned(
          top: state.top + state.height - ballDiameter / 2,
          left: state.left + state.width / 2 - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var newHeight = state.height + (dy * 2);

              controller.updateViewFinder(
                top: newHeight >= 72 ? state.top - dy : null,
                height: newHeight >= 72 ? newHeight : null,
              );
            },
          ),
        ),
        // bottom left
        Positioned(
          top: state.top + state.height - ballDiameter / 2,
          left: state.left - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var newHeight = state.height + dy * 2;
              var newWidth = state.width - dx * 2;

              controller.updateViewFinder(
                height: newHeight >= 72 ? newHeight : null,
                width: newWidth >= 72 ? newWidth : null,
                top: newHeight >= 72 ? state.top - dy : null,
                left: newWidth >= 72 ? state.left + dx : null,
              );
            },
          ),
        ),
        //left center
        Positioned(
          top: state.top + state.height / 2 - ballDiameter / 2,
          left: state.left - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              var newWidth = state.width - (dx * 2);

              controller.updateViewFinder(
                left: newWidth >= 72 ? state.left + dx : null,
                width: newWidth >= 72 ? newWidth : null,
              );
            },
          ),
        ),
        // center center
        Positioned(
          top: state.top + state.height / 2 - ballDiameter / 2,
          left: state.left + state.width / 2 - ballDiameter / 2,
          child: ManipulatingBall(
            onDrag: (dx, dy) {
              controller.updateViewFinder(
                top: state.top + dy,
                left: state.left + dx,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ManipulatingBall extends StatefulWidget {
  const ManipulatingBall({Key? key, required this.onDrag}) : super(key: key);

  final Function onDrag;

  @override
  State<ManipulatingBall> createState() => _ManipulatingBallState();
}

class _ManipulatingBallState extends State<ManipulatingBall> {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        width: ballDiameter,
        height: ballDiameter,
        decoration: BoxDecoration(
          color: Colors.pink.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.pink),
    );
  }
}