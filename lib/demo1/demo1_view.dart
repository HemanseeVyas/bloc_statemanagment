import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'demo1_bloc.dart';
import 'demo1_event.dart';
import 'demo1_state.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: Demo1Page(),));
}
class Demo1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Demo1Bloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<Demo1Bloc>(context);

    TextEditingController t1=TextEditingController();
    TextEditingController t2=TextEditingController();
    TextEditingController t3=TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Bloc_State"),),
      body: Column(
        children: [
          TextField(controller: t1,),
          TextField(controller: t2,),
          TextField(controller: t3,),

          SizedBox(height: 5,),
          ElevatedButton(onPressed: () {

            //block and state ma value add krya pachi
            bloc.add(sum_event(t1.text, t2.text));

          }, child: Text("Sum")),
          SizedBox(height: 5,),
          ElevatedButton(onPressed: () {

            //block and state ma value add krya pachi
            bloc.add(sub_event(t1.text, t2.text));

          }, child: Text("Sub")),

          //block and state ma value add krya pachi
           BlocBuilder<Demo1Bloc,Demo1State>(
           buildWhen: (previous, current) => previous != current && current is sum_state,
           builder: (context, state) {
             if(state is sum_state)
             {
               return Text("${state.sum}");
             }
             else
             {
               return Text("Sum=0");
             }
           },),

          BlocBuilder<Demo1Bloc,Demo1State>(
            buildWhen: (previous, current) => previous != current && current is sub_state,
            builder: (context, state) {
            if(state is sub_state)
            {
              return Text("${state.sub}");
            }
            else
            {
              return Text("Sub=0");
            }
          },),

          BlocBuilder<Demo1Bloc,Demo1State>(builder: (context, state) {
            if(state is str_state)
            {
              return Text("${state.str}");
            }
            else
            {
              return Text("Str : ${t3.text}");
            }
          },)

        ],
      ),
    );
  }
}

