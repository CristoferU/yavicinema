import 'package:flutter/material.dart';

import 'navbar.dart';

class Pago extends StatefulWidget {
  const Pago({Key? key}) : super(key: key);

  @override
  _PagoState createState() => _PagoState();
}

class _PagoState extends State<Pago> {
  int _counter = 0;
  int _total = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _total += 6;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
        _total -= 6;
        if (_total < 0) {
          _total = 0;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Boletos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Boletos:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Total a pagar:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_total.00',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('+'),
                ),
              ],
            ),
          ],
          
        ),
      ),
    );
  }
}
