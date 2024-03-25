import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _currentLocale = Locale('en', 'US');
  bool _darkMode = false;

  void _toggleLanguage() {
    setState(() {
      if (_currentLocale.languageCode == 'en') {
        _currentLocale = Locale('ru', 'RU');
      } else {
        _currentLocale = Locale('en', 'US');
      }
    });
  }

  void _toggleTheme() {
    setState(() {
      _darkMode = !_darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _currentLocale,
      theme: _darkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Language & Theme Demo'),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: _toggleLanguage,
                  child: Text(_currentLocale.languageCode == 'en'
                      ? 'Change language'
                      : 'Сменить язык'),
                ),
                TextButton(
                  onPressed: _toggleTheme,
                  child: Text(_currentLocale.languageCode == 'en'
                      ? 'Change theme'
                      : 'Сменить тему'),
                ),
                if (orientation == Orientation.portrait)
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondScreen()),
                        );
                      },
                      child: Text(
                        _currentLocale.languageCode == 'en'
                            ? 'Hello world!'
                            : 'Привет мир!',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                  )
                else
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondScreen()),
                        );
                      },
                      child: Text(
                        _currentLocale.languageCode == 'en'
                            ? 'Hello my friend'
                            : 'Привет, мой друг',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/Logo.png'),
            SizedBox(height: 20),
            Text(
              'Logo',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
