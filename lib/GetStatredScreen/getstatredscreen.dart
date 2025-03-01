
import 'package:flutter/material.dart';
import 'package:new_diy_beauty_products/LoginScreen/loginscreen.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/welcome.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.4),
              ]
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Glow Graft", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),),
                const SizedBox(height: 10,),
                Text("Beauty begins with ingredients you trust", style: TextStyle(color: Colors.white, fontSize: 16),),
                Text("Let's start with purchase", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),),
                const SizedBox(height: 60,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const LoginScreen()));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child:const Text("GET START", style: TextStyle(fontWeight: FontWeight.w900),)
                    ),
                  ),
                ),
                
                const SizedBox(height: 20,),
                // FadeInUp(duration: Duration(milliseconds: 1700), child: Container(
                //   height: 50,
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.white),
                //     borderRadius: BorderRadius.circular(50)
                //   ),
                //   child: Center(
                //     child: Text("Create Account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                //   ),
                // )),
                const SizedBox(height: 30,),
      

              ],
            ),
          ),
        ),
      ),
    );
  }
}