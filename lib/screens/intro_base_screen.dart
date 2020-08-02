import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_design_ui/screens/home_page.dart';

class IntroBaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_outline,
              color: Colors.grey,
              size: 100,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'Inscreva-se para obter uma conta',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200,
              child: Builder(
                builder: (context) =>
                    RaisedButton(
                      onPressed: () {
                      _openPopup(context);
                    },
                      color: Colors.red[400],
                      textColor: Colors.white,
                      child: Text('Increver-se'),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openPopup(context) {
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (BuildContext bc) {
          return Container(
            child: Container(
              height: MediaQuery.of(context).size.height * .90,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.close,
                            ),
                          ),
                          Icon(
                            Icons.more,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Center(
                        child: Text(
                          'Inscreva-se no TikTok',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Crie um perfil, siga outras contas, crie seus próprios vídeos e muito mais.',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      ButtonTheme(
                        minWidth: 250.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                          },
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: FaIcon(
                                    FontAwesomeIcons.user,
                                  ),

                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Use telefone ou email',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      ButtonTheme(
                        minWidth: 250.0,
                        child: RaisedButton(
                          onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage(),
                            ));
                          },
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: FaIcon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.blue,
                                  ),

                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Inscreva-se com Facebook',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      ButtonTheme(
                        minWidth: 250.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                          },
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: FaIcon(
                                    FontAwesomeIcons.google,
                                    color: Colors.red,
                                  ),

                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Inscreva-se com Google',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      ButtonTheme(
                        minWidth: 250.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                          },
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: FaIcon(
                                    FontAwesomeIcons.twitter,
                                    color: Colors.lightBlue,
                                  ),

                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Inscreva-se com Twitter',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}