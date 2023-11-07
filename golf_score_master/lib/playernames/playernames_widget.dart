import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'playernames_model.dart';
export 'playernames_model.dart';

class PlayernamesWidget extends StatefulWidget {
  const PlayernamesWidget({
    Key? key,
    int? playerNum,
    int? holeCount,
  })  : this.playerNum = playerNum ?? 1,
        this.holeCount = holeCount ?? 9,
        super(key: key);

  final int playerNum;
  final int holeCount;

  @override
  _PlayernamesWidgetState createState() => _PlayernamesWidgetState();
}

class _PlayernamesWidgetState extends State<PlayernamesWidget> {
  late PlayernamesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayernamesModel());

    _model.player1FieldController ??= TextEditingController();
    _model.player1FieldFocusNode ??= FocusNode();

    _model.player2FieldController ??= TextEditingController();
    _model.player2FieldFocusNode ??= FocusNode();

    _model.player3FieldController ??= TextEditingController();
    _model.player3FieldFocusNode ??= FocusNode();

    _model.player4FieldController ??= TextEditingController();
    _model.player4FieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).warning,
          automaticallyImplyLeading: false,
          title: Text(
            'Enter Players\' Names',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).warning,
                  Color(0xFF39A1EF)
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: TextFormField(
                      controller: _model.player1FieldController,
                      focusNode: _model.player1FieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Player 1',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 50.0,
                                ),
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            fontSize: 30.0,
                          ),
                      validator: _model.player1FieldControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
                if (widget.playerNum >= 2)
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.player2FieldController,
                        focusNode: _model.player2FieldFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Player 2',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 50.0,
                                  ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 30.0,
                            ),
                        validator: _model.player2FieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                if (widget.playerNum >= 3)
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.player3FieldController,
                        focusNode: _model.player3FieldFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Player 3',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 50.0,
                                  ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 30.0,
                            ),
                        validator: _model.player3FieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                if (widget.playerNum == 4)
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.player4FieldController,
                        focusNode: _model.player4FieldFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Player 4',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 50.0,
                                  ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 30.0,
                            ),
                        validator: _model.player4FieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var gamesRecordReference = GamesRecord.collection.doc();
                        await gamesRecordReference.set(createGamesRecordData(
                          time: getCurrentTimestamp,
                          location: '',
                          holes: widget.holeCount,
                          player1: _model.player1FieldController.text,
                          player2: _model.player2FieldController.text,
                          player3: _model.player3FieldController.text,
                          player4: _model.player4FieldController.text,
                          player1Score: 0,
                          player2Score: 0,
                          player3Score: 0,
                          player4Score: 0,
                          totalPar: 0,
                        ));
                        _model.gameRec = GamesRecord.getDocumentFromData(
                            createGamesRecordData(
                              time: getCurrentTimestamp,
                              location: '',
                              holes: widget.holeCount,
                              player1: _model.player1FieldController.text,
                              player2: _model.player2FieldController.text,
                              player3: _model.player3FieldController.text,
                              player4: _model.player4FieldController.text,
                              player1Score: 0,
                              player2Score: 0,
                              player3Score: 0,
                              player4Score: 0,
                              totalPar: 0,
                            ),
                            gamesRecordReference);

                        context.pushNamed(
                          'ScoreCard1',
                          queryParameters: {
                            'holeNum': serializeParam(
                              1,
                              ParamType.int,
                            ),
                            'gameRec': serializeParam(
                              _model.gameRec?.reference,
                              ParamType.DocumentReference,
                            ),
                            'playerNum': serializeParam(
                              widget.playerNum,
                              ParamType.int,
                            ),
                            'totalHole': serializeParam(
                              widget.holeCount,
                              ParamType.int,
                            ),
                            'runningPar': serializeParam(
                              0,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );

                        setState(() {});
                      },
                      text: 'Start Game!',
                      options: FFButtonOptions(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x00FFAD4F),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 60.0,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
