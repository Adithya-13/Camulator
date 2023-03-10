import 'package:camera/camera.dart';
import 'package:camulator/gen/assets.gen.dart';
import 'package:camulator/src/common_widgets/common_widgets.dart';
import 'package:camulator/src/constants/constants.dart';
import 'package:camulator/src/features/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraSection extends ConsumerWidget {
  const CameraSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(scanControllerProvider.notifier);
    final calculationState = ref.watch(calculationControllerProvider);

    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      ColorApp.black.withOpacity(0.3),
                      BlendMode.multiply,
                    ),
                    child: CameraPreview(
                      key: controller.cameraKey,
                      controller.cameraController!,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTapDown: (details) => controller.onViewFinderTap(
                                details, constraints),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const ViewFinderWidget(),
                if (calculationState.result != null)
                  Positioned(
                    left: SizeApp.h12,
                    bottom: SizeApp.h12,
                    child: const RollbackWidget(),
                  ),
              ],
            ),
          ),
        ),
        Gap.h12,
        const ChooseOperationSection(),
        Gap.h24,
        const BottomScanSection(),
        Gap.h16,
      ],
    );
  }
}

class RollbackWidget extends ConsumerWidget {
  const RollbackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(calculationControllerProvider.notifier);
    return GestureDetector(
      onTap: controller.rollback,
      child: Container(
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: ColorApp.black,
        ),
        padding: EdgeInsets.all(SizeApp.h16),
        child: Assets.svgs.rollbackIcon.svg(
          fit: BoxFit.fitWidth,
          width: SizeApp.w20,
        ),
      ),
    );
  }
}
