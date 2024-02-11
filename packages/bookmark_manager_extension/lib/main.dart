import 'package:bookmark_manager_extension/extension_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.put(AddBookmarkController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF231651),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: Image.asset(
                //     'assets/images/one_save_background_text.png',
                //     width: MediaQuery.of(context).size.width * 0.5,
                //   ),
                // ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.notifications_active_outlined),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                )
              ],
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const SizedBox(height: 20),
                TextField(
                  controller: controller.titleController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.urlController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'URL',
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 18),
                GetBuilder<AddBookmarkController>(
                  builder: (logic) {
                    return CustomButton(
                      buttonState: logic.isLoading ? ButtonState.inProgress : ButtonState.normal,
                      onPressed: () async {
                        final isAdded = await logic.saveBookmark(
                          logic.titleController.text,
                          logic.urlController.text,
                        );
                        if (isAdded) {
                          Get.snackbar('Saved', 'Your bookmark is saved successfully');
                        } else {
                          Get.snackbar('Error', 'Your bookmark can\'t be saved',
                              backgroundColor: Colors.red);
                        }
                      },
                      color: Colors.white,
                      child: const Text('Save'),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    super.key,
    this.buttonState = ButtonState.normal,
    this.progressColor = Colors.white,
    this.borderRadius,
    this.child,
    this.color,
    this.textColor = Colors.white,
    this.elevation,
    this.isDisabled,
  });

  /// Callback when this button is pressed
  final Function? onPressed;

  /// State of the button.
  ///
  /// Defaults to [ButtonState.normal]
  final ButtonState buttonState;

  /// Child of the button to show when the
  /// state is [ButtonState.normal]
  final Widget? child;
  final double? borderRadius;

  /// Color for [CircularProgressIndicator] which will be shown
  /// when state is [ButtonState.inProgress]
  ///
  /// Defaults to [Colors.white]
  final Color progressColor;

  /// Color of the button
  final Color? color;

  /// Text color
  final Color? textColor;

  /// Elevation
  final double? elevation;

  // enable - disable
  final bool? isDisabled;

  @override
  Widget build(BuildContext context) {
    // Get the default radius if it's not done yet
    var defaultRadius = borderRadius ?? 4;

    return LayoutBuilder(
      builder: (context, constraints) {
        final height = Theme.of(context).buttonTheme.height;
        final padding = Theme.of(context).buttonTheme.padding;
        final width = constraints.maxWidth;

        // When in progress mode, we want to convert the button
        // to circle so the height and width should be same
        final widthToSet = buttonState == ButtonState.normal ? width : height;

        // Set the radius to the half of the height in order to
        // convert the button to circle when in progress mode
        final radiusToSet = buttonState == ButtonState.normal ? defaultRadius : height / 2;

        // Remove the padding when in the progress mode
        final paddingToSet = buttonState == ButtonState.normal ? padding : EdgeInsets.zero;

        // Show progress bar when in the progress mode instead
        // of actual child of this button
        final childToSet = buttonState == ButtonState.normal
            ? child
            : CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(progressColor),
              );

        return AnimatedContainer(
          width: widthToSet,
          height: height,
          duration: const Duration(
            milliseconds: 300,
          ),
          curve: Curves.linearToEaseOut,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor:
                  !(isDisabled ?? false) ? color ?? const Color(0xFF231651) : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusToSet),
              ),
              padding: paddingToSet,
              textStyle: TextStyle(color: textColor, fontWeight: FontWeight.w500),
              elevation: elevation ?? 0,
            ),
            onPressed: !(isDisabled ?? false) ? onPressed as void Function()? : null,
            child: childToSet,
          ),
        );
      },
    );
  }
}

enum ButtonState {
  /// Indicates the button is showing in progress
  inProgress,

  /// Indicates the normal state
  normal,
}
