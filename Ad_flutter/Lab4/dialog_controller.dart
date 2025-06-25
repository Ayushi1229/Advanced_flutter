import 'package:flutter_lab/Ad_flutter/Lab4/dialog_model.dart';


class DialogController {
  final DialogModel _model = DialogModel();

  void handleDialogBox() => _model.showDialogBox();
  void handleSnackbar() => _model.showSnackbar();
  void handleBottomSheet() => _model.showBottomSheet();
}
