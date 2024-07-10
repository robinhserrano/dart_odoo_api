// ignore_for_file: inference_failure_on_collection_literal

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dart_odoo_api/env.dart';
//test

class Repository {
  Repository({required this.client});
  final Dio client;
  static String url = 'https://commission.wateranalytics.com.au/api';

  Future<bool> saveAwsSalesBulk(
    List<Map<String, dynamic>> dataList,
  ) async {
    try {
      final response = await client.post<dynamic>(
        '$url/bulkStore',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $ACCESS_TOKEN',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
        data: dataList,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateDeadlinesBulk(
    List<Map<String, dynamic>> dataList,
  ) async {
    try {
      final response = await client.post<dynamic>(
        '$url/bulkUpdateDeadlines',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $ACCESS_TOKEN',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
        data: dataList,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
