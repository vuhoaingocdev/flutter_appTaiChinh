import 'package:app_taichinh/utils/Widget/categoryButton.dart';
import 'package:app_taichinh/utils/Widget/crypoItemThiTruong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThiTruongScreen extends StatefulWidget {
  const ThiTruongScreen({super.key});

  @override
  State<ThiTruongScreen> createState() => _ThiTruongScreenState();
}

class _ThiTruongScreenState extends State<ThiTruongScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryButton(
                    label: 'Tất cả',
                    index: 0,
                    isSelected: selectedIndex == 0,
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  CategoryButton(
                    label: 'Tài sản',
                    index: 1,
                    isSelected: selectedIndex == 1,
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                  CategoryButton(
                    label: 'Giao ngay',
                    index: 2,
                    isSelected: selectedIndex == 2,
                    onPressed: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                  CategoryButton(
                    label: 'Futures',
                    index: 3,
                    isSelected: selectedIndex == 3,
                    onPressed: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                  ),
                  CategoryButton(
                    label: 'Quyền chọn',
                    index: 4,
                    isSelected: selectedIndex == 4,
                    onPressed: () {
                      setState(() {
                        selectedIndex = 4;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          //Table biến động thị trường
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Text(
                          'Tên / KL',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.swap_vert, size: 16, color: Colors.grey),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Text(
                          'Giá gần nhất',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.swap_vert, size: 16, color: Colors.grey),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      appLocalizations.volatility,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const ShowCryptoItemList()
        ],
      ),
    );
  }
}
