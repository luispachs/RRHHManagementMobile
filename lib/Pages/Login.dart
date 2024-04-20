import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget{
  const Login({super.key});
    @override
  State<Login> createState  ()=> _Login();
}

class _Login extends State<Login>{
  var userController  = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build( BuildContext context){

    return Scaffold(
        body: Center(
          widthFactor: 30.0,
          heightFactor: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.login_label,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,height: 5),),
              Text(AppLocalizations.of(context)!.label_username),
              SizedBox(
                width: 200,
                height: 100,
                child: TextField(controller: userController,textAlign: TextAlign.center,decoration:  InputDecoration(hintText: AppLocalizations.of(context)!.label_username)),
              ),
              Text(textAlign: TextAlign.center,AppLocalizations.of(context)!.label_password,),
              SizedBox(
                width: 200,
                height: 100,
                child: TextField(controller: passwordController,obscureText: true ,textAlign: TextAlign.center,decoration: InputDecoration(hintText: AppLocalizations.of(context)!.label_password,),),
              ),
              SizedBox(width: 200,height: 50,
                child: ElevatedButton(onPressed:  () async => {
                  await login()
                },
                  child:  Text(AppLocalizations.of(context)!.login_label),
                  style: const ButtonStyle(foregroundColor: MaterialStatePropertyAll<Color>(Colors.white70),backgroundColor: MaterialStatePropertyAll<Color>(Colors.indigo)),
                ),
              )
            ],
          ),)

    );
  }


  @override
  void dispose(){
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void>  login () async{
      try{
        Map<String,String> content = {'user':userController.text,'password':passwordController.text};
        print(jsonEncode([content]));
       var r= await http.post(Uri.parse('http://192.168.1.3:3000/api/auth/login'),body:content);
       print(r.body);
      }catch(e){
        print(e);
      }
  }
}