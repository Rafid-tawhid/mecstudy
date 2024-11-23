class UserProfileModel {
  UserProfileModel({
      this.token, 
      this.refreshToken, 
      this.userId, 
      this.userType, 
      this.assignedMenu, 
      this.shortName, 
      this.uniqueUserName, 
      this.uniqueUserNameEncrypted, 
      this.email, 
      this.phone, 
      this.field1, 
      this.field2, 
      this.isBankUser, 
      this.groupID, 
      this.password, 
      this.bmid, 
      this.rmid, 
      this.assignRoleToUser, 
      this.assignUserType, 
      this.statusID, 
      this.userID, 
      this.transTime, 
      this.formattedTransTime, 
      this.authUserID, 
      this.authTime, 
      this.formattedAuthTime, 
      this.cancelUserID, 
      this.cancelTime, 
      this.formattedCancelTime, 
      this.cancelAuthUserID, 
      this.cancelAuthTime, 
      this.formattedCancelAuthTime, 
      this.customerID, 
      this.entityName, 
      this.systemKey, 
      this.id,});

  UserProfileModel.fromJson(dynamic json) {
    token = json['Token'];
    refreshToken = json['RefreshToken'];
    userId = json['UserId'];
    userType = json['UserType'];
    assignedMenu = json['AssignedMenu'];
    shortName = json['ShortName'];
    uniqueUserName = json['UniqueUserName'];
    uniqueUserNameEncrypted = json['UniqueUserNameEncrypted'];
    email = json['Email'];
    phone = json['Phone'];
    field1 = json['Field1'];
    field2 = json['Field2'];
    isBankUser = json['IsBankUser'];
    groupID = json['GroupID'];
    password = json['Password'];
    bmid = json['BMID'];
    rmid = json['RMID'];
    if (json['AssignRoleToUser'] != null) {
      assignRoleToUser = [];
      // json['AssignRoleToUser'].forEach((v) {
      //   assignRoleToUser?.add(Dynamic.fromJson(v));
      // });
    }
    if (json['AssignUserType'] != null) {
      assignUserType = [];
      // json['AssignUserType'].forEach((v) {
      //   assignUserType?.add(Dynamic.fromJson(v));
      // });
    }
    statusID = json['StatusID'];
    userID = json['UserID'];
    transTime = json['TransTime'];
    formattedTransTime = json['FormattedTransTime'];
    authUserID = json['AuthUserID'];
    authTime = json['AuthTime'];
    formattedAuthTime = json['FormattedAuthTime'];
    cancelUserID = json['CancelUserID'];
    cancelTime = json['CancelTime'];
    formattedCancelTime = json['FormattedCancelTime'];
    cancelAuthUserID = json['CancelAuthUserID'];
    cancelAuthTime = json['CancelAuthTime'];
    formattedCancelAuthTime = json['FormattedCancelAuthTime'];
    customerID = json['CustomerID'];
    entityName = json['EntityName'];
    systemKey = json['SystemKey'];
    id = json['ID'];
  }
  String? token;
  String? refreshToken;
  num? userId;
  String? userType;
  dynamic assignedMenu;
  dynamic shortName;
  dynamic uniqueUserName;
  String? uniqueUserNameEncrypted;
  dynamic email;
  String? phone;
  dynamic field1;
  dynamic field2;
  dynamic isBankUser;
  num? groupID;
  dynamic password;
  num? bmid;
  dynamic rmid;
  List<dynamic>? assignRoleToUser;
  List<dynamic>? assignUserType;
  num? statusID;
  num? userID;
  String? transTime;
  String? formattedTransTime;
  dynamic authUserID;
  dynamic authTime;
  String? formattedAuthTime;
  dynamic cancelUserID;
  dynamic cancelTime;
  String? formattedCancelTime;
  dynamic cancelAuthUserID;
  dynamic cancelAuthTime;
  String? formattedCancelAuthTime;
  num? customerID;
  dynamic entityName;
  dynamic systemKey;
  num? id;
UserProfileModel copyWith({  String? token,
  String? refreshToken,
  num? userId,
  String? userType,
  dynamic assignedMenu,
  dynamic shortName,
  dynamic uniqueUserName,
  String? uniqueUserNameEncrypted,
  dynamic email,
  String? phone,
  dynamic field1,
  dynamic field2,
  dynamic isBankUser,
  num? groupID,
  dynamic password,
  num? bmid,
  dynamic rmid,
  List<dynamic>? assignRoleToUser,
  List<dynamic>? assignUserType,
  num? statusID,
  num? userID,
  String? transTime,
  String? formattedTransTime,
  dynamic authUserID,
  dynamic authTime,
  String? formattedAuthTime,
  dynamic cancelUserID,
  dynamic cancelTime,
  String? formattedCancelTime,
  dynamic cancelAuthUserID,
  dynamic cancelAuthTime,
  String? formattedCancelAuthTime,
  num? customerID,
  dynamic entityName,
  dynamic systemKey,
  num? id,
}) => UserProfileModel(  token: token ?? this.token,
  refreshToken: refreshToken ?? this.refreshToken,
  userId: userId ?? this.userId,
  userType: userType ?? this.userType,
  assignedMenu: assignedMenu ?? this.assignedMenu,
  shortName: shortName ?? this.shortName,
  uniqueUserName: uniqueUserName ?? this.uniqueUserName,
  uniqueUserNameEncrypted: uniqueUserNameEncrypted ?? this.uniqueUserNameEncrypted,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  field1: field1 ?? this.field1,
  field2: field2 ?? this.field2,
  isBankUser: isBankUser ?? this.isBankUser,
  groupID: groupID ?? this.groupID,
  password: password ?? this.password,
  bmid: bmid ?? this.bmid,
  rmid: rmid ?? this.rmid,
  assignRoleToUser: assignRoleToUser ?? this.assignRoleToUser,
  assignUserType: assignUserType ?? this.assignUserType,
  statusID: statusID ?? this.statusID,
  userID: userID ?? this.userID,
  transTime: transTime ?? this.transTime,
  formattedTransTime: formattedTransTime ?? this.formattedTransTime,
  authUserID: authUserID ?? this.authUserID,
  authTime: authTime ?? this.authTime,
  formattedAuthTime: formattedAuthTime ?? this.formattedAuthTime,
  cancelUserID: cancelUserID ?? this.cancelUserID,
  cancelTime: cancelTime ?? this.cancelTime,
  formattedCancelTime: formattedCancelTime ?? this.formattedCancelTime,
  cancelAuthUserID: cancelAuthUserID ?? this.cancelAuthUserID,
  cancelAuthTime: cancelAuthTime ?? this.cancelAuthTime,
  formattedCancelAuthTime: formattedCancelAuthTime ?? this.formattedCancelAuthTime,
  customerID: customerID ?? this.customerID,
  entityName: entityName ?? this.entityName,
  systemKey: systemKey ?? this.systemKey,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Token'] = token;
    map['RefreshToken'] = refreshToken;
    map['UserId'] = userId;
    map['UserType'] = userType;
    map['AssignedMenu'] = assignedMenu;
    map['ShortName'] = shortName;
    map['UniqueUserName'] = uniqueUserName;
    map['UniqueUserNameEncrypted'] = uniqueUserNameEncrypted;
    map['Email'] = email;
    map['Phone'] = phone;
    map['Field1'] = field1;
    map['Field2'] = field2;
    map['IsBankUser'] = isBankUser;
    map['GroupID'] = groupID;
    map['Password'] = password;
    map['BMID'] = bmid;
    map['RMID'] = rmid;
    if (assignRoleToUser != null) {
      map['AssignRoleToUser'] = assignRoleToUser?.map((v) => v.toJson()).toList();
    }
    if (assignUserType != null) {
      map['AssignUserType'] = assignUserType?.map((v) => v.toJson()).toList();
    }
    map['StatusID'] = statusID;
    map['UserID'] = userID;
    map['TransTime'] = transTime;
    map['FormattedTransTime'] = formattedTransTime;
    map['AuthUserID'] = authUserID;
    map['AuthTime'] = authTime;
    map['FormattedAuthTime'] = formattedAuthTime;
    map['CancelUserID'] = cancelUserID;
    map['CancelTime'] = cancelTime;
    map['FormattedCancelTime'] = formattedCancelTime;
    map['CancelAuthUserID'] = cancelAuthUserID;
    map['CancelAuthTime'] = cancelAuthTime;
    map['FormattedCancelAuthTime'] = formattedCancelAuthTime;
    map['CustomerID'] = customerID;
    map['EntityName'] = entityName;
    map['SystemKey'] = systemKey;
    map['ID'] = id;
    return map;
  }

}