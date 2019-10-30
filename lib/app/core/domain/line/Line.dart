
class Line {
  int id;
  int number;
  String name;

  Line(this.id, this.number, this.name);

  factory Line.fromJson(Map<String, dynamic> json) {
    Line line = new Line(
      json['id'],
      json['number'],
      json['name'],
    );
    return line;
  }

}