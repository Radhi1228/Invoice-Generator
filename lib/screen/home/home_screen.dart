import 'dart:io';
import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade300,
        title: const Text(
          "Create Your Invoice",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'invoice');
              },
              icon: const Icon(
                Icons.download_outlined,
                color: Colors.white,
              ))
        ],
      ),//create your invoice 2 scr
      body: Column(
          children: List.generate(
              productList.length,
              (index) => Container(
                  height: 150,
                  width: 500,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green.shade200),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: Image.file(File(productList[index]['image'])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productList[index]['name'],
                              style: const TextStyle(fontSize: 25),
                            ),
                            //const SizedBox(height: 15),
                            Text(
                              productList[index]['price'],
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              ' Total Price ₹${productList[index]['total']}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  productList.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete)),
                        ],
                      )
                    ],
                    // Text(productList[index]['total'] ),
                  ),
              ),
          ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton.extended(
          label: Text("Add Your Item Details"),
          icon: Icon(Icons.add_box),
          backgroundColor: Colors.green.shade100,
          onPressed: (){
            Navigator.pushNamed(context, "product")
                .then((value)
            {setState(() {});});
          },
        ),
      ),
    );
  }
}
