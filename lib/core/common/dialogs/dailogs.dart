import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class Dialogs {
  const Dialogs._();

  static Widget _adaptiveAction({
    required BuildContext context,
    required VoidCallback onPressed,
    required Widget child,
  }) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }

  static void showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          content: Text(content),
        ),
      );
  }

  static Future<void> showCustomMenu<T>(
    BuildContext context,
    RelativeRect position,
    List<PopupMenuEntry<T>> items,
  ) async {
    await showMenu<T>(
      context: context,
      position: position,
      items: items,
    );
  }

  static Future<bool> showAlertDialog(
    BuildContext context,
    String title,
    String content,
  ) async {
    return await showAdaptiveDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog.adaptive(
                title: Text(title),
                content: Text(content),
                actions: [
                  _adaptiveAction(
                    context: context,
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('Cancel'),
                  ),
                  _adaptiveAction(
                    context: context,
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('Confirm'),
                  ),
                ],
              );
            }) ??
        false;
  }
}
