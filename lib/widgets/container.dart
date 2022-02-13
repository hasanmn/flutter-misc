import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          // constraints: BoxConstraints(
          //   minHeight: 100,
          //   minWidth: 300,
          // ),
          // constraints: BoxConstraints.expand(),
          alignment: Alignment.center,
          width: 200,
          height: 100,
          // transform: Matrix4.rotationZ(180),
          decoration: const BoxDecoration(
            color: Colors.pink,
            // border: Border.all(
            //   color: Colors.blue,
            //   width: 2,
            //   style: BorderStyle.solid,
            // ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4.0,
                spreadRadius: 2,
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.blue,
                Colors.white,
              ],
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: const Text('Contained Text'),
        ),
      ),
    );
  }
}
