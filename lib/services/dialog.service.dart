import 'package:flutter/material.dart';
import '../global_widgets/dialogs/filter.dialog.dart';
import '../global_widgets/dialogs/custom_alert.dialog.dart';

enum AlertDialogType { success, error, warning }

class DialogService {
  Future<bool> show({
    @required BuildContext context,
    @required String message,
    @required AlertDialogType type,
  }) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: CustomAlertDialog(
            subtitle: message,
            type: type,
          ),
        );
      },
    );
  }

  Future<bool> showFilter({
    @required BuildContext context,
  }) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: FilterDialog(),
        );
      },
    );
  }
}
