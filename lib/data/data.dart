class Employee {
  String id;
  String name;
  String title;
  int phoneNumber;
  String email;
  String image;

  Employee(
      {required this.id,
      required this.name,
      required this.title,
      required this.phoneNumber,
      required this.email,
      required this.image});
}

List <Employee> data = [
  Employee(
    id: "1",
    name: "Dimeji Johnson",
    title: "Software Engineer",
    phoneNumber: 07064959292,
    email: "dimeji@sasays.tech",
    image: "assets/image1.jpeg",
  ),
  Employee(
    id: "2",
    name: "Dimeji Johnson",
    title: "Software Engineer",
    phoneNumber: 07064959292,
    email: "dimeji@sasays.tech",
    image: "assets/image1.jpeg",
  ),
  Employee(
    id: "3",
    name: "Dimeji Johnson",
    title: "Software Engineer",
    phoneNumber: 07064959292,
    email: "dimeji@sasays.tech",
    image: "assets/image1.jpeg",
  ),
];
