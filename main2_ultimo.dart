import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}//=> runApp(const MyApp());


class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title:'To-Do List',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget{
  const MyHome({super.key});

  @override
  State<StatefulWidget> createState(){
    return MyHomeState();
  }
}
class MyHomeState extends State<MyHome>{
  final db = FirebaseFirestore.instance;
  final TextEditingController taskController =  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _task = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('To-Do List'),
            centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal:20, vertical:10),
        child: Column(
          children:<Widget>[
            Form(
              key: _formKey,
              child: Row(
                children:<Widget>[
                  Expanded(
                    child: TextFormField(
                      controller:taskController,
                      validator:(value){
                        if(value!.isEmpty){
                          return 'Task field it\'s required';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.black87,
                      ),//style do texto
                      decoration: const InputDecoration(
                        hintText: 'Type a new Task here',
                        hintStyle: TextStyle(
                          fontSize: 20,
                        )
                      ),//style do campo
                      keyboardType: TextInputType.text,// layout do teclado
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.only(left:20), //edgeinsets define onde esse espaçamento de margem vai ser feito
                      child: ElevatedButton(
                          child: const Text('Add', style:TextStyle(fontSize:20),),
                        onPressed:(){
                            if(_formKey.currentState!.validate()){
                              setState(() async {
                                DocumentReference docRef= await;
                                FirebaseFirestore.instance.collection('task').add();
                                final taskName = taskController.text;
                              });
                              taskController.clear();
                            }
                          },
                      )
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder:(context, index){
                  return Card(
                    child: ListTile(
                      title: Text(_task[index]),
                    ),
                  );
                },
                itemCount:_task.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
