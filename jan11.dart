
void main() async {

  print(" print 5 sec delayed msg");
  String result = await Future.delayed(
    Duration(seconds: 5),
    () => "Data loaded successfully",
  );
  print(result);
}
