import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/global.dart';
import 'package:invoice_generator/utils/pdf_help.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}
class _InvoiceScreenState extends State<InvoiceScreen> {
  DateTime time = DateTime.now();
  bool aso = true;
  int i = 0;
  int last = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      time = DateTime.now();
    });
    getTime();
    for (i = 0; i < productList.length; i++) {
      // last = last + int.parse('${productList[i]['total']}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade300,
          title: Text("Invoice"),
          actions: [
            IconButton(onPressed: (){
              pdfHelp(time, last);
            }, icon: Icon(Icons.download),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Invoice List",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date : ${time.day}/${time.month}/${time.year}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Customer Name : $name",
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Time : ${time.hour}:${time.minute}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Address : $add",
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Divider(
                thickness: 2,
                color: Colors.black,
              ),
              const SizedBox(height: 5,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "No",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Quan",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Total Price",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  children: List.generate(
                      productList.length,
                      (index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "$index",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                productList[index]['name'],
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                productList[index]['price'],
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                productList[index]['quan'],
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                '${productList[index]['total']}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 25),
                            ],
                          )),
                ),
              ),
              const Divider(thickness: 2),
              // Expanded(child: )
              const Padding(
                padding: EdgeInsets.all(8.0),
                // child: Text(
                //   "Total Amount : $last",
                //   style: TextStyle(fontSize: 25),
                // ),
              )
            ],
          ),
        )
    );
  }
}
void getTime() {
  Future.delayed(
    const Duration(seconds: 1),
    () {
      getTime();
    },
  );
}
