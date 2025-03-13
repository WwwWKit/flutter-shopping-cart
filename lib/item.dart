class Item{
  //Attributes of an item
  int id;
  String name;

  //Constructor
  Item(this.id,this.name);

  //Getter
  int get itemID => id;
  String get itemName => name;

  @override
  String toString(){
    return '$id : $name';
  }
}