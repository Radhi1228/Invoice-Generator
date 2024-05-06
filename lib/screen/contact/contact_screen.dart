import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/global.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}
class _ContactScreenState extends State<ContactScreen> {

  TextEditingController txtName = TextEditingController();
  TextEditingController txtNumber = TextEditingController();
  TextEditingController txtAdd = TextEditingController();
  TextEditingController txtPin = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.green.shade300,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Container(),
              ),
              title: const Text("Details of User",
                style: TextStyle(color: Colors.white),),
            ),//1st screen
            backgroundColor: Colors.white,
            body: 
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child:
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                     Text(
                      "UserName",
                      style: TextStyle(fontSize: 20,color: Colors.green.shade600),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), label: Text("Enter UserName")),
                        controller: txtName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Mobile Number",
                      style: TextStyle(fontSize: 20,color: Colors.green.shade600),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Enter Your Mobile Number"),
                        ),
                        controller: txtNumber,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Mobile number is required";
                          } else if (value.length != 10) {
                            return "Enter valid number";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Address",
                      style: TextStyle(fontSize: 20,color: Colors.green.shade600),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), label: Text("Enter Your Address")),
                        controller: txtAdd,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Address is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "PinCode",
                      style: TextStyle(fontSize: 20,color: Colors.green.shade600),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), label: Text("Enter your Postcode")),
                        controller: txtPin,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "pinCode is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green.shade300,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            name = txtName.text;
                            number = txtNumber.text;
                            add = txtAdd.text;
                            Navigator.pushNamed(context, "home");
                          }
                          return null;
                        },
                        child: const Text(
                          "Log in",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}