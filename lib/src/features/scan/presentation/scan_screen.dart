import 'package:camera/camera.dart';
import 'package:camulator/src/common_widgets/common_widgets.dart';
import 'package:camulator/src/constants/constants.dart';
import 'package:camulator/src/features/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanScreen extends ConsumerStatefulWidget {
  const ScanScreen({super.key});

  @override
  ConsumerState<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen>
    with WidgetsBindingObserver {
  ScanController get controller => ref.read(scanControllerProvider.notifier);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller.cameraController;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      controller.onNewCameraSelected(cameraController.description);
    }
  }

  @override
  void initState() {
    //TODO: still technical debt, to set initial left and top offset
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 200)).then(
        (value) => controller.setLeftAndTop(context),
      );
      controller.setLeftAndTop(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(scanControllerProvider);
    final calculationState = ref.watch(calculationControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Builder(
              builder: (context) {
                if (!state.isCameraPermissionGranted) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Permission denied',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: controller.getPermissionStatus,
                        child: const Text('Give permission'),
                      ),
                    ],
                  );
                }
                if (!state.isCameraInitialized) return Container();

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
                                    builder: (BuildContext context,
                                        BoxConstraints constraints) {
                                      return GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTapDown: (details) =>
                                            controller.onViewFinderTap(
                                                details, constraints),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const ViewFinderWidget(),
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
              },
            ),
            if (calculationState.result != null)
              const Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: ResultWidget(),
              ),
          ],
        ),
      ),
    );
  }
}
