import 'package:flutter/material.dart';
import 'package:porownywarka_ekip/obliczenia.dart';
import 'dart:math';

// jkjkjh
//sks
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Wyboru ekipy monterskiej',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Kalkulator Wyboru ekipy monterskiej'),
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
  var blachotrapez = true;
  var grunt = false;
  var reszta = false;
  var ileDniSlider = 1.00;
  var ileDniSliderString = '1';
  var mocInstalacji = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Moc instalacji: ',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 90,
                width: 150,
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.top,
                  style: const TextStyle(fontSize: 40, color: Colors.blue),
                  onChanged: (value) {
                    setState(() {
                      mocInstalacji = double.parse(value.toLowerCase());
                      przeliczWsio(ileDniSlider, mocInstalacji, grunt, reszta);
                      print(mocInstalacji);
                    });
                  },
                ),
              ),
              Text(
                'kWp',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          Text(
            '* używać . zamiast przecinka bo nie problemy będą',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Konstrukcja:',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  title: const Text("Blachotrapez"),
                  value: blachotrapez,
                  onChanged: (newValue) {
                    setState(() {
                      blachotrapez = newValue!;
                      grunt = false;
                      reszta = false;
                      przeliczWsio(ileDniSlider, mocInstalacji, grunt, reszta);
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: const Text("Grunt"),
                  value: grunt,
                  onChanged: (newValue) {
                    setState(() {
                      grunt = newValue!;
                      blachotrapez = false;
                      reszta = false;
                      przeliczWsio(ileDniSlider, mocInstalacji, grunt, reszta);
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  title: const Text("Reszta"),
                  value: reszta,
                  onChanged: (newValue) {
                    setState(() {
                      reszta = newValue!;
                      grunt = false;
                      blachotrapez = false;
                      przeliczWsio(ileDniSlider, mocInstalacji, grunt, reszta);
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Ile dni zajmie montaż: $ileDniSliderString',
            style: Theme.of(context).textTheme.headline4,
          ),
          Container(
            width: 700,
            child: Slider(
              value: ileDniSlider,
              min: 1,
              max: 14,
              divisions: 14,
              label: ileDniSlider.round().toString(),
              onChanged: (double value) {
                setState(() {
                  ileDniSlider = value;
                  ileDniSliderString = value.round().toString();
                  przeliczWsio(ileDniSlider, mocInstalacji, grunt, reszta);
                });
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.blue,
            thickness: 4,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Ekipa Daniela',
                    style: TextStyle(fontSize: 33),
                  ),
                  Text('$nettoDaniel', style: TextStyle(fontSize: 18)),
                  const Text('zł netto'),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Ekipa Kamila',
                    style: TextStyle(fontSize: 33),
                  ),
                  Text('$nettoKamil', style: TextStyle(fontSize: 18)),
                  const Text('zł netto'),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Ekipa Janusza',
                    style: TextStyle(fontSize: 33),
                  ),
                  Text('$nettoJanusz', style: TextStyle(fontSize: 18)),
                  const Text('zł netto'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
