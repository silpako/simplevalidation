import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simplevalidation/home.dart';
void main(){
  runApp(MaterialApp(home: Login(),));
}

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>LoginState();

}

class LoginState extends State {
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 124, 25, 149),
              Color.fromARGB(255, 206, 67, 213),
              Color.fromARGB(255, 151, 64, 168)
            ])
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 80,),
                Text("Hello!",style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Sign in to your account",style: TextStyle(color: Colors.black,fontSize: 15,),),
                SizedBox(height: 40,),
                //validation
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: 400,
                    child: TextFormField(
                      validator: (name)
                      {
                        if(name!.isEmpty ){
                          return"Name field empty";
                        }
                        else{
                          return null;
                        }

                      },
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.person,color: Colors.black,),
                                
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30.0)
                        )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: 400,
                    child: TextFormField(
                      validator: (pass){
                        if(pass!.isEmpty || pass.length<4)
                        {
                          return "Password lenth <4 or field empty";

                        }
                        else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.lock,color: Colors.black,),
                        suffixIcon: Icon(Icons.remove_red_eye,color: Colors.grey,),   
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30.0)
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                  [
                    Text("Sign In  \t",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ElevatedButton(onPressed: (){
                      if(formkey.currentState!.validate()){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>homepage()));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid")));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 100, 27, 109),
                      minimumSize: Size(20, 50),
                      shape:StadiumBorder()), 
                      child: Icon(Icons.arrow_right_alt_rounded))
                  ] 
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                [
                  Text("Don't have an account?",style:TextStyle(color: Colors.black),),
                  TextButton(onPressed: (){}, child: Text("Create",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),))
      
                ] )
              ],
            ),
          ),
        ),
      ),
    );
  }
}