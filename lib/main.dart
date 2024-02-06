import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MotivationalQuotesApp());
}

class MotivationalQuotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motivational Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Motivational Quotes'),
        ),
        body: MotivationalQuotesPage(),
      ),
    );
  }
}

class MotivationalQuotesPage extends StatefulWidget {
  @override
  _MotivationalQuotesPageState createState() => _MotivationalQuotesPageState();
}

class _MotivationalQuotesPageState extends State<MotivationalQuotesPage> {
  final List<String> _quotes = [
    "The only way to do great work is to love what you do. – Steve Jobs",
    "Success is not final, failure is not fatal: It is the courage to continue that counts. – Winston Churchill",
    "Hardships often prepare ordinary people for an extraordinary destiny. – C.S. Lewis",
    "The only limit to our realization of tomorrow will be our doubts of today. – Franklin D. Roosevelt",
    "Don’t watch the clock; do what it does. Keep going. – Sam Levenson",
    "In the middle of every difficulty lies opportunity. – Albert Einstein",
    "Believe you can and you're halfway there. – Theodore Roosevelt",
    "It does not matter how slowly you go as long as you do not stop. – Confucius",
  ];

  String _currentQuote = '';
  Color _currentColor = Colors.black;

  void _generateQuote() {
    final random = Random();
    setState(() {
      _currentQuote = _quotes[random.nextInt(_quotes.length)];
      _currentColor = _generateRandomColor();
    });
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_currentQuote.isNotEmpty)
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: _currentColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                _currentQuote,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: _currentColor),
              ),
            ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _generateQuote,
            child: Text('Generate Quote'),
          ),
        ],
      ),
    );
  }
}
