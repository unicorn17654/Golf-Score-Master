import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'playernames_widget.dart' show PlayernamesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayernamesModel extends FlutterFlowModel<PlayernamesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Player1Field widget.
  FocusNode? player1FieldFocusNode;
  TextEditingController? player1FieldController;
  String? Function(BuildContext, String?)? player1FieldControllerValidator;
  // State field(s) for Player2Field widget.
  FocusNode? player2FieldFocusNode;
  TextEditingController? player2FieldController;
  String? Function(BuildContext, String?)? player2FieldControllerValidator;
  // State field(s) for Player3Field widget.
  FocusNode? player3FieldFocusNode;
  TextEditingController? player3FieldController;
  String? Function(BuildContext, String?)? player3FieldControllerValidator;
  // State field(s) for Player4Field widget.
  FocusNode? player4FieldFocusNode;
  TextEditingController? player4FieldController;
  String? Function(BuildContext, String?)? player4FieldControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GamesRecord? gameRec;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    player1FieldFocusNode?.dispose();
    player1FieldController?.dispose();

    player2FieldFocusNode?.dispose();
    player2FieldController?.dispose();

    player3FieldFocusNode?.dispose();
    player3FieldController?.dispose();

    player4FieldFocusNode?.dispose();
    player4FieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
