import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color colorButton = Color(0xFFFA9025);

  Color colorBack = Color(0xFF790C04);
  int tipo = 0;
  RoundedRectangleBorder roundedButton = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1.0),
      side: BorderSide(color: Colors.black));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Container(
            child: Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: RaisedButton(
                        color: colorButton,
                        onPressed: () {
                          this.tipo = 0;
                          setState(() {});
                        },
                        shape: roundedButton,
                        child: Text("INICIO"),
                      )),
                  Expanded(
                      flex: 3,
                      child: RaisedButton(
                        shape: roundedButton,
                        color: colorButton,
                        onPressed: () {
                          this.tipo = 1;
                          setState(() {});
                        },
                        child: Text("DENUNCIAS"),
                      )),
                  Expanded(
                      flex: 4,
                      child: RaisedButton(
                        color: colorButton,
                        shape: roundedButton,
                        onPressed: () {
                          this.tipo = 2;
                          setState(() {});
                        },
                        child: Text("TIPS Y CONSEJOS",),
                      ))
                ],
              ),
            ),
          ),
        ),
        title: Center(
          child: Text("LEGA APP"),
        ),
        backgroundColor: colorBack,
      ),
      body: Container(color: Color(0xFFFCAFA1), child: navegar(context)),
      bottomNavigationBar: Container(
          height: 70,
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            child: Container(
                padding: EdgeInsets.only(top: 6, left: 6, right: 2),
                decoration: BoxDecoration(color: colorBack),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 5,
                  children: <Widget>[
                    Text("Angie Sofía Sierra Cortes"),
                    Text("Laura Marcela Flechas Bastidas"),
                    Text("María Paula Cruz Romero"),
                    Text("Germán Darvid Giraldo Mora")
                  ],
                )),
          )),
    );
  }

  Widget navegar(BuildContext context) {
    if (tipo == 1) {
      return denuncia(context);
    }
    if (tipo == 2) {
      return tipsConsejos(context);
    }
    return home();
  }

  Widget tipsConsejos(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text("Tips y Consejos",style:  TextStyle(color: this.colorBack, fontWeight: FontWeight.w400, fontSize: 18,fontStyle: FontStyle.italic ),),
          ),
          SizedBox(
            height: 30,
          ),
          custom(false, "MEDICINA LEGAL"),
          SizedBox(
            height: 10,
          ),
          custom(true, "ICBF"),
          SizedBox(
            height: 10,
          ),
          custom(false, "POLICIA NACIONAL"),
          SizedBox(
            height: 10,
          ),
          custom(true, "FISCALIA"),
          SizedBox(
            height: 10,
          ),
          custom(false, "CONTRALORIA"),
          SizedBox(
            height: 10,
          ),
          custom(true, "PROCURADURIA"),
          SizedBox(
            height: 10,
          ),
          custom(false, "DEFENSORIA DEL PUEBLO")
        ],
      ),
    );
  }

  Widget custom(bool isRight, String text) {
    Widget right = null;
    Widget left = null;

    Widget d = RaisedButton(
      color: colorBack,
      onPressed: () {
        setState(() {
          this._mostrarAlert(context, text, "En desarollo");
        });
      },
      shape: roundedButton,
      child: Text(text,style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontStyle: FontStyle.italic ),),
    );
    if (isRight) {
      right = d;
    } else {
      left = d;
    }
    double tamano = 200.0;
    double height = 50;

    return Row(children: <Widget>[
      Expanded(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: height,
            width: tamano,
            child: right,
          ),
        ),
        flex: 6,
      ),
      Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(height: height, width: tamano, child: left),
        ),
        flex: 6,
      )
    ]);
  }

  Widget home() {
    return Container(
      color: Color(0xFFFCAFA1),
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 8,
              child: Container(
                //decoration: BoxDecoration(color: Colors.blue),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: Center(child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child:
                                  Image(image: AssetImage("assets/logo.jpg")),
                            );
                          },
                        ))),
                    Expanded(
                        flex: 5,
                        child: Container(
                          margin: EdgeInsets.only(top: 40, left: 10, right: 15),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "OBJETIVO",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                "                                         \n                                         \n                                         \n                                         \n                                         \n                                         \n",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )),
          Expanded(
              flex: 8,
              child: Container(
                //decoration: BoxDecoration(color: Colors.blueAccent),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Column(
                            children: <Widget>[
                              Text("COMENTARIOS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              SizedBox(height: 20.0),
                              comentario(),
                              SizedBox(
                                height: 15,
                              ),
                              comentario(),
                              SizedBox(
                                height: 15,
                              ),
                              comentario()
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 5,
                        child: Container(
                            margin: EdgeInsets.only(bottom: 20, right: 20),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(), color: Colors.white),
                            child: Center(
                                child:
                                    Text("HISTORIA DESTACADA DE LA SEMANA"))))
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget comentario() {
    return Container(
        height: 30,
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.white),
                )),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text("                               ",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15)),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget denuncia(BuildContext context) {
    return Container(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: ListView(children: <Widget>[
        SizedBox(
          height: 30,
        ),
        comentarioCorazon(),
        SizedBox(
          height: 10,
        ),
        comentarioCorazon(),
        SizedBox(
          height: 10,
        ),
        comentarioCorazon(),
        SizedBox(
          height: 10,
        ),
        comentarioCorazon(),
        SizedBox(
          height: 10,
        ),
        insertarComentar(context)
      ]),
    ));
  }

  bool check1 = false;
  bool check2 = true;

  Widget insertarComentar(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 60),
                child: Text("CUENTANOS QUE PASA"),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 20,
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: check1,
                              onChanged: (bool val) {
                                if (val) {
                                  setState(() {
                                    check2 = false;
                                    check1 = true;
                                  });
                                }
                              }),
                          SizedBox(
                            width: 6,
                          ),
                          Text("PÚBLICO"),
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: check2,
                              onChanged: (bool val) {
                                if (val) {
                                  setState(() {
                                    check2 = true;
                                    check1 = false;
                                  });
                                }
                              }),
                          Text("ANONIMO")
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration:
                BoxDecoration(border: Border.all(), color: Colors.white),
            child: TextField(
              maxLines: 4,
              keyboardType: TextInputType.multiline,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 22,
                child: RaisedButton(
                  color: Colors.greenAccent,
                  onPressed: () {
                    setState(() {
                      this._mostrarAlert(
                          context, "Información", "Comentario enviado");
                    });
                  },
                  shape: roundedButton,
                  child: Text("Enviar"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget comentarioCorazon() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          border: Border.all(), color: Colors.white),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 8,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 6),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 10,
                                  child: Text(
                                      "                                                        ",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 15)),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.pink,
                                      size: 24.0,
                                    ))
                              ],
                            ),
                          ),
                          Text("Comentario de la publicación anterior"),
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  void _mostrarAlert(BuildContext context, String titulo, String mensaje) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text(titulo),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(mensaje),
              Container(
                width: 130,
                height: 130,
                child: Image(image: AssetImage("assets/logo.jpg")),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar')),
            FlatButton(
                onPressed: () => Navigator.of(context).pop(), child: Text('Ok'))
          ],
        );
      },
    );
  }
}
