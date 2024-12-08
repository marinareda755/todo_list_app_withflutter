import 'package:flutter/material.dart';
import 'package:todolistflutt/utilis/todo_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({super.key});
  List toDoList=[
    // ['Learn Web Development',false],
    // ['Drink cofee',false],

  ];
  final controller=TextEditingController();

  void checkBoxChanged(int index){
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });
  }
  void saveNewTask(){
    setState(() {
      toDoList.add([controller.text,false]);
      controller.clear();
    });
  }
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text('Todo List'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body:ListView.builder(itemCount:toDoList.length ,itemBuilder: (BuildContext context,index){
       return TodoList(
         taskName:toDoList[index][0] ,
         taskCompleted: toDoList[index][1],
         onChanged: (value)=>checkBoxChanged(index),
         deleteFunction: (context ) =>deleteTask(index),

       );
      }) ,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20
                  ),
                    child: TextField(
                      controller:controller ,
                      decoration:InputDecoration(
                        hintText: 'Add new todo item',
                        filled: true,
                        fillColor: Colors.deepPurple.shade200,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurple
                            ),
                            borderRadius: BorderRadius.circular(15),
                          )
                      ) ,
                    ))),
            FloatingActionButton(onPressed: saveNewTask,
            child: Icon(Icons.add),
            ),
          ],
        ),
      ),


    );
  }
}
