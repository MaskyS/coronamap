import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'assets/logo.png',
                          height: 200,
                          width: 200,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'CORONA-MAPP',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                                fontSize: 24,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Language/Langaz/Langue:',
                            style: TextStyle(
                              color: Color.fromRGBO(128, 122, 122, 1)
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset('assets/uk_flag.png',
                            height: 37,
                            width: 37
                          ),
                          Image.asset('assets/mauritius_flag.png',
                              height: 37,
                              width: 37
                          ),
                          Image.asset('assets/france_flag.png',
                              height: 37,
                              width: 37
                          ),
                        ],
                      ),
                      Center(
                        child: RaisedButton.icon(
                          color: Colors.red,
                          textColor: Colors.white,
                          icon: Icon(Icons.arrow_forward),
                          label: Text("GO"),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                )
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
