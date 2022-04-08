import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class FireTimestampConverterNullable
    implements JsonConverter<DateTime?, dynamic> {
  const FireTimestampConverterNullable();

  @override
  DateTime? fromJson(dynamic json) {
    try {
      final dateTime = json as Timestamp;
      return dateTime.toDate();
    } catch (_) {
      return null;
    }
  }

  @override
  Timestamp? toJson(DateTime? data) {
    try {
      return Timestamp.fromDate(data!);
    } catch (_) {}
    return null;
  }
}

class FireTimestampConverterNonNull
    implements JsonConverter<DateTime, dynamic> {
  const FireTimestampConverterNonNull({this.defaultValue});

  final DateTime? defaultValue;

  @override
  DateTime fromJson(dynamic json) {
    try {
      final dateTime = json as Timestamp;
      return dateTime.toDate();
    } catch (_) {
      return defaultValue ?? DateTime.now();
    }
  }

  @override
  Timestamp toJson(DateTime data) {
    try {
      return Timestamp.fromDate(data);
    } catch (_) {
      return defaultValue != null
          ? Timestamp.fromDate(defaultValue!)
          : Timestamp.now();
    }
  }
}
