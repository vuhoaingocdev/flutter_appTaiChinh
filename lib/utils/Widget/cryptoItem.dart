import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CryptoItem extends StatelessWidget {
  final String name;
  final String price;
  final String change;
  final String value;

  const CryptoItem({
    super.key,
    required this.name,
    required this.price,
    required this.change,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = change.startsWith('+');
    final bgColor = isPositive ? Colors.green : Colors.red;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        value,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 90,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        change,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CryptoList extends StatefulWidget {
  const CryptoList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _cryptoListState createState() => _cryptoListState();
}

// ignore: camel_case_types
class _cryptoListState extends State<CryptoList> {
  // Danh sách crypto item
  final List<Map<String, String>> cryptoItems = [
    {
      'name': 'BNB',
      'price': '602.74',
      'change': '+0.43%',
      'value': 'đ15,409,662.89',
    },
    {
      'name': 'BTC',
      'price': '81,841.99',
      'change': '-0.52%',
      'value': 'đ2,092,373,953.17',
    },
    {
      'name': 'ETH',
      'price': '1,812.34',
      'change': '+0.96%',
      'value': 'đ46,334,320.68',
    },
    {
      'name': 'SOL',
      'price': '126.03',
      'change': '+1.92%',
      'value': 'đ3,222,085.5',
    },
    {
      'name': 'XRP',
      'price': '2.0985',
      'change': '-1.16%',
      'value': 'đ53,650.29',
    },
    {
      'name': 'PEPE',
      'price': '0.00000702',
      'change': '+1.89%',
      'value': 'đ0.17947346',
    },
  ];

  // Biến kiểm tra xem danh sách có mở rộng hay không
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    // Nếu chưa mở rộng, chỉ hiển thị 5 item đầu tiên
    final displayedItems =
        isExpanded ? cryptoItems : cryptoItems.take(5).toList();

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: displayedItems.length,
              itemBuilder: (context, index) {
                final item = displayedItems[index];
                return CryptoItem(
                  name: item['name']!,
                  price: item['price']!,
                  change: item['change']!,
                  value: item['value']!,
                );
              },
            ),
          ),
          if (!isExpanded && cryptoItems.length > 5)
            TextButton(
              onPressed: () {
                setState(() {
                  isExpanded = true;
                });
              },
              child: Text(
                appLocalizations.seeMore,
                style: const TextStyle(color: Colors.red, fontSize: 15),
              ),
            ),
        ],
      ),
    );
  }
}
