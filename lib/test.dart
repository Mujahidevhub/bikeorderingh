import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen1Widget extends StatefulWidget {
  const LoginScreen1Widget({Key? key}) : super(key: key);

  @override
  _LoginScreen1WidgetState createState() => _LoginScreen1WidgetState();
}

class _LoginScreen1WidgetState extends State<LoginScreen1Widget> {
  String? dropDownValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0.4, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.85, 0),
                        child: FlutterFlowDropDown<String>(
                          initialOption: dropDownValue ??= 'En',
                          options: ['En', 'Ar', 'Eu'],
                          onChanged: (val) =>
                              setState(() => dropDownValue = val),
                          width: 180,
                          height: 50,
                          textStyle:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 15,
                          ),
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 0,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Image.asset(
                          'assets/images/miki.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 15),
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                        ),
                      ),
                      Text(
                        'If you are new user, kindly create your new AlRamz account, completely online',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Image.asset(
                          'assets/images/miki.png',
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Getting Started',
                    options: FFButtonOptions(
                      width: 300,
                      height: 50,
                      color: Color(0xFFAD8400),
                      textStyle:
                      FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      ' Sign in ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFAD8400),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
