import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Agregar elementos a un array y mostrarlos en una lista'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> itemList = [];

  // Controller para el campo de entrada
  TextEditingController _inputController = TextEditingController();

  void _addItemToList() {
    setState(() {
      // Obtiene el texto del campo de entrada y lo agrega a la lista
      String newItem = _inputController.text;
      if (newItem.isNotEmpty) {
        itemList.add(newItem);
        // Limpia el campo de entrada después de agregar el elemento
        _inputController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Campo de entrada para agregar elementos
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _inputController,
              decoration: InputDecoration(
                hintText: 'Ingrese un elemento',
              ),
            ),
          ),
          // Botón para agregar elementos
          ElevatedButton(
            onPressed: _addItemToList,
            child: const Text('Agregar'),
          ),
          // Lista para mostrar los elementos
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.green, // Fondo verde para cada elemento
                  child: ListTile(
                    title: Text(itemList[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
