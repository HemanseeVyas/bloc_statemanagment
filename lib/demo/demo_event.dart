abstract class DemoEvent {}

class InitEvent extends DemoEvent {}

class sum_event extends DemoEvent
{
  //ont variable create in page
        String a,b;
        sum_event(this.a,this.b);
}