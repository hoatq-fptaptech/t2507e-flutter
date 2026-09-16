import 'package:flutter/material.dart';
import 'package:t2507e_flutter/app.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _StateLoginPage();
}
class _StateLoginPage extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool hidePassword = true;

  // login function
  void login() async{
    if(!_formKey.currentState!.validate()){
      return;
    }
    setState(() {
      isLoading = true;
    });
    // Call api login
    final email = emailController.text;
    final password = passwordController.text;
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isLoading = false;
    });
    // gia su email = admin@gmail.com pass: 123456
    // dung thi chuyen sang Home
    if(email == "admin@gmail.com" && password == "123456"){
      // Login thanh cong
      Navigator.pushReplacement(context,
        MaterialPageRoute(
          builder: (context)=>const App()
        )
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: const Text("Email or password is not correct!")
        )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login",
            style: TextStyle(color: Colors.white) ),
        backgroundColor: Colors.orange,
      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top:100,left: 20,right: 20,bottom: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder()
                  ),
                  validator: (v){
                    if(v == null || v.isEmpty){
                      return "Pls enter your email";
                    }
                    if(!v.contains("@")){
                      return "Email is not valid";
                    }
                    return null;
                  }
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(hidePassword? Icons.visibility: Icons.visibility_off ),
                      onPressed: (){
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                  validator: (v){
                    if(v == null || v.isEmpty){
                      return "Pls enter password";
                    }
                    if(v.length < 6){
                      return "Password min length: 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading? null : login,
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Colors.orange),
                      foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                    ),
                    child: isLoading
                          ?const CircularProgressIndicator()
                          :const Text("Login"),
                  )
                )
              ],
            )
          ),
        ),
        ),
    );
  }
}