// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aws_product_stocks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AwsProductStocksImpl _$$AwsProductStocksImplFromJson(
        Map<String, dynamic> json) =>
    _$AwsProductStocksImpl(
      id: (json['id'] as num).toInt(),
      displayName: json['display_name'] as String?,
      categId: json['categ_id'] == null
          ? null
          : DisplayNameModel.fromJson(json['categ_id'] as Map<String, dynamic>),
      avgCost: (json['avg_cost'] as num?)?.toDouble(),
      totalValue: (json['total_value'] as num?)?.toDouble(),
      qtyAvailable: (json['qty_available'] as num?)?.toDouble(),
      freeQty: (json['free_qty'] as num?)?.toDouble(),
      incomingQty: (json['incoming_qty'] as num?)?.toDouble(),
      outgoingQty: (json['outgoing_qty'] as num?)?.toDouble(),
      virtualAvailable: (json['virtual_available'] as num?)?.toDouble(),
      warehouseId: (json['warehouseId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AwsProductStocksImplToJson(
        _$AwsProductStocksImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'categ_id': instance.categId,
      'avg_cost': instance.avgCost,
      'total_value': instance.totalValue,
      'qty_available': instance.qtyAvailable,
      'free_qty': instance.freeQty,
      'incoming_qty': instance.incomingQty,
      'outgoing_qty': instance.outgoingQty,
      'virtual_available': instance.virtualAvailable,
      'warehouseId': instance.warehouseId,
    };

_$CurrentWarehouseImpl _$$CurrentWarehouseImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentWarehouseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$CurrentWarehouseImplToJson(
        _$CurrentWarehouseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
