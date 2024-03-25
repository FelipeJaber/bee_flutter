import 'dart:io';

import 'package:bee_flutter/Commons/Colors.dart';
import 'package:bee_flutter/Pages/HubScreen/HubScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bee_flutter/main.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isMobile) {
      return Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            backgroundColor: Colors.blue,
          ),
        ),
      );
    } else {
      return Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            backgroundColor: mainAmarelo,
            body: Container(
              child: Stack(
                children: [
                  // Container(
                  //   width: MediaQuery.sizeOf(context).width,
                  //   height: MediaQuery.sizeOf(context).height,
                  //   child: CachedNetworkImage(
                  //     imageUrl:
                  //         "https://as1.ftcdn.net/v2/jpg/02/74/54/86/1000_F_274548668_7PP17XD3vVZYjyEcAsmLJqqZJBtIzP9w.jpg",
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundBranco,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              height: MediaQuery.sizeOf(context).height * 0.95,
                              width: 500,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 8),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 500,
                                      decoration: BoxDecoration(
                                        color: azulOxford,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 10, 0, 0),
                                                child: Text(
                                                  "Já sou de casa",
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      color: mainBranco),
                                                ),
                                              ),
                                              SizedBox(),
                                              Container(
                                                width: 400,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 5, 0, 2),
                                                      child: Text(
                                                        "Login",
                                                        style: TextStyle(
                                                            color: mainBranco),
                                                      ),
                                                    ),
                                                    TextField(
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 400,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 5, 0, 2),
                                                      child: Text(
                                                        "Senha",
                                                        style: TextStyle(
                                                            color: mainBranco),
                                                      ),
                                                    ),
                                                    TextField(
                                                      decoration: InputDecoration(
                                                          border:
                                                              OutlineInputBorder()),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 400,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          0, 16, 0, 0),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(context, MaterialPageRoute(builder: (context) => HubScreen()));
                                                        },
                                                        child: Container(
                                                          width: double.infinity,
                                                          height: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors.black54
                                                                    .withOpacity(
                                                                        0.3), // Cor da sombra
                                                                spreadRadius:
                                                                    2, // Raio de propagação da sombra
                                                                blurRadius:
                                                                    2, // Raio de desfoque da sombra
                                                                offset: Offset(0,
                                                                    1), // Deslocamento da sombra horizontal e verticalmente
                                                              ),
                                                            ],
                                                            color:
                                                                calltoactionColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(3),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "Entrar",
                                                              style: TextStyle(
                                                                  color:
                                                                      mainBranco,
                                                                  fontSize: 18),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          0, 16, 0, 16),
                                                      child: Container(
                                                        child: Center(
                                                          child: Text(
                                                            "Esqueci minha senha",
                                                            style: TextStyle(
                                                                color:
                                                                    mainBranco,
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                        width: double.infinity,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    mainBranco),
                                                            color: Colors.black
                                                                .withOpacity(0),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 8, 0, 8),
                                          child: Container(
                                            width: 500,
                                            decoration: BoxDecoration(
                                                color: mainBranco,
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                border: Border.all(
                                                    color: azulOxford)),
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 10, 0, 0),
                                                    child: Text(
                                                      "Sou novo por aqui",
                                                      style: TextStyle(
                                                          fontSize: 40,
                                                          color: azulOxford),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 400,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 5, 0, 2),
                                                          child: Text(
                                                            "Nome",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 400,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 5, 0, 2),
                                                          child: Text(
                                                            "Email",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 400,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 5, 0, 2),
                                                          child: Text(
                                                            "Senha",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 400,
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 16, 0, 20),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 60,
                                                            decoration:
                                                            BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors.black54
                                                                      .withOpacity(
                                                                      0.3), // Cor da sombra
                                                                  spreadRadius:
                                                                  2, // Raio de propagação da sombra
                                                                  blurRadius:
                                                                  2, // Raio de desfoque da sombra
                                                                  offset: Offset(0,
                                                                      1), // Deslocamento da sombra horizontal e verticalmente
                                                                ),
                                                              ],
                                                              color:
                                                              calltoactionColor,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(3),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "Me cadastrar",
                                                                style: TextStyle(
                                                                    color:
                                                                        mainBranco,
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 12, 0, 0),
                                      child: Text(
                                          "My brother, come join me, In battle we are stronger"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
