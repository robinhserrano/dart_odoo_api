// ignore_for_file: inference_failure_on_collection_literal

import 'dart:io';

import 'package:dart_odoo_api/models/aws_sales_record_model.dart';
import 'package:dart_odoo_api/models/aws_user_model.dart';
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

  Future<bool> updateSalesOrderUserIds(
    List<Map<String, dynamic>> dataList,
  ) async {
    try {
      final response = await client.post<dynamic>(
        '$url/updateSalesOrderUserIds',
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

  Future<List<AwsUser>?> fetchUsers() async {
    // final user = await HiveHelper.getCurrentUser();
    try {
      final response = await client.get<List<dynamic>>(
        '$url/users',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $ACCESS_TOKEN',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      final data = response.data!.cast<Map<String, dynamic>>();
      final parsedData = data.map(AwsUser.fromJson).toList();
      // var hehe = parsedData.where((e) => e.salesManagerId == user.first.userId);
      // var hihi = hehe ;

      // if (user.accessLevel == 2 || user.accessLevel == 3) {
      //   final salesTeamManager = parsedData
      //       .where(
      //         (e) => e.salesManagerId == user.userId && e.accessLevel == 2,
      //       )
      //       .toList();

      //   final managers = [
      //     ...salesTeamManager.map((e) => e.id),
      //     user.userId,
      //   ];

      //   final salesPerson = parsedData
      //       .where(
      //         (e) => managers.contains(e.salesManagerId),
      //       )
      //       .toList();

      //   final currentUser = parsedData.firstWhere(
      //     (e) => e.id == user.userId,
      //   );

      //   return [currentUser, ...salesTeamManager, ...salesPerson]
      //       .toSet()
      //       .toList();
      // }
      return parsedData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AwsSalesOrder>?> fetchSales() async {
    try {
      final response = await client.get<List<dynamic>>(
        '$url/salesOrder',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $ACCESS_TOKEN',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      final data = response.data!.cast<Map<String, dynamic>>();
      final parsedData = data.map(AwsSalesOrder.fromJson).toList();

      return parsedData;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
