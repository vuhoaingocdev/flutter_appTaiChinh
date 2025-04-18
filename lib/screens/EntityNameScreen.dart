import 'package:app_taichinh/provider/entityNameScreen_provider.dart';
import 'package:app_taichinh/screens/accountNameScreen.dart';
import 'package:app_taichinh/screens/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class entitynamescreen extends StatefulWidget {
  const entitynamescreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HandleEntitynamescreen();
  }
}

class HandleEntitynamescreen extends State<entitynamescreen> {
  late TextEditingController nameController;
  @override
  void initState() {
    super.initState();
    final entityNameScreenProvider =
        Provider.of<EntityNameScreenProvider>(context, listen: false);

    nameController = TextEditingController(text: entityNameScreenProvider.name);

    nameController.addListener(() {
      entityNameScreenProvider.updateName(nameController.text);
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final entityNameScreenProvider =
        Provider.of<EntityNameScreenProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nhập tên pháp nhân của bạn',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text('Tên pháp nhân', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Email/Số điện thoại (không có mã quốc gia)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  suffixIcon: nameController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear_outlined),
                          onPressed: () {
                            entityNameScreenProvider.clearName();
                            nameController.clear();
                          },
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const accountNamescreen()),
                    );
                  },
                  child: const Text(
                    'Tiếp theo',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Đăng ký với tư cách là một pháp nhân ',
                        style: const TextStyle(color: Colors.orange),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const entitynamescreen()),
                            );
                          },
                      ),
                      const TextSpan(text: 'hoặc '),
                      TextSpan(
                        text: 'Đăng nhập',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
