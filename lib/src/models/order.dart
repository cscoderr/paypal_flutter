import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_flutter/paypal_flutter.dart';

part 'order.g.dart';

typedef Authorizations = Map<String, dynamic>;
typedef Captures = Map<String, dynamic>;
typedef Refunds = Map<String, dynamic>;

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Order {
  Order({
    this.intent,
    this.purchaseUnits,
    this.payer,
    this.applicationContext,
    this.status,
    this.message,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  final Intents? intent;
  final List<PurchaseUnit>? purchaseUnits;
  final Payer? payer;
  final ApplicationContext? applicationContext;
  final Status? status;
  final String? message;
}

enum Intents { CAPTURE, AUTHORIZE }

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class ApplicationContext {
  ApplicationContext({
    this.applicationContext,
    this.cancelUrl,
    this.brandName,
    this.locale,
    this.returnUrl,
    this.landingPage,
    this.userAction,
  });

  factory ApplicationContext.fromJson(Map<String, dynamic> json) =>
      _$ApplicationContextFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationContextToJson(this);

  final String? applicationContext;
  final String? cancelUrl;
  final String? brandName;
  final String? locale;
  final String? returnUrl;
  final LandingPage? landingPage;
  final UserAction? userAction;
}

enum LandingPage { LOGIN, BILLING, NO_PREFERENCE }

enum UserAction {
  CONTINUE,
  PAY_NOW,
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Payer {
  Payer({
    this.name,
    this.emailAddress,
    this.birthDate,
    this.payerId,
  });

  factory Payer.fromJson(Map<String, dynamic> json) => _$PayerFromJson(json);

  Map<String, dynamic> toJson() => _$PayerToJson(this);

  final Name? name;
  final String? emailAddress;
  final String? birthDate;
  final String? payerId;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Name {
  Name({
    this.givenName,
    this.surname,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
  Map<String, dynamic> toJson() => _$NameToJson(this);

  final String? givenName;
  final String? surname;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class PurchaseUnit {
  PurchaseUnit({
    this.amount,
    this.referenceId,
    this.customId,
    this.description,
    this.invoiceId,
    this.softDescriptor,
    this.payee,
    this.paymentInstruction,
    this.items,
    this.payments,
  });

  factory PurchaseUnit.fromJson(Map<String, dynamic> json) =>
      _$PurchaseUnitFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseUnitToJson(this);

  final AmountWithCurrencyCode? amount;
  final String? referenceId;
  final String? customId;
  final String? description;
  final String? invoiceId;
  final String? softDescriptor;
  final Payee? payee;
  final PaymentInstruction? paymentInstruction;
  final List<PurchaseItem>? items;
  // final String shipping;
  final PurchaseItem? payments;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Payments {
  Payments({
    this.authorizations,
    this.captures,
    this.refunds,
  });

  factory Payments.fromJson(Map<String, dynamic> json) =>
      _$PaymentsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentsToJson(this);

  final Authorizations? authorizations;
  final Captures? captures;
  final Refunds? refunds;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class PurchaseItem {
  PurchaseItem({
    this.name,
    this.quantity,
    this.unitAmount,
    this.tax,
    this.description,
    this.sku,
    this.category,
  });

  factory PurchaseItem.fromJson(Map<String, dynamic> json) =>
      _$PurchaseItemFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseItemToJson(this);

  final String? name;
  final String? quantity;
  final AmountWithCurrencyCode? unitAmount;
  final AmountWithCurrencyCode? tax;
  final String? description;
  final String? sku;
  final Category? category;
}

enum Category {
  PHYSICAL_GOODS,
  DIGITAL_GOODS,
  DONATION,
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class Payee {
  Payee({
    this.merchantId,
    this.emailAddress,
  });

  factory Payee.fromJson(Map<String, dynamic> json) => _$PayeeFromJson(json);

  Map<String, dynamic> toJson() => _$PayeeToJson(this);

  final String? merchantId;
  final String? emailAddress;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class PaymentInstruction {
  PaymentInstruction({
    this.platformFees,
    this.disbursementMode,
  });

  factory PaymentInstruction.fromJson(Map<String, dynamic> json) =>
      _$PaymentInstructionFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentInstructionToJson(this);

  final List<PlatformFees>? platformFees;
  final DisbursementMode? disbursementMode;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class PlatformFees {
  PlatformFees({
    this.amount,
    this.payee,
  });

  factory PlatformFees.fromJson(Map<String, dynamic> json) =>
      _$PlatformFeesFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformFeesToJson(this);

  final AmountWithCurrencyCode? amount;
  final Payee? payee;
}

enum DisbursementMode {
  INSTANT,
  DELAYED,
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class AmountWithCurrencyCode {
  AmountWithCurrencyCode({
    this.currencyCode,
    this.value,
    this.breakdown,
  });

  factory AmountWithCurrencyCode.fromJson(Map<String, dynamic> json) =>
      _$AmountWithCurrencyCodeFromJson(json);

  Map<String, dynamic> toJson() => _$AmountWithCurrencyCodeToJson(this);

  final String? currencyCode;
  final String? value;
  final AmountWithBreakdown? breakdown;
}

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class AmountWithBreakdown {
  AmountWithBreakdown({
    this.itemTotal,
    this.taxTotal,
    this.shipping,
    this.shippingDiscount,
    this.insurance,
    this.handling,
    this.discount,
  });

  factory AmountWithBreakdown.fromJson(Map<String, dynamic> json) =>
      _$AmountWithBreakdownFromJson(json);

  Map<String, dynamic> toJson() => _$AmountWithBreakdownToJson(this);

  final AmountWithCurrencyCode? itemTotal;
  final AmountWithCurrencyCode? taxTotal;
  final AmountWithCurrencyCode? shipping;
  final AmountWithCurrencyCode? shippingDiscount;
  final AmountWithCurrencyCode? insurance;
  final AmountWithCurrencyCode? handling;
  final AmountWithCurrencyCode? discount;
}
