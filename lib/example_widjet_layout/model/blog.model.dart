class Blog{
  final String name;
  final String description;
  final int price;
  final String image;

  Blog(this.name, this.description, this.price, this.image);

  static List<Blog> getBlog(){
    List<Blog> items = <Blog>[];

    items.add(
      Blog("Java", "Lorem ipsum dolor sit amet, "
          "consectetur adipisicing elit. Adipisci assumenda at, cupiditate delectus deleniti et hic laudantium quas "
          "rem repudiandae, rerum, sint tempora vitae.", 123, 'java.png')
    );

    items.add(
        Blog("Python", "description python", 1000, 'python.jpg')
    );
    items.add(
        Blog("Dart", "description Dart", 2000, 'dart.png')
    );

    items.add(
        Blog("C++", "description C++", 2000, 'c++.png')
    );

    items.add(
        Blog("JavaScript", "description JavaScript", 1256, 'javascript.png')
    );
    items.add(
        Blog("C#", "description C#", 1256, 'c#.png')
    );
    items.add(
        Blog("Html", "description Html", 2000, 'html.png')
    );

    return items;

  }

}