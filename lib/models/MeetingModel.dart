class MeetingModel {

  /*
   * MeetingID : "MTID00006"
   * UserId : "USR002"
   * FullName : "Lobotus Test"
   * Contact : "9998887767"
   * Status : "Pending"
   * MOT : ""
   * OnDate : "27/01/2019"
   * OnTime : "05:55 PM"
   * Location : "15, Behind CPRI Compound Inside Vijaya Farms, Off 80 Feet Road Near Ramaiah Hospital, New BEL Rd, Ashwath Nagar, R.M.V. 2nd Stage, Bengaluru, Karnataka 560094, India"
   * Latitude : "13.024980200000002"
   * Longitude : "77.5763126"
   * Msg : "Success"
   * Phone : 9998887767
   * Success : 1
   */

  String MeetingID;
  String UserId;
  String FullName;
  String Contact;
  String Status;
  String MOT;
  String OnDate;
  String OnTime;
  String Location;
  String Latitude;
  String Longitude;
  String Msg;
  int Phone;
  int Success;

  static MeetingModel fromMap(Map<String, dynamic> map) {
    MeetingModel meetingModel = new MeetingModel();
    meetingModel.MeetingID = map['MeetingID'];
    meetingModel.UserId = map['UserId'];
    meetingModel.FullName = map['FullName'];
    meetingModel.Contact = map['Contact'];
    meetingModel.Status = map['Status'];
    meetingModel.MOT = map['MOT'];
    meetingModel.OnDate = map['OnDate'];
    meetingModel.OnTime = map['OnTime'];
    meetingModel.Location = map['Location'];
    meetingModel.Latitude = map['Latitude'];
    meetingModel.Longitude = map['Longitude'];
    meetingModel.Msg = map['Msg'];
    meetingModel.Phone = map['Phone'];
    meetingModel.Success = map['Success'];
    return meetingModel;
  }

  static List<MeetingModel> fromMapList(dynamic mapList) {
    List<MeetingModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

  @override
  String toString() {
    return 'MeetingModel{MeetingID: $MeetingID, UserId: $UserId, FullName: $FullName, Contact: $Contact, Status: $Status, MOT: $MOT, OnDate: $OnDate, OnTime: $OnTime, Location: $Location, Latitude: $Latitude, Longitude: $Longitude, Msg: $Msg, Phone: $Phone, Success: $Success}';
  }


}
