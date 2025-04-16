import 'package:app_taichinh/utils/Widget/BieudoDuLieu/BieuDoDuLieu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomListItem extends StatelessWidget {
  final String name;
  final String price;
  final String change;
  final String value;
  final String numberPX;
  final String underName;

  const CustomListItem({
    super.key,
    required this.name,
    required this.price,
    required this.change,
    required this.value,
    required this.numberPX,
    required this.underName,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            ' /USDT',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            numberPX,
                            style: const TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ]),
                        Text(
                          underName,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    )),
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
                          horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(8),
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

class ShowCryptoItemList extends StatefulWidget {
  const ShowCryptoItemList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _cryptoListState createState() => _cryptoListState();
}

// ignore: camel_case_types
class _cryptoListState extends State<ShowCryptoItemList> {
  // Danh sách crypto item
  final List<Map<String, String>> cryptoItems = [
    {
      'name': 'BNB',
      'price': '602.74',
      'change': '+0.43%',
      'value': 'đ15,409,662.89',
      'numberPX': '10px',
      'underName': "5,69B"
    },
    {
      'name': 'BTC',
      'price': '81,841.99',
      'change': '-0.52%',
      'value': 'đ2,092,373,953.17',
      'numberPX': '10px',
      'underName': "5,69B"
    },
    {
      'name': 'ETH',
      'price': '1,812.34',
      'change': '+0.96%',
      'value': 'đ46,334,320.68',
      'numberPX': '10px',
      'underName': "5,69B"
    },
    {
      'name': 'SOL',
      'price': '126.03',
      'change': '+1.92%',
      'value': 'đ3,222,085.5',
      'numberPX': '10px',
      'underName': "5,69B"
    },
    {
      'name': 'XRP',
      'price': '2.0985',
      'change': '-1.16%',
      'value': 'đ53,650.29',
      'numberPX': '10px',
      'underName': "5,69B"
    },
    {
      'name': 'PEPE',
      'price': '0.00000702',
      'change': '+1.89%',
      'value': 'đ0.17947346',
      'numberPX': '10px',
      'underName': "5,69B"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    // Nếu chưa mở rộng, chỉ hiển thị 5 item đầu tiên
    final displayedItems = cryptoItems;

    return Expanded(
      child: ListView.builder(
        itemCount: displayedItems.length,
        itemBuilder: (context, index) {
          final item = displayedItems[index];
          return InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BieuDoDuLieu()),
              );
            },
            child: CustomListItem(
              name: item['name']!,
              price: item['price']!,
              change: item['change']!,
              value: item['value']!,
              numberPX: item['numberPX']!,
              underName: item['underName']!,
            ),
          );
        },
      ),
    );
  }
}
