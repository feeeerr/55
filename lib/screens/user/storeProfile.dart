import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StoreProfile extends StatefulWidget {
  const StoreProfile({Key? key});

  @override
  State<StoreProfile> createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Cor da barra de status transparente
      statusBarIconBrightness: Brightness.light, // Ícones da barra de status em branco
    ));

    var sizeh = MediaQuery.of(context).size.height;
    var sizew = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: sizeh,
        width: sizew,
        color: Colors.deepPurpleAccent,
        child: Stack(
          children: [],
        ),
      ),
    );
  }
}