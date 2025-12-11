import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:syifawahyuningsih_2410910040024_ujian_api/models/todos_model.dart';

class TodosHelper {
  Future<List<TodosModel>> getAllTodos() async {
    var uri = Uri.parse("https://dummyjson.com/todos");
    var respon = await http.get(uri);

    if (respon.statusCode == 200) {
      var data = jsonDecode(respon.body);
      List<dynamic> hasil = data["todos"];
      return hasil.map((json) => TodosModel.fromJson(json)).toList();
    } else {
      throw Exception("Koneksi terganggu");
    }
  }
}
