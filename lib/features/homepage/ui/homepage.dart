import 'package:flutter/material.dart';
import '../../../data/contact_data/contact_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedIndex = -1;
  final _formKey = GlobalKey<FormState>();
  TextEditingController contactName = TextEditingController();
  TextEditingController contactPhone = TextEditingController();
  List<ContactData> contact = List.empty(growable: true);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: const Text("Contact"),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.menu)),
            actions: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.search))
            ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Add New Contact", 
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Name cannot be empty';
                        }
                        return null;
                      },
                      controller: contactName,
                      keyboardType: TextInputType.name,
                      maxLength: 20,
                      decoration: InputDecoration( 
                        labelText: "Name",
                        hintText: "Name",
                        prefixIcon: const Icon(
                          Icons.person, 
                          color: Colors.blue),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Phone number cannot be empty';
                        }
                        return null;
                      },
                      controller: contactPhone,
                      keyboardType: TextInputType.number,
                      maxLength: 12,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "Phone Number",
                        prefixIcon: const Icon(
                          Icons.phone, 
                          color: Colors.blue),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 80,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              )
                            ),
                            onPressed: (){
                              String name = contactName.text;
                              String phone = contactPhone.text;

                              if (_formKey.currentState!.validate()) {
                                if(name.isNotEmpty && phone.isNotEmpty){
                                  setState(() {
                                    contactName.text = "";
                                    contactPhone.text = "";
                                    contact.add(ContactData(name: name, phone: phone));
                                  });
                              }
                              }
                            }, 
                            child: const Text("Save")),
                        ),
                        SizedBox(
                          height: 40,
                          width: 80,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              )
                            ),
                            onPressed: (){
                              String name = contactName.text;
                              String phone = contactPhone.text;

                              if (_formKey.currentState!.validate()) {
                                if(name.isNotEmpty && phone.isNotEmpty){
                                  setState(() {
                                    contactName.text = "";
                                    contactPhone.text = "";
                                    contact[selectedIndex].name = name;
                                    contact[selectedIndex].phone = phone;
                                    selectedIndex = -1;
                                  });
                                }
                              }
                            }, 
                            child: const Text("Update")),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 30),
                      child: const Text(
                        "List Contact",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        )
                      )
                    )
                  ],
                ),
              ),  
            ),
            contact.isEmpty 
            ? const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "No contact yet",
                style: TextStyle(
                  fontSize: 22)),
            )
            : Expanded(
              child: Container(         
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: contact.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => contactBuilder(index)),
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget contactBuilder(int index) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: SizedBox(
        height: 80,
        width: 50,
        child: ElevatedButton(    
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(left: 5),
            backgroundColor: Colors.blue[100],
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10))           
          ),
          onPressed: (){},
          child: ListTile(
            leading: CircleAvatar(
            backgroundColor: Colors.blue,
            maxRadius: 25,
            child: Text(
              contact[index].name[0].toString().toUpperCase(), 
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white)),
            ),
            title: Text(
              contact[index].name, 
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500)),
            subtitle: Text(
              contact[index].phone, 
              style: const TextStyle(fontSize: 16)),
            trailing: SizedBox(
              width: 96,
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){
                      contactName.text = contact[index].name;
                      contactPhone.text = contact[index].phone;
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    icon: const Icon(Icons.edit)),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        contact.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}