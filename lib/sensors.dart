import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'sensors_model.dart';
export 'sensors_model.dart';

class SensorsWidget extends StatefulWidget {
  const SensorsWidget({super.key});

  static String routeName = 'sensors';
  static String routePath = '/sensors';

  @override
  State<SensorsWidget> createState() => _SensorsWidgetState();
}

class _SensorsWidgetState extends State<SensorsWidget> {
  late SensorsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SensorsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          _model.apiResultbrc = await FirebaseRTGroup.getAllDataCall.call();

          FFAppState().addToTempHistoryList(50.0);
          FFAppState().addToDoHistoryList(getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.DO''',
          ));
          FFAppState().addToPhHistoryList(getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.PH''',
          ));
          FFAppState().addToClHistoryList(getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.CL''',
          ));
          FFAppState().addToEcHistoryList(getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.EC''',
          ));
          FFAppState().addToTdsHistoryList(getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.TDS''',
          ));
          FFAppState().addToOrpHistoryList(getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.ORP''',
          ));
          safeSetState(() {});
          _model.currentPH = getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.PH''',
          );
          _model.currenttemp = getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.watertep''',
          );
          _model.currentDO = getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.DO''',
          );
          _model.currentCL = getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.CL''',
          );
          _model.currentEC = getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.EC''',
          );
          _model.currentTDS = getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.TDS''',
          );
          _model.currentORP = getJsonField(
            (_model.apiResultbrc?.jsonBody ?? ''),
            r'''$.ORP''',
          );
          safeSetState(() {});
          if (_model.isAlarmMuted == false) {
            if ((_model.currentPH! > 8.5) ||
                (_model.currentPH! < 6.5) ||
                (_model.currenttemp! > 30.0) ||
                (_model.currentDO! < 5.0) ||
                (_model.currentCL! > 0.01) ||
                (_model.currentEC! > 2000.0) ||
                (_model.currentTDS! > 1000.0) ||
                (_model.currentORP! < 200.0)) {
              _model.isAlarmMuted = true;
              safeSetState(() {});
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('â ï¸ System Alert: Critical Levels!'),
                    content: Text(
                        'One or more sensors are outside the safe range. Please check the dashboard immediately to stabilize the system.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  );
                },
              );
              await Future.delayed(
                Duration(
                  milliseconds: 60000,
                ),
              );
              _model.isAlarmMuted = false;
              safeSetState(() {});
            }
          }
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: FirebaseRTGroup.getAllDataCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final sensorsGetAllDataResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: AppBar(
                backgroundColor: Color(0xFF1A237E),
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  'Sensors',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 22,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    120, 0, 0, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 50,
                                  icon: Icon(
                                    Icons.fiber_manual_record,
                                    color: getJsonField(
                                      sensorsGetAllDataResponse.jsonBody,
                                      r'''$.isOnline''',
                                    )
                                        ? Color(0xFF0F9022)
                                        : Color(0xFFEF0707),
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    context.pop();
                                  },
                                ),
                              ),
                              Text(
                                'System Status',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 16,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 2,
              ),
            ),
            body: SafeArea(
              top: true,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: true,
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                    PointerDeviceKind.stylus,
                    PointerDeviceKind.unknown,
                  },
                ),
                child: Scrollbar(
                    child: GridView(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    100,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FirebaseRTGroup.getAllDataCall.temp(
                                sensorsGetAllDataResponse.jsonBody,
                              )! >
                              30.0
                          ? Color(0xFFEB0A0A)
                          : Color(0xFF696977),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.thermostat_sharp,
                            color: Color(0xFFF60D0D),
                            size: 50,
                          ),
                          Text(
                            'Water Temp',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF081A27),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              '${valueOrDefault<String>(
                                getJsonField(
                                  sensorsGetAllDataResponse.jsonBody,
                                  r'''$.watertep''',
                                )?.toString(),
                                '0',
                              )}  Â°C',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FirebaseRTGroup.getAllDataCall.doo(
                                sensorsGetAllDataResponse.jsonBody,
                              )! <
                              5.0
                          ? Color(0xFFEB0A0A)
                          : Color(0xFF696977),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.bubble_chart_sharp,
                            color: Color(0xFF0D0DF6),
                            size: 50,
                          ),
                          Text(
                            'Oxygen (DO)',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF081A27),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              '${getJsonField(
                                sensorsGetAllDataResponse.jsonBody,
                                r'''$.DO''',
                              ).toString()}  mg/L',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FirebaseRTGroup.getAllDataCall.ph(
                                sensorsGetAllDataResponse.jsonBody,
                              )! >
                              8.5
                          ? Color(0xFFF40909)
                          : (FirebaseRTGroup.getAllDataCall.ph(
                                    sensorsGetAllDataResponse.jsonBody,
                                  )! <
                                  6.5
                              ? Color(0xFFF80505)
                              : Color(0xFF696977)),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.science_sharp,
                            color: Color(0xFF0D0DF6),
                            size: 50,
                          ),
                          Text(
                            'PH',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF081A27),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              valueOrDefault<String>(
                                getJsonField(
                                  sensorsGetAllDataResponse.jsonBody,
                                  r'''$.PH''',
                                )?.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FirebaseRTGroup.getAllDataCall.cl(
                                sensorsGetAllDataResponse.jsonBody,
                              )! >
                              0.01
                          ? Color(0xFFFF0000)
                          : Color(0xFF696977),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.opacity_outlined,
                            color: Color(0xFF0D0DF6),
                            size: 50,
                          ),
                          Text(
                            'CL',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF081A27),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              '${valueOrDefault<String>(
                                getJsonField(
                                  sensorsGetAllDataResponse.jsonBody,
                                  r'''$.CL''',
                                )?.toString(),
                                '0',
                              )}  ppm',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FirebaseRTGroup.getAllDataCall.ec(
                                sensorsGetAllDataResponse.jsonBody,
                              )! >
                              2000.0
                          ? Color(0xFFFF0000)
                          : Color(0xFF696977),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.electric_bolt_rounded,
                            color: Color(0xFF078120),
                            size: 50,
                          ),
                          Text(
                            'Conductivity',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF081A27),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              '${getJsonField(
                                sensorsGetAllDataResponse.jsonBody,
                                r'''$.EC''',
                              ).toString()}  ÂµS/cm',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FirebaseRTGroup.getAllDataCall.tds(
                                sensorsGetAllDataResponse.jsonBody,
                              )! >
                              1000.0
                          ? Color(0xFFFF0000)
                          : Color(0xFF696977),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.grain,
                            color: Color(0xFF38383C),
                            size: 50,
                          ),
                          Text(
                            'TDS',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF081A27),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              '${valueOrDefault<String>(
                                getJsonField(
                                  sensorsGetAllDataResponse.jsonBody,
                                  r'''$.TDS''',
                                )?.toString(),
                                '0',
                              )}  ppm',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FirebaseRTGroup.getAllDataCall.orp(
                                sensorsGetAllDataResponse.jsonBody,
                              )! <
                              200.0
                          ? Color(0xFFFF0000)
                          : Color(0xFF696977),
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.high_quality_rounded,
                            color: Color(0xFFB56E45),
                            size: 50,
                          ),
                          Text(
                            'ORP',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF081A27),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              '${valueOrDefault<String>(
                                getJsonField(
                                  sensorsGetAllDataResponse.jsonBody,
                                  r'''$.ORP''',
                                )?.toString(),
                                '0',
                              )}  mV',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ),
        );
      },
    );
  }
}
