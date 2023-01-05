import 'package:camera/camera.dart';
import 'package:camulator/gen/assets.gen.dart';
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
  Widget build(BuildContext context) {
    final state = ref.watch(scanControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Builder(
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
                  child: Padding(
                    padding: EdgeInsets.all(SizeApp.h8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: CameraPreview(
                              controller.cameraController!,
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTapDown: (details) => controller
                                        .onViewFinderTap(details, constraints),
                                  );
                                },
                              ),
                            ),
                          ),
                          const ViewFinderWidget(),
                          if (state.selectedImage != null)
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () {
                                  controller.setSelectedImage(null);
                                },
                                child: Image.file(
                                  state.selectedImage!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                        ],
                      ),
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
      ),
    );
  }
}
