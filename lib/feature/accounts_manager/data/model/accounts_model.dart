import 'package:flutter/widgets.dart';
import 'package:personal_expenses/core/constants/enum_color.dart';

class AccountModel {
  final int? id;
  final String name;
  final String accountType;
  final double balance;
  final String currency;
  final String icon;
  final Color color;
  final bool isActive;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  AccountModel({
    this.id,
    required this.name,
    required this.accountType,
    required this.balance,
    required this.currency,
    required this.icon,
    required this.color,
    required this.isActive,
    required this.userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'],
      name: map['name'],
      accountType: _translateAccountTypeToSpanish(map['accountType']),
      balance: map['balance'],
      currency: map['currency'],
      icon: map['icon'],
      color: _colorFromEnumName(map['color']),
      isActive: map['isActive'] == 1 ? true : false,
      userId: map['userId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'accountType': _translateAccountTypeToEnglish(accountType),
      'balance': balance,
      'currency': currency,
      'icon': icon,
      'color': _enumNameFromColor(color),
      'isActive': isActive ? 1 : 0,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  AccountModel copyWith({
    int? id,
    String? name,
    String? accountType,
    double? balance,
    String? currency,
    String? icon,
    Color? color,
    bool? isActive,
    int? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AccountModel(
      id: id ?? this.id,
      name: name ?? this.name,
      accountType: accountType ?? this.accountType,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      isActive: isActive ?? this.isActive,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  //Función auxiliar para trabajar con el enum
  String _enumNameFromColor(Color color) {
    return EnumColors.values
        .firstWhere((c) => c.color.toARGB32() == color.toARGB32())
        .name;
  }

  static Color _colorFromEnumName(String name) {
    try {
      return EnumColors.values.firstWhere((c) => c.name == name).color;
    } catch (e) {
      return EnumColors.skyBlue.color;
    }
  }

  String _translateAccountTypeToEnglish(String accountType) {
    switch (accountType) {
      case 'Cuenta Bancaria':
        return 'checking';
      case 'Ahorro':
        return 'saving';
      case 'Tarjeta de Crédito':
        return 'credit_card';
      case 'Efectivo':
        return 'cash';
      case 'Inversiones':
        return 'investment';
      default:
        return '';
    }
  }

  static String _translateAccountTypeToSpanish(String accountType) {
    switch (accountType) {
      case 'checking':
        return 'Cuenta Bancaria';
      case 'saving':
        return 'Ahorro';
      case 'credit_card':
        return 'Tarjeta de Crédito';
      case 'cash':
        return 'Efectivo';
      case 'investment':
        return 'Inversiones';
      default:
        return '';
    }
  }
}
