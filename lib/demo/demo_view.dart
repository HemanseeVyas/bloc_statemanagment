import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'demo_bloc.dart';
import 'demo_event.dart';
import 'demo_state.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: DemoPage(),));
}

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DemoBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<DemoBloc>(context);

      TextEditingController t1=TextEditingController();
      TextEditingController t2=TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Bloc_Sum"),),
      body: Column(
         children: [
           TextField(controller: t1,),
           TextField(
             controller: t2,
           ),
           SizedBox(height: 10,),
           ElevatedButton(onPressed: () {
              bloc.add(sum_event(t1.text, t2.text));
           }, child: Text("Submit")),
           SizedBox(height: 10,),

           BlocBuilder<DemoBloc ,int>(builder: (context, state) {
             return Text("Sum=${state}");
           },)

         ],
      ),
    );
  }
}

