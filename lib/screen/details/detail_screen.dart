import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_generator/utils/global.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtQua = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtDisc = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade300,
          title: const Text("Details Of Your Products",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(),
          ),
        ),//3 screen
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: CircleAvatar(
                        backgroundColor: Colors.green.shade100,
                        backgroundImage: FileImage(File("$path")),
                        radius: 75,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () async {
                            XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              path = image!.path;
                            });
                          },
                          icon: const Icon(Icons.add,color: Colors.white,),
                          style:  ButtonStyle(
                              backgroundColor:
                              MaterialStatePropertyAll(Colors.green.shade300)),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text("Product",
                  style: TextStyle(fontSize: 20,
                      color: Colors.green.shade600),
                ),
                SizedBox(height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Enter Product Name")),
                      controller: txtName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Product name is required";
                        }
                        return null;
                      },
                    )),
                const SizedBox(height: 10),
                 Text(
                  "Quantity",
                  style: TextStyle(fontSize: 20,
                      color: Colors.green.shade600),
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter Product Quantity",selectionColor: Colors.green),
                    ),
                    controller: txtQua,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Product quantity is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Price",
                  style: TextStyle(fontSize: 20,color: Colors.green.shade600),
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter Product Price"),
                    ),
                    controller: txtPrice,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Product price is required";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Product Discount",
                  style: TextStyle(fontSize: 20,color: Colors.green.shade600),
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("% discount"),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green.shade300,
                    ),
                    onPressed: () {
                      setState(() {
                        if (fromKey.currentState!.validate()) {
                          String name = txtName.text;
                          String? quan = txtQua.text;
                          String? price = txtPrice.text;
                          String? disc = txtDisc.text;

                          Map product = {
                            "image": path,
                            "name": name,
                            "quan": quan,
                            "price": price,
                            "dic": disc,
                            "total" : int.parse(quan)*int.parse(price),
                          };
                          productList.add(product);
                          Navigator.pop(context);
                        }
                        return null;
                      });
                    },
                    child: const Text(
                      "Save",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
