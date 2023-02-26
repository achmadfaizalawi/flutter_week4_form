import 'package:flutter/material.dart';
import 'package:flutter_contact_application/data/contact_data/contact_data.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({super.key});

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  
  final ContactData contact = ContactData();
  final _formKey = GlobalKey<FormState>();
  final myControllerName = TextEditingController();
  final myControllerPhoneNumber = TextEditingController();

  @override
  void dispose() {
    myControllerName.dispose();
    myControllerPhoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("Create New Contact"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Name';
                  }
                  return null;
                },
                controller: myControllerName,
                decoration: InputDecoration(
                labelText: "Name",
                hintText: "Name",
                hintStyle: TextStyle(
                  color: Colors.blue[200]
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                prefixIcon: const Icon(Icons.person),
                prefixIconColor: Colors.blue
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Phone Number';
                  } 
                  return null;
                },
                controller: myControllerPhoneNumber,
                decoration: InputDecoration(
                labelText: "Phone Number",
                hintText: "Phone Number",
                hintStyle: TextStyle(
                  color: Colors.blue[200]
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                prefixIcon: const Icon(Icons.phone),
                prefixIconColor: Colors.blue
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 70,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    )
                  ),
                  onPressed: (){
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                      contact.addDataUserName(myControllerName.text);
                      contact.addDataPhone(myControllerPhoneNumber.text);
                    }  
                    });
                    myControllerName.clear();
                    myControllerPhoneNumber.clear();          
                  }, 
                  child: const Text(
                    "CREATE CONTACT",
                    style: TextStyle(
                      fontSize: 16
                    ),
                    )
                ),
              )
            ],
          )),
      )
    );
  }
}