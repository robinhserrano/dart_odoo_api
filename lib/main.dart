import 'package:dio/dio.dart';
import 'package:dart_odoo_api/env.dart';
import 'package:dart_odoo_api/models/sales_record_model.dart';
import 'package:dart_odoo_api/repo/odoo_repository.dart';
import 'package:dart_odoo_api/repo/repository.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

Future<void> main() async {
  OdooRepository odooRepo = OdooRepository(client: OdooClient(DB_URL));
  Repository repo = Repository(client: Dio());

  try {
    //Auth login odoo
    var totalStart = DateTime.now();
    var loginStart = DateTime.now();
    print('logging in...');
    await odooRepo.login(
      DB_NAME,
      USERNAME,
      PASSWORD,
    );
    var loginEnd = DateTime.now();
    print(
        '_ Login Success! : ${loginEnd.difference(loginStart).inMilliseconds}');

    //Sales Fetch from Odoo
    var salesStart = DateTime.now();
    print('fetching sales...');
    var sales = await odooRepo.fetchSales();
    var salesEnd = DateTime.now();
    print(
        '_ Fetch Sales Success! : ${salesEnd.difference(salesStart).inMilliseconds}');

    //Upload fetched odoo to AWS
    if (sales != null) {
      var uploadStart = DateTime.now();
      print('uploading sales...');
      await saveAwsSalesBulk(sales, (value) {
        print('Progress :$value');
        print(
            'Time Taken : ${DateTime.now().difference(uploadStart).inMilliseconds}');
      });
      var uploadEnd = DateTime.now();
      print(
          '_ Upload Sales Success! : ${uploadEnd.difference(uploadStart).inMilliseconds}');
    }

    //Fetch Project Tasks Odoo
    var tasksStart = DateTime.now();
    print('filtering task deadline from sales...');
    var tasks = await odooRepo.fetchAllTasks();
    var tasksEnd = DateTime.now();
    print(
        '_ Task Deadline Success! : ${tasksEnd.difference(tasksStart).inMilliseconds}');

    //Upload task data_deadline via AwsSalesOrder id
    final tasksDeadline = <Map<String, dynamic>>[];
    if (tasks != null && sales != null) {
      for (var task in tasks) {
        if (task.dateDeadline != null) {
          for (var sale in sales) {
            var taskName = task.saleLineId?.displayName?.split('-')[0].trim();
            var salesName = sale.name;
            if (taskName == salesName) {
              tasksDeadline.add({
                'name': '${sale.name}',
                'date_deadline': '${task.dateDeadline}'
              });
              break;
            }
          }
        }
      }
    }

    //Upload fetched deadlines odoo to AWS
    if (tasksDeadline.isNotEmpty) {
      var uploadStart = DateTime.now();
      print('uploading deadlines...');
      await updateDeadlinesBulk(tasksDeadline, (value) {
        print('Progress :$value');
        print(
            'Time Taken (deadline): ${DateTime.now().difference(uploadStart).inMilliseconds}');
      });
      var uploadEnd = DateTime.now();
      print(
          '_ Upload Deadlines Success! : ${uploadEnd.difference(uploadStart).inMilliseconds}');
    }

    //fetch AWS Users
    var usersStart = DateTime.now();
    print('fetching sales...');
    var users = await repo.fetchUsers();
    var usersEnd = DateTime.now();
    print(
        '_ Fetch users Success! : ${usersEnd.difference(usersStart).inMilliseconds}');
    //fetch AWS Sales
    var awsSalesStart = DateTime.now();
    print('fetching sales...');
    var awsSales = await repo.fetchSales();
    var awsSalesEnd = DateTime.now();
    print(
        '_ Fetch awsSales Success! : ${awsSalesEnd.difference(awsSalesStart).inMilliseconds}');

    final salesOrderUserIds = <Map<String, dynamic>>[];
    final salesOrderNoUserIds = <Map<String, dynamic>>[];
    if (users != null && awsSales != null) {
      for (var awsSale in awsSales) {
        for (var user in users) {
          var salesRepName = awsSale.xStudioSalesRep1;
          var userName = user.displayName;

          var userId = 0;
          if ((salesRepName ?? '').toLowerCase() == userName.toLowerCase()) {
            userId = user.id;
          }

          if (userId > 0) {
            salesOrderUserIds
                .add({'id': '${awsSale.id}', 'user_id': '$userId'});
            break;
          } else {
            salesOrderNoUserIds.add({
              'id': '${awsSale.id}',
              'user_id': '$userId',
            });
          }
        }
      }
    }

    var filteredSalesOrderUserIds = salesOrderUserIds.toSet().toList();

    if (filteredSalesOrderUserIds.isNotEmpty) {
      var uploadStart = DateTime.now();
      print('uploading salesOrderUserIds...');
      await updateSalesOrderUserIds(filteredSalesOrderUserIds, (value) {
        print('Progress :$value');
        print(
            'Time Taken (salesOrderUserIds): ${DateTime.now().difference(uploadStart).inMilliseconds}');
      });
      var uploadEnd = DateTime.now();
      print(
          '_ Upload salesOrderUserIds Success! : ${uploadEnd.difference(uploadStart).inMilliseconds}');
    }

    await repo.postOdooSyncLog(awsSales?.length ?? 0);

    var filteredData = awsSales?.where((e) => e.state == 'sale').toList();

    var totalEnd = DateTime.now();
    print('_ OdooSyncLogged - Total Items : ${filteredData?.length ?? 0}');
    print('_ Total Time: ${totalEnd.difference(totalStart).inMilliseconds}');
  } catch (e) {
    print(e);
  }
}

Future<bool> saveAwsSalesBulk(
  List<SalesOrder> sales,
  void Function(double) onProgress,
) async {
  Repository repo = Repository(client: Dio());
  final totalSales = sales.length;

  try {
    final dataList = <Map<String, dynamic>>[];
    for (final salesOrder in sales) {
      dataList.add({
        'amount_to_invoice': salesOrder.amountToInvoice,
        'amount_total': salesOrder.amountTotal,
        'amount_untaxed': salesOrder.taxTotals?.amountUntaxed,
        'create_date': salesOrder.createDate?.toIso8601String(),
        'delivery_status': salesOrder.deliveryStatus,
        'internal_note_display': salesOrder.internalNoteDisplay,
        'name': salesOrder.name,
        'partner_id_contact_address': salesOrder.partnerId?.contactAddress,
        'partner_id_display_name': salesOrder.partnerId?.displayName,
        'partner_id_phone': salesOrder.partnerId?.phone,
        'state': salesOrder.state,
        'x_studio_commission_paid': salesOrder.xStudioCommissionPaid ? 1 : 0,
        'x_studio_invoice_payment_status':
            salesOrder.xStudioInvoicePaymentStatus,
        'x_studio_payment_type': salesOrder.xStudioPaymentType,
        'x_studio_referrer_processed':
            salesOrder.xStudioReferrerProcessed ? 1 : 0,
        'x_studio_sales_rep_1': salesOrder.xStudioSalesRep1,
        'x_studio_sales_source': salesOrder.xStudioSalesSource,
        'order_line': salesOrder.orderLine != null
            ? salesOrder.orderLine!
                .map(
                  (e) => {
                    'product': e.productTemplateId?.displayName ?? '',
                    'description': e.name,
                    'quantity': e.productUomQty,
                    'delivered': e.qtyDelivered,
                    'invoiced': e.qtyInvoiced,
                    'unit_price': e.priceUnit,
                    'taxes': e.taxId?.isNotEmpty ?? false
                        ? e.taxId![0].displayName
                        : '',
                    'disc': e.discount,
                    'tax_excl': e.priceSubtotal,
                  },
                )
                .toList()
            : [],
      });
    }

    const chunkSize = 500;
    var currentChunk = <Map<String, dynamic>>[];

    for (final salesOrder in dataList) {
      currentChunk.add(salesOrder);
      if (currentChunk.length == chunkSize) {
        await repo.saveAwsSalesBulk(currentChunk);
        final progress = (currentChunk.length / totalSales) * 100;
        onProgress(progress);
        currentChunk = [];
      }
    }

    if (currentChunk.isNotEmpty) {
      await repo.saveAwsSalesBulk(currentChunk);
      final progress = (totalSales / totalSales) * 100;
      onProgress(progress);
    }

    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateSalesOrderUserIds(
  List<Map<String, dynamic>> salesOrderUserIds,
  void Function(double) onProgress,
) async {
  Repository repo = Repository(client: Dio());
  final totalSales = salesOrderUserIds.length;

  try {
    await repo.updateSalesOrderUserIds(salesOrderUserIds);
    final progress = (totalSales / totalSales) * 100;
    onProgress(progress);
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateDeadlinesBulk(
  List<Map<String, dynamic>> dateDeadlines,
  void Function(double) onProgress,
) async {
  Repository repo = Repository(client: Dio());
  final totalSales = dateDeadlines.length;

  try {
    await repo.updateDeadlinesBulk(dateDeadlines);
    final progress = (totalSales / totalSales) * 100;
    onProgress(progress);
    return true;
  } catch (e) {
    return false;
  }
}
