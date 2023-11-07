import '/auth/firebase_auth/auth_util.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).warning,
        automaticallyImplyLeading: false,
        title: Text(
          ' P r o f i l e',
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Plus Jakarta Sans',
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
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
                FlutterFlowTheme.of(context).tertiary
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() => _model.isDataUploading = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];

                            var downloadUrls = <String>[];
                            try {
                              selectedUploadedFiles = selectedMedia
                                  .map((m) => FFUploadedFile(
                                        name: m.storagePath.split('/').last,
                                        bytes: m.bytes,
                                        height: m.dimensions?.height,
                                        width: m.dimensions?.width,
                                        blurHash: m.blurHash,
                                      ))
                                  .toList();

                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              _model.isDataUploading = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl = downloadUrls.first;
                              });
                            } else {
                              setState(() {});
                              return;
                            }
                          }
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFDBE2E7),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 120.0,
                            height: 120.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'data:image/jpeg;base64,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',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Delete Account'),
                              content: Text(
                                  'This Action can not be undone. Do you want to delete your account?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: Text('Confirm'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      await authManager.deleteUser(context);
                    }

                    context.goNamedAuth('homepage', context.mounted);
                  },
                  text: 'Delete Account',
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0x00FFAD4F),
                    textStyle:
                        FlutterFlowTheme.of(context).displaySmall.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFF0000),
                            ),
                    borderSide: BorderSide(
                      color: Color(0xFFFF0000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, -0.05),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        context.goNamedAuth('signin', context.mounted);
                      },
                      text: 'Log out',
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x00FFAD4F),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 100.0,
                                ),
                        borderSide: BorderSide(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          width: 1.0,
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
