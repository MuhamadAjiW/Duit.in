import 'package:duit.in/cubit/log_reader_cubit.dart';
import 'package:duit.in/ui/landinglogin/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:duit.in/cubit/auth_cubit.dart';

import 'package:duit.in/theme/theme.dart';
import 'package:duit.in/widgets/custominput.dart';
import 'package:duit.in/widgets/customtextbutton.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {

    Widget submitButton(){
      return BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state){
            if (state is AuthLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomTextButton(
                widthVal: 300,
                heightVal: 50,
                buttonColor: Colors.transparent,
                text: 'Sign up',
                textSize: 12,
                textColor: black,
                onPressed: (){
                 context.read<AuthCubit>().signUp(
                     name: nameController.text,
                     email: emailController.text,
                     password: passController.text,
                      confpass: passController.text);
                },
            );
          },
          listener: (context, state){
            if (state is AuthSuccess){
              context.read<LogReaderCubit>().readLogs(state.user.uid);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/nav-page', (route) => false);
            } else if (state is AuthFailed){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: red,
              ));
            }
          }
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            children: [
              Spacer(flex: 6),
              Text("Register Page"),
              Spacer(flex: 8),

              CustomInputBar(
                  controller: nameController,
                  hint: 'Name',
                  imagefile: logoItb),
              Spacer(flex: 1),

              CustomInputBar(
                  controller: emailController,
                  hint: 'Email',
                  imagefile: logoItb),
              Spacer(flex: 1),

              CustomInputBar(
                controller: passController,
                hint: 'Password',
                imagefile: logoItb,
                obscuretext: true,),
              Spacer(flex: 1),

              submitButton(),
              Spacer(flex: 1),

              CustomTextButton(
                  widthVal: 300,
                  heightVal: 50,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage(viewState: 0,)));
                  },
                  buttonColor: Colors.transparent,
                  text: 'Already have an account? Sign in',
                  textSize: 12,
                  textColor: black),
              Spacer(flex: 4)
            ],
          ),
        ),
      ),
    );
  }
}
