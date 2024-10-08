// ignore_for_file: inference_failure_on_collection_literal

import 'package:dart_odoo_api/models/aws_product_stocks_model.dart';
import 'package:dart_odoo_api/models/project_tasks_model.dart';
import 'package:dart_odoo_api/models/sales_record_model.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

class OdooRepository {
  OdooRepository({required this.client});
  final OdooClient client;

  Future<OdooSession?> login(
    String dbName,
    String username,
    String password,
  ) async {
    try {
      final response = await client.authenticate(dbName, username, password);
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<List<SalesOrder>?> fetchSales() async {
    final specification = {
      'name': {}, //A
      'create_date': {}, //B
      'partner_id': {
        //C-E
        'fields': {
          'display_name': {},
          'contact_address': {},
          'phone': {},
        },
      },
      'x_studio_sales_rep_1': {}, //F
      'x_studio_sales_source': {}, //G
      'x_studio_commission_paid': {}, //H
      'x_studio_referred_by': {
        'fields': {
          'display_name': {}, //I
        },
      },
      'x_studio_referrer_processed': {}, //J
      'x_studio_payment_type': {}, //K
      'amount_total': {}, //L
      'delivery_status': {}, //M
      'amount_to_invoice': {}, //N
      'x_studio_invoice_payment_status': {}, //O
      'internal_note_display': {}, //P
      'state': {},
      'user_id': {
        'fields': {
          'display_name': {},
        },
      },
      'team_id': {
        'fields': {
          'display_name': {},
        },
      },
      'tag_ids': {
        'fields': {
          'display_name': {},
        },
      },
      'order_line': {
        'fields': {
          'product_template_id': {
            'fields': {'display_name': {}},
          }, // a
          'name': {}, //b
          'product_uom_qty': {}, //c
          'qty_delivered': {}, //d
          'qty_invoiced': {}, //e
          'price_unit': {}, //f
          'tax_id': {
            //g
            'fields': {'display_name': {}},
          },
          'discount': {}, //h
          'price_subtotal': {}, //i
        },
      },
      'tax_totals': {},
    };

    // final domain = [
    //   ['user_id', '=', 2],
    // ];

    try {
      final response = await client.callKw({
        'model': 'sale.order',
        'method': 'web_search_read',
        'args': [
          [], // domain,
          specification,
        ],
        'kwargs': {},
      });

      final data =
          ((response as Map<String, dynamic>)['records'] as List<dynamic>)
              .cast<Map<String, dynamic>>();
      final parsedData = data.map(SalesOrder.fromJson).toList();

      final filteredData = parsedData
          .where(
            (element) =>
                element.tagIds?.any(
                  (element) => element.displayName == 'Retail System',
                ) ??
                false,
          )
          .toList();
      return filteredData;
    } catch (e) {
      return null;
    }
  }

  Future<SalesOrder?> fetchSalesById(String id) async {
    final specification = {
      'name': {}, //A
      'create_date': {}, //B
      'partner_id': {
        //C-E
        'fields': {
          'display_name': {},
          'contact_address': {},
          'phone': {},
        },
      },
      'x_studio_sales_rep_1': {}, //F
      'x_studio_sales_source': {}, //G
      'x_studio_commission_paid': {}, //H
      'x_studio_referred_by': {
        'fields': {
          'display_name': {}, //I
        },
      },
      'x_studio_referrer_processed': {}, //J
      'x_studio_payment_type': {}, //K
      'amount_total': {}, //L
      'delivery_status': {}, //M
      'amount_to_invoice': {}, //N
      'x_studio_invoice_payment_status': {}, //O
      'internal_note_display': {}, //P
      'state': {},
      'user_id': {
        'fields': {
          'display_name': {},
        },
      },
      'team_id': {
        'fields': {
          'display_name': {},
        },
      },
      'tag_ids': {
        'fields': {
          'display_name': {},
        },
      },
      'order_line': {
        'fields': {
          'product_template_id': {
            'fields': {'display_name': {}},
          }, // a
          'name': {}, //b
          'product_uom_qty': {}, //c
          'qty_delivered': {}, //d
          'qty_invoiced': {}, //e
          'price_unit': {}, //f
          'tax_id': {
            //g
            'fields': {'display_name': {}},
          },
          'discount': {}, //h
          'price_subtotal': {}, //i
        },
      },
      'tax_totals': {},
    };

    try {
      final response = await client.callRPC(
        '/web/dataset/call_kw',
        'call',
        {
          'model': 'sale.order',
          'method': 'web_read',
          'args': [
            [int.parse(id)],
          ],
          'kwargs': {
            'specification': specification,
          },
        },
      );

      final data = (response as List<dynamic>).cast<Map<String, dynamic>>();
      final parsedData = data.map(SalesOrder.fromJson).toList();

      return parsedData.first;
    } catch (e) {
      return null;
    }
  }

  Future<List<ProjectTasks>?> fetchAllTasks() async {
    final specification = {
      'date_assign': {},
      'date_deadline': {},
      'name': {},
      'sale_line_id': {
        'fields': {
          'id': {},
          'display_name': {},
        },
      },
    };

    try {
      final response = await client.callKw({
        'model': 'project.task',
        'method': 'web_search_read',
        'args': [
          [],
          specification,
        ],
        'kwargs': {},
      });

      final data =
          ((response as Map<String, dynamic>)['records'] as List<dynamic>)
              .cast<Map<String, dynamic>>();
      final parsedData = data.map(ProjectTasks.fromJson).toList();

      return parsedData;
    } catch (e) {
      return null;
    }
  }

  Future<List<AwsProductStocks>?> fetchStocks(
    int warehouseId,
  ) async {
    final specification = {
      "id": {},
      "display_name": {},
      "categ_id": {
        "fields": {"display_name": {}}
      },
      "company_currency_id": {"fields": {}},
      "cost_method": {},
      "avg_cost": {},
      "total_value": {},
      "qty_available": {},
      "free_qty": {},
      "incoming_qty": {},
      "outgoing_qty": {},
      "virtual_available": {}
    };

    try {
      final response = await client.callKw({
        'model': 'product.product',
        'method': 'web_search_read',
        'args': [
          [
            ["detailed_type", "=", "product"]
          ],
          specification,
        ],
        'kwargs': {
          //modify this, if warehouseNum > 0 show
          if (warehouseId > 0) "context": {"warehouse": warehouseId}
        },
      });

      final data =
          ((response as Map<String, dynamic>)['records'] as List<dynamic>)
              .cast<Map<String, dynamic>>();
      final parsedData = data.map(AwsProductStocks.fromJson).toList();

      List<AwsProductStocks> modifiedData = [];

      for (var item in parsedData) {
        modifiedData.add(item.copyWith(warehouseId: warehouseId));
      }

      return modifiedData;
    } catch (e) {
      return null;
    }
  }

  Future<List<CurrentWarehouse>?> getCurrentWarehouses() async {
    try {
      final response = await client.callKw({
        'model': 'stock.warehouse',
        'method': 'get_current_warehouses',
        'args': [
          [],
        ],
        'kwargs': {},
      });

      final data = (response as List<dynamic>).cast<Map<String, dynamic>>();
      final parsedData = data.map(CurrentWarehouse.fromJson).toList();

      return parsedData;
    } catch (e) {
      return null;
    }
  }
}
