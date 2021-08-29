class ToDoTagEntity {
  final int id;
  final String name;
  final String colorHex;

  const ToDoTagEntity(
      {required this.id, required this.name, required this.colorHex});

  static List<ToDoTagEntity> generateFakeData() {
    return const [
      ToDoTagEntity(id: 1, name: 'Android', colorHex: '0xffffbb33'),
      ToDoTagEntity(id: 2, name: 'iOS', colorHex: '0xffffdd45'),
      ToDoTagEntity(id: 3, name: 'Web', colorHex: '0xffffcc22'),
      ToDoTagEntity(id: 4, name: 'Desktop', colorHex: '0xffffee66'),
    ];
  }
}
