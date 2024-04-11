import 'dart:io';

import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List todoList = [];
  String singleValue = "";
  String errorText = "";

  void addString(content) {
    setState(() {
      singleValue = content;
      if (singleValue.isEmpty) {
        errorText = "សូមបញ្ចូលអក្សរ";
      }
    });
  }

  void addList() {
    setState(() {
      todoList.add({'value': singleValue});
    });
  }

  void deleteItem(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ត្រូវធ្វើ"),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 90,
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.grey[200],
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 5,
                                child: Text(
                                  todoList[index]['value'].toString(),
                                )),
                            Expanded(
                                child: TextButton(
                              onPressed: () {
                                deleteItem(index);
                              },
                              child: Icon(Icons.delete, color: Colors.red[300]),
                            )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                        flex: 70,
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            onChanged: (content) {
                              addString(content);
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Colors.grey[200],
                                filled: true,
                                labelText: "Create Text",
                                labelStyle: TextStyle(color: Colors.grey[700]),
                                errorText:
                                    errorText.isNotEmpty ? errorText : null),
                          ),
                        )),
                    const Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: 10,
                        )),
                    Expanded(
                        flex: 27,
                        child: ElevatedButton(
                          onPressed: () {
                            addList();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[600],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Container(
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: const Text(
                                "Add",
                                style: TextStyle(color: Colors.white),
                              )),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
