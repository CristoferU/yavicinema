import 'package:flutter/material.dart';
import 'package:jaja/src/lit_starfield_container.dart';
import 'navbar.dart';

class Pago extends StatefulWidget {
  const Pago({Key? key}) : super(key: key);

  @override
  _PagoState createState() => _PagoState();
}

class _PagoState extends State<Pago> {
  int _counter = 0;
  int _total = 0;
  int _selectedSeats = 0;
  bool _canSelectSeats =
      false; // Variable para controlar la selección de asientos
  bool _showImage =
      false; // Variable para controlar la visibilidad de la imagen

  List<bool> _seats =
      List.filled(20, false); // Lista para controlar el estado de los asientos

  void _incrementCounter() {
    setState(() {
      _counter++;
      _total = _counter * 6;
      _canSelectSeats =
          true; // Permite seleccionar asientos al incrementar el contador
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _total = _counter * 6;
        if (_total < 0) {
          _total = 0;
        }
      }
      if (_counter == 0) {
        _canSelectSeats =
            false; // Deshabilita la selección de asientos si el contador llega a cero
      }
      _selectedSeats = 0; // Restablece la cantidad de asientos seleccionados
      _seats = List.filled(20,
          false); // Restablece todos los asientos a su estado deseleccionado
    });
  }

  void _selectSeat(int index) {
    if (_canSelectSeats) {
      setState(() {
        if (_selectedSeats < _counter && !_seats[index]) {
          _seats[index] = true;
          _selectedSeats++;
        } else if (_seats[index]) {
          _seats[index] = false;
          _selectedSeats--;
        }
      });
    }
  }

  void _relocateSeats() {
    setState(() {
      _seats = List.filled(20,
          false); // Restablece todos los asientos a su estado deseleccionado
      _selectedSeats = 0; // Restablece la cantidad de asientos seleccionados
    });
  }

  void _showPaymentScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              PaymentScreen(total: _total, selectedSeats: _selectedSeats)),
    );
  }

  void _showTransferImage() {
    setState(() {
      _showImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Boletos'),
      ),
      body: Stack(
        children: [
          LitStarfieldContainer(), // Colocar LitStarfieldContainer() como fondo
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Boletos:',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                Text(
                  '$_counter',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Total a pagar:',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
                Text(
                  '$_total.00',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white),
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
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: List.generate(20, (index) {
                    return GestureDetector(
                      onTap: () => _selectSeat(index),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          _seats[index]
                              ? Icons.event_seat
                              : Icons.event_seat_outlined,
                          color: _seats[index]
                              ? const Color.fromARGB(255, 175, 76, 76)
                              : Colors.grey,
                          size: 40,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _relocateSeats,
                  child: const Text('         Reubicar Asientos          ',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _showPaymentScreen,
                  child: const Text('Seleccionar Método de Pago'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  final int total;
  final int selectedSeats;

  const PaymentScreen(
      {Key? key, required this.total, required this.selectedSeats})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Método de Pago'),
      ),
      body: Stack(
        children: [
          LitStarfieldContainer(), // Colocar LitStarfieldContainer() como fondo
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'Detalles del Pago:',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  'Total a Pagar: $total.00',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  'Asientos Seleccionados: $selectedSeats',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Acción al seleccionar el pago en efectivo
                  },
                  child: const Text('     Efectivo     '),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Acción al seleccionar el pago por transferencia
                  },
                  child: const Text('Transferencia'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
