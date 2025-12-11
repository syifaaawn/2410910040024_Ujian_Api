import 'package:flutter/material.dart';
import 'package:syifawahyuningsih_2410910040024_ujian_api/helper/todos_helper.dart';
import 'package:syifawahyuningsih_2410910040024_ujian_api/models/todos_model.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos Page"),
        backgroundColor: const Color.fromARGB(255, 116, 144, 243),
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: TodosHelper().getAllTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<TodosModel> todos = snapshot.data!;

            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(),
                  ),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        todos[index].completed == true
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: todos[index].completed == true
                            ? Colors.green
                            : Colors.red,
                        size: 30,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          todos[index].todo ?? "",
                          style: TextStyle(
                            fontSize: 16,
                            color: todos[index].completed == true
                                ? Colors.green
                                : Colors.black,
                            fontWeight: todos[index].completed == true
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Text("Tidak ada data");
        },
      ),
    );
  }
}
