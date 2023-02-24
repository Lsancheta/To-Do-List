import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({key}):super(key:key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _AddTaskAlertDialogState extends AlertDialog{
  @override
  Widget build(BuildContext context){
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      scrollable: true,
      title: const Text(
        'Nova Tarefa',
        textAlign:TextAlign.center,
        style: TextStyle(fontSize:16, color: Colors.brown),
      ),
      content: SizedBox(
        height: height * 0.35,
        width: width,
        child: Form(
          child:Column(
            children:<Widget>[
              TextFormField(
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal:20,
                    vertical: 20,
                  ),
                  hintText: 'Tarefa',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(Icons.list_alt_outlined,
                      color:Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                keyboardType:TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(fontSize:14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText:'Descrição',
                  hintStyle: const TextStyle(fontSize:14),
                  icon: const Icon(Icons.chat_bubble_rounded,
                      color:Colors.brown),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: const <Widget>[
                  Icon(Icons.tag, color: Colors.brown),
                  SizedBox(width: 15.0),
                  //TaskTags(),
                ],
              ),
            ],
          ),
        ),
      ),
      actions:[
        ElevatedButton(
          onPressed:(){},
          style: ElevatedButton.styleFrom(
            backgroundColor:Colors.grey,
          ),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed:(){},
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('To-Do List'),
          centerTitle:true,
          actions:[
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.calendar_month_outlined),
            )
          ],
        ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:FloatingActionButton(
        onPressed:(){
          const AlertDialog();
        },
        child:const Icon(Icons.add_circle_outline),
      ),
      bottomNavigationBar:BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin:5.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child:BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white38,
            selectedItemColor:Colors.white,
            unselectedItemColor:Colors.black,
            onTap:(index){
              setState((){
              });
              },
            items:const[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label:'',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_add_outlined),
                label:'',
              ),
            ],
          ),
        ),

      ),
    );
  }
}

class Home extends StatelessWidget{
  const Home({super.key});
  @override
  Widget build(context){
    return const Text('Home');
  }
}
class Profile extends StatelessWidget{
  const Profile({super.key});
  @override
Widget build(context){
    return const Text('Profile');
}
}

