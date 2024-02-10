import 'package:flutter/material.dart';

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
              backgroundColor: !(isDisabled ?? false) ? color ?? const Color(0xFF231651) : Colors.grey,
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
