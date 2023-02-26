import 'package:flutter/material.dart';
import '../../../data/contact_data/contact_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final ContactData contact = ContactData();

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
            Expanded(
              child: Container(         
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: contact.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
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
                              borderRadius: BorderRadius.circular(10)),           
                          ),
                          onPressed: (){},
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                              maxRadius: 25,
                              child: Text(
                                contact.getUsernameContactData()[index][0].toString().toUpperCase(), 
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white),
                              ),
                            ),
                            title: Text(contact.getUsernameContactData()[index],
                            style: const TextStyle(
                              fontSize: 18),
                            ),
                            subtitle: Text(contact.getPhoneContactData()[index],
                            style: const TextStyle(
                              fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              ),
            ),
          ],
        ),
      )
    );
  }
}