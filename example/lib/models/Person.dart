class Person{
  final String name;
  final String hair_color;
  final String skin_color;
  final String eye_color;

  Person({this.name, this.hair_color, this.skin_color,this.eye_color});

  factory Person.fromJson(Map<String, dynamic> json){
    return Person(
      name: json['name'],
      hair_color: json['hair_color'],
      skin_color: json['skin_color'],
      eye_color: json['eye_color']
    );
  }
  Map<String, dynamic> toJson() =>
    {
      'name': name,
      'hair_color': hair_color,
      'skin_color':skin_color,
      'eye_color':eye_color
    };
}