class Demo1State {
  Demo1State init() {
    return Demo1State();
  }

  Demo1State clone() {
    return Demo1State();
  }
}

class sum_state extends Demo1State
{
      int sum;
      sum_state(this.sum);
}

class sub_state extends Demo1State
{
  int sub;
  sub_state(this.sub);
}

class str_state extends Demo1State
{
  String str;
  str_state(this.str);
}
