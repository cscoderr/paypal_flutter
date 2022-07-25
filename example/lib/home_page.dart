import 'package:flutter/material.dart';
import 'package:paypal_flutter/paypal_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AccessToken? _accessToken;

  final paypal = PaypalFlutter(
      clientId:
          'AUv8rrc_P-EbP2E0mpb49BV7rFt3Usr-vdUZO8VGOnjRehGHBXkSzchr37SYF2GNdQFYSp72jh5QUhzG',
      clientSecret:
          'EMnAWe06ioGtouJs7gLYT9chK9-2jJ--7MKRXpI8FesmY_2Kp-d_7aCqff7M9moEJBvuXoBO4clKtY0v');
  Future<void> getToken() async {
    final accesToken = await paypal.getAccessToken();
    _accessToken = accesToken;
  }

  Future<void> createOrder() async {
    final response = await paypal.createOrder(
      accessToken: _accessToken?.accessToken ?? '',
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
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => getToken(),
                child: const Text('Get Access Token'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_accessToken?.accessToken);
                },
                child: const Text('Check Access Token'),
              ),
              ElevatedButton(
                onPressed: () => createOrder(),
                child: const Text('Create Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
