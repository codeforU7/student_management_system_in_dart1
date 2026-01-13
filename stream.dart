Stream<String> friendsNameStream(List<String> friends) async* {
  for (var name in friends) {
    await Future.delayed(Duration(seconds: 1)); // delay between each emission
    yield name; // emit one name at a time
  }
}

void main() async {
  List<String> myFriends = ["Rahul", "Amit", "Sneha", "Omkar"];

  print("Streaming friends' names:\n");

  await for (var name in friendsNameStream(myFriends)) {
    print(name);
  }

  print("\nAll names emitted!");
}
