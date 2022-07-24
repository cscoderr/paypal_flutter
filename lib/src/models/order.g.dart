// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      intent: $enumDecodeNullable(_$IntentsEnumMap, json['intent']),
      purchaseUnits: (json['purchase_units'] as List<dynamic>?)
          ?.map((e) => PurchaseUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      payer: json['payer'] == null
          ? null
          : Payer.fromJson(json['payer'] as Map<String, dynamic>),
      applicationContext: json['application_context'] == null
          ? null
          : ApplicationContext.fromJson(
              json['application_context'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'intent': _$IntentsEnumMap[instance.intent],
      'purchase_units': instance.purchaseUnits?.map((e) => e.toJson()).toList(),
      'payer': instance.payer?.toJson(),
      'application_context': instance.applicationContext?.toJson(),
      'status': _$StatusEnumMap[instance.status],
      'message': instance.message,
    };

const _$IntentsEnumMap = {
  Intents.CAPTURE: 'CAPTURE',
  Intents.AUTHORIZE: 'AUTHORIZE',
};

const _$StatusEnumMap = {
  Status.success: 'success',
  Status.error: 'error',
};

ApplicationContext _$ApplicationContextFromJson(Map<String, dynamic> json) =>
    ApplicationContext(
      applicationContext: json['application_context'] as String?,
      cancelUrl: json['cancel_url'] as String?,
      brandName: json['brand_name'] as String?,
      locale: json['locale'] as String?,
      returnUrl: json['return_url'] as String?,
      landingPage:
          $enumDecodeNullable(_$LandingPageEnumMap, json['landing_page']),
      userAction: $enumDecodeNullable(_$UserActionEnumMap, json['user_action']),
    );

Map<String, dynamic> _$ApplicationContextToJson(ApplicationContext instance) =>
    <String, dynamic>{
      'application_context': instance.applicationContext,
      'cancel_url': instance.cancelUrl,
      'brand_name': instance.brandName,
      'locale': instance.locale,
      'return_url': instance.returnUrl,
      'landing_page': _$LandingPageEnumMap[instance.landingPage],
      'user_action': _$UserActionEnumMap[instance.userAction],
    };

const _$LandingPageEnumMap = {
  LandingPage.LOGIN: 'LOGIN',
  LandingPage.BILLING: 'BILLING',
  LandingPage.NO_PREFERENCE: 'NO_PREFERENCE',
};

const _$UserActionEnumMap = {
  UserAction.CONTINUE: 'CONTINUE',
  UserAction.PAY_NOW: 'PAY_NOW',
};

Payer _$PayerFromJson(Map<String, dynamic> json) => Payer(
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      emailAddress: json['email_address'] as String?,
      birthDate: json['birth_date'] as String?,
      payerId: json['payer_id'] as String?,
    );

Map<String, dynamic> _$PayerToJson(Payer instance) => <String, dynamic>{
      'name': instance.name?.toJson(),
      'email_address': instance.emailAddress,
      'birth_date': instance.birthDate,
      'payer_id': instance.payerId,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      givenName: json['given_name'] as String?,
      surname: json['surname'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'given_name': instance.givenName,
      'surname': instance.surname,
    };

PurchaseUnit _$PurchaseUnitFromJson(Map<String, dynamic> json) => PurchaseUnit(
      amount: json['amount'] == null
          ? null
          : AmountWithCurrencyCode.fromJson(
              json['amount'] as Map<String, dynamic>),
      referenceId: json['reference_id'] as String?,
      customId: json['custom_id'] as String?,
      description: json['description'] as String?,
      invoiceId: json['invoice_id'] as String?,
      softDescriptor: json['soft_descriptor'] as String?,
      payee: json['payee'] == null
          ? null
          : Payee.fromJson(json['payee'] as Map<String, dynamic>),
      paymentInstruction: json['payment_instruction'] == null
          ? null
          : PaymentInstruction.fromJson(
              json['payment_instruction'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => PurchaseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      payments: json['payments'] == null
          ? null
          : PurchaseItem.fromJson(json['payments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PurchaseUnitToJson(PurchaseUnit instance) =>
    <String, dynamic>{
      'amount': instance.amount?.toJson(),
      'reference_id': instance.referenceId,
      'custom_id': instance.customId,
      'description': instance.description,
      'invoice_id': instance.invoiceId,
      'soft_descriptor': instance.softDescriptor,
      'payee': instance.payee?.toJson(),
      'payment_instruction': instance.paymentInstruction?.toJson(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'payments': instance.payments?.toJson(),
    };

Payments _$PaymentsFromJson(Map<String, dynamic> json) => Payments(
      authorizations: json['authorizations'] as Map<String, dynamic>?,
      captures: json['captures'] as Map<String, dynamic>?,
      refunds: json['refunds'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PaymentsToJson(Payments instance) => <String, dynamic>{
      'authorizations': instance.authorizations,
      'captures': instance.captures,
      'refunds': instance.refunds,
    };

PurchaseItem _$PurchaseItemFromJson(Map<String, dynamic> json) => PurchaseItem(
      name: json['name'] as String?,
      quantity: json['quantity'] as String?,
      unitAmount: json['unit_amount'] == null
          ? null
          : AmountWithCurrencyCode.fromJson(
              json['unit_amount'] as Map<String, dynamic>),
      tax: json['tax'] == null
          ? null
          : AmountWithCurrencyCode.fromJson(
              json['tax'] as Map<String, dynamic>),
      description: json['description'] as String?,
      sku: json['sku'] as String?,
      category: $enumDecodeNullable(_$CategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$PurchaseItemToJson(PurchaseItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'unit_amount': instance.unitAmount?.toJson(),
      'tax': instance.tax?.toJson(),
      'description': instance.description,
      'sku': instance.sku,
      'category': _$CategoryEnumMap[instance.category],
    };

const _$CategoryEnumMap = {
  Category.PHYSICAL_GOODS: 'PHYSICAL_GOODS',
  Category.DIGITAL_GOODS: 'DIGITAL_GOODS',
  Category.DONATION: 'DONATION',
};

Payee _$PayeeFromJson(Map<String, dynamic> json) => Payee(
      merchantId: json['merchant_id'] as String?,
      emailAddress: json['email_address'] as String?,
    );

Map<String, dynamic> _$PayeeToJson(Payee instance) => <String, dynamic>{
      'merchant_id': instance.merchantId,
      'email_address': instance.emailAddress,
    };

PaymentInstruction _$PaymentInstructionFromJson(Map<String, dynamic> json) =>
    PaymentInstruction(
      platformFees: (json['platform_fees'] as List<dynamic>?)
          ?.map((e) => PlatformFees.fromJson(e as Map<String, dynamic>))
          .toList(),
      disbursementMode: $enumDecodeNullable(
          _$DisbursementModeEnumMap, json['disbursement_mode']),
    );

Map<String, dynamic> _$PaymentInstructionToJson(PaymentInstruction instance) =>
    <String, dynamic>{
      'platform_fees': instance.platformFees?.map((e) => e.toJson()).toList(),
      'disbursement_mode': _$DisbursementModeEnumMap[instance.disbursementMode],
    };

const _$DisbursementModeEnumMap = {
  DisbursementMode.INSTANT: 'INSTANT',
  DisbursementMode.DELAYED: 'DELAYED',
};

PlatformFees _$PlatformFeesFromJson(Map<String, dynamic> json) => PlatformFees(
      amount: json['amount'] == null
          ? null
          : AmountWithCurrencyCode.fromJson(
              json['amount'] as Map<String, dynamic>),
      payee: json['payee'] == null
          ? null
          : Payee.fromJson(json['payee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlatformFeesToJson(PlatformFees instance) =>
    <String, dynamic>{
      'amount': instance.amount?.toJson(),
      'payee': instance.payee?.toJson(),
    };

AmountWithCurrencyCode _$AmountWithCurrencyCodeFromJson(
        Map<String, dynamic> json) =>
    AmountWithCurrencyCode(
      currencyCode: json['currency_code'] as String?,
      value: json['value'] as String?,
      breakdown: json['breakdown'] == null
          ? null
          : AmountWithBreakdown.fromJson(
              json['breakdown'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AmountWithCurrencyCodeToJson(
        AmountWithCurrencyCode instance) =>
    <String, dynamic>{
      'currency_code': instance.currencyCode,
      'value': instance.value,
      'breakdown': instance.breakdown?.toJson(),
    };

AmountWithBreakdown _$AmountWithBreakdownFromJson(Map<String, dynamic> json) =>
    AmountWithBreakdown(
      itemTotal: json['item_total'] == null
          ? null
          : AmountWithCurrencyCode.fromJson(
              json['item_total'] as Map<String, dynamic>),
      taxTotal: json['tax_total'] == null
          ? null
          : AmountWithCurrencyCode.fromJson(
              json['tax_total'] as Map<String, dynamic>),
      shipping: json['shipping'] == null
          ? null
          : AmountWithCurrencyCode.fromJson(
              json['shipping'] as Map<String, dynamic>),
      shippingDiscount: json['shipping_discount'] == null
          ? null
          : AmountWithCurrencyCode.fromJson(
              json['shipping_discount'] as Map<String, dynamic>),
      insurance: json['insurance'] == null
          ? null
          : AmountWithCurrencyCode.fromJson(
              json['insurance'] as Map<String, dynamic>),
      handling: json['handling'] == null
          ? null
          : AmountWithCurrencyCode.fromJson(
              json['handling'] as Map<String, dynamic>),
      discount: json['discount'] == null
          ? null
          : AmountWithCurrencyCode.fromJson(
              json['discount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AmountWithBreakdownToJson(
        AmountWithBreakdown instance) =>
    <String, dynamic>{
      'item_total': instance.itemTotal?.toJson(),
      'tax_total': instance.taxTotal?.toJson(),
      'shipping': instance.shipping?.toJson(),
      'shipping_discount': instance.shippingDiscount?.toJson(),
      'insurance': instance.insurance?.toJson(),
      'handling': instance.handling?.toJson(),
      'discount': instance.discount?.toJson(),
    };
