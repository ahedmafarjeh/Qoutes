import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Qoutes(),
    );
  }
}

class Qoutes extends StatefulWidget {
  const Qoutes({super.key});

  @override
  State<Qoutes> createState() => _QoutesState();
}

class BestQuotes {
  String title;
  String author;
  BestQuotes({required this.title, required this.author});
}

class _QoutesState extends State<Qoutes> {
  final qouteController = TextEditingController();
  final authorController = TextEditingController();

  List AllQuotes = [
    BestQuotes(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(
        author: "Ali 7assan", title: "العقل السليم في البعد عن الحريم 😂"),
    BestQuotes(
        author: "Ali Elrayek",
        title: "كُتر التفكير فى الى ضااااع هيعمل لك فى دماغك صادااااع  😉 "),
    BestQuotes(
        author: "ELRAYEK",
        title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
  ];
  deleteQoute(BestQuotes item) {
    setState(() {
      AllQuotes.remove(item);
    });
  }

  addQoute() {
    setState(() {
      AllQuotes.add(BestQuotes(
          title: qouteController.text, author: authorController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                color: Colors.amber[100],
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      maxLength: 20,
                      controller: qouteController,
                      decoration: InputDecoration(hintText: "الاقتباس"),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextField(
                      maxLength: 20,
                      controller: authorController,
                      decoration: InputDecoration(hintText: "القائل"),
                    ),
                      SizedBox(
                      height: 25,
                    ),
                    TextButton(
                        onPressed: () {
                          addQoute();
                          Navigator.pop(context);
                        },
                        child: Text("ADD",
                        style: TextStyle(fontSize: 40)),
                        )
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
        shape: CircleBorder(),
      ),
      appBar: AppBar(
        title: Text(
          "Best Quotes",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        backgroundColor: Color.fromARGB(255, 57, 66, 151),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: // we delete [] for children, because AllQuotes.map (...).toList()
              // return list so it become [QCard,QCard,QCard,....]
              AllQuotes.map((item) => QCard(
                    item: item,
                    delete: deleteQoute,
                  )).toList(),
        ),
      ),
    );
  }
}
