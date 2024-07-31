import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
 
class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);
 
  @override
  State<InsertData> createState() => _InsertDataState();
}
 
class _InsertDataState extends State<InsertData> {
  
  final  userNameController = TextEditingController();
  final  userJobController= TextEditingController();
 
  late DatabaseReference dbRef;
 
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Students');
  }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserting data'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Inserting data in Firebase Realtime Database',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Your Name',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userJobController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Job',
                  hintText: 'Enter Your Job',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  Map<String, String> students = {
                    'name': userNameController.text,
                    'job': userJobController.text,
                  };
 
                  dbRef.push().set(students);
 
                },
                child: const Text('Insert Data'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}