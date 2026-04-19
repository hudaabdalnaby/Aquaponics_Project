import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double newCustomFunction(int count) {
  return count * 5 / 3600.0;
}

double? max(List<double>? historyListmax) {
// ÙÙ Ø§Ø³Ù Ø§ÙØ¯Ø§ÙØ© ÙÙ Ø§ÙØ®Ø§ÙØ© Ø§ÙÙÙÙÙ ÙÙ newCustomFunction2
  if (historyListmax == null || historyListmax.isEmpty) {
    return 0.0;
  }
  return historyListmax.reduce((curr, next) => curr > next ? curr : next);
}

double? min(List<double>? historyListmin) {
  if (historyListmin == null || historyListmin.isEmpty) return 0.0;
  return historyListmin.reduce((curr, next) => curr < next ? curr : next);
}

double? average(List<double>? historyListavr) {
  if (historyListavr == null || historyListavr.isEmpty) return 0.0;
  double sum = historyListavr.reduce((a, b) => a + b);
  return double.parse((sum / historyListavr.length)
      .toStringAsFixed(2)); // Ø¹Ø´Ø§Ù ÙØ«Ø¨Øª Ø±ÙÙÙÙ Ø¹Ø´Ø±ÙÙÙ Ø¨Ø³
}
