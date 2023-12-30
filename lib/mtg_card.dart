class MtgCard{
  final String id;
  final String name;
  final int  qtt;
  final String set_name;
  final String imgURI;

  const MtgCard({
    required this.id,
    required this.name,
    required this.qtt,
    required this.set_name,
    required this.imgURI
});

  Map<String, dynamic> mapear(){
    return{
      'id': id,
      'name':name,
      'qtt':qtt,
      'set_name': set_name,
      'imgURI': imgURI,
    };
  }
}


