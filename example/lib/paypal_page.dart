import 'package:flutter/material.dart';
import 'package:paypal_flutter/paypal_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaypalPage extends StatefulWidget {
  const PaypalPage({Key? key, required this.accesToken}) : super(key: key);

  final String accesToken;

  @override
  State<PaypalPage> createState() => _PaypalPageState();
}

class _PaypalPageState extends State<PaypalPage> {
  final paypal = PaypalFlutter(
      clientId:
          'AUv8rrc_P-EbP2E0mpb49BV7rFt3Usr-vdUZO8VGOnjRehGHBXkSzchr37SYF2GNdQFYSp72jh5QUhzG',
      clientSecret:
          'EMnAWe06ioGtouJs7gLYT9chK9-2jJ--7MKRXpI8FesmY_2Kp-d_7aCqff7M9moEJBvuXoBO4clKtY0v');

  String? checkoutUrl;

  Future<void> createOrder() async {
    final response = await paypal.createOrder(
      accessToken: widget.accesToken,
      order: Order(
        intent: Intents.CAPTURE,
        purchaseUnits: [
          PurchaseUnit(
            items: [
              PurchaseItem(
                name: 'T-shirt',
                description: 'Green XL',
                quantity: "1",
                unitAmount: AmountWithCurrencyCode(
                    currencyCode: 'USD', value: '100.00'),
              ),
            ],
            amount: AmountWithCurrencyCode(
              currencyCode: 'USD',
              value: '100.00',
              breakdown: AmountWithBreakdown(
                itemTotal: AmountWithCurrencyCode(
                  currencyCode: 'USD',
                  value: '100.00',
                ),
              ),
            ),
          ),
        ],
        applicationContext: ApplicationContext(
          returnUrl: 'https://example.com/return',
          cancelUrl: 'https://example.com/cancel',
        ),
      ),
    );

    checkoutUrl =
        response.links!.where((element) => element.rel == 'approve').first.href;
  }

  @override
  void initState() {
    createOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(checkoutUrl);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paypal'),
      ),
      body: SafeArea(
          child: WebView(
        initialUrl: checkoutUrl,
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}
