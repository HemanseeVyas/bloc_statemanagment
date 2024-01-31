abstract class Demo1Event {}

class InitEvent extends Demo1Event {}


class sum_event extends Demo1Event
{
      String a,b;
      sum_event(this.a,this.b);
}

class sub_event extends Demo1Event
{
      String a,b;
      sub_event(this.a,this.b);
}

class str_event extends Demo1Event
{
      String str;
      str_event(this.str);
}