import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'score_card1_widget.dart' show ScoreCard1Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScoreCard1Model extends FlutterFlowModel<ScoreCard1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for parTextField widget.
  FocusNode? parTextFieldFocusNode;
  TextEditingController? parTextFieldController;
  String? Function(BuildContext, String?)? parTextFieldControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Score1 widget.
  FocusNode? score1FocusNode;
  TextEditingController? score1Controller;
  String? Function(BuildContext, String?)? score1ControllerValidator;
  // State field(s) for Score2 widget.
  FocusNode? score2FocusNode;
  TextEditingController? score2Controller;
  String? Function(BuildContext, String?)? score2ControllerValidator;
  // State field(s) for Score3 widget.
  FocusNode? score3FocusNode;
  TextEditingController? score3Controller;
  String? Function(BuildContext, String?)? score3ControllerValidator;
  // State field(s) for Score4 widget.
  FocusNode? score4FocusNode;
  TextEditingController? score4Controller;
  String? Function(BuildContext, String?)? score4ControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  HolesRecord? holeRec;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    parTextFieldFocusNode?.dispose();
    parTextFieldController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    score1FocusNode?.dispose();
    score1Controller?.dispose();

    score2FocusNode?.dispose();
    score2Controller?.dispose();

    score3FocusNode?.dispose();
    score3Controller?.dispose();

    score4FocusNode?.dispose();
    score4Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
