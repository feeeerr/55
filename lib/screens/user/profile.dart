import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

String _name = 'not logged';

final Estilo =
    TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white);

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> _getUserLocalInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString("name") ?? 'not logged';
      });
  }
  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    SystemNavigator.pop();
  }
  @override

  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _getUserLocalInfo();
    });}

  Widget build(BuildContext context) {
    var sizeh = MediaQuery.of(context).size.height;
    var sizew = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 22, 22),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                width: 300,
                height: 125,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 75,
                      color: Colors.white,
                    ),
                    Text(
                      '$_name',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.transparent),
      elevation: MaterialStatePropertyAll(
        0,
      ),
    ),
    onPressed: () {
    },
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 100,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 30),
                      child: Container(
                        child: Column(
                          children: [Text(
                    'Meus dados',
                    style: Estilo,
                    softWrap: false,
                  ),
                  Text(
                    'E-mail, senha, Nome de Usuário, localização... ',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    softWrap: false,
                  ),],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  )
                  
            ),
            SliverToBoxAdapter(
              child: ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.transparent),
      elevation: MaterialStatePropertyAll(
        0,
      ),
    ),
    onPressed: () {
      logOut();
      
    },
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 100,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10, top: 30),
                      child: Container(
                        child: Column(
                          children: [Text(
                    'Sair',
                    style: Estilo,
                    softWrap: false,
                  ),
                  Text(
                    'Fazer logout',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    softWrap: false,
                  ),],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  )
                  
      
            ),
          ],
        ),
      ),
    );
  }
}
