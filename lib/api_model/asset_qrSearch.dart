class QRSearch {
  String? qRID;
  String? equipmentNumber;
  String? name;
  String? room;
  String? fig;
  String? no;

  QRSearch(
      {this.qRID,
      this.equipmentNumber,
      this.name,
      this.room,
      this.fig,
      this.no});

  QRSearch.fromJson(Map<String, dynamic> json) {
    qRID = json['QR_ID'];
    equipmentNumber = json['EquipmentNumber'];
    name = json['Name'];
    room = json['Room'];
    fig = json['Fig'];
    no = json['No'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QR_ID'] = this.qRID;
    data['EquipmentNumber'] = this.equipmentNumber;
    data['Name'] = this.name;
    data['Room'] = this.room;
    data['Fig'] = this.fig;
    data['No'] = this.no;
    return data;
  }
}
