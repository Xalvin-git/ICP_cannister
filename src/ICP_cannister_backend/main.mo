// A user store in stable memory to recieve and alter input
import D "mo:base/Debug";
actor Exercise {
  type Gender = {
    #male;
    #female;
  };
  type StudentRecord = {
    var name: Text;
    var email: Text;
    var age: Nat;
    var gender: Gender;
  };
  type Result = {
    #ok: Text;
    #err : Text;
  };
  stable let studentRecord: [StudentRecord] = [
     {
       var name = "alvin";
       var email ="alvin@gmail.com";
       var age = 21;
       var gender: Gender = #male;
    },
    {
      var name ="Michael";
      var email ="jamesMichael@gmailcom";
      var age = 16;
      var gender : Gender = #female;
    }
  ];
  public shared func updateStudentRecord(index: Nat, name:?Text, email: ?Text, age: ?Nat, gender: ?Gender): async Result {
    // find the element based on index
    if(index < studentRecord.size()){
     var record: StudentRecord = studentRecord[index];
     switch(name) {
      case(null) {  
         
      };
      case(?name) { 
        record.name := name;
        };
    };
    switch(age) {
      case(null) {  
         
      };
      case(?age) { 
        record.age := age;
        };
    };
    switch(gender) {
      case(null) {  
         
      };
      case(?gender) { 
        record.gender := gender;
        };
    };
    switch(email) {
      case(null) {  
         
      };
      case(?email) { 
        record.email := email;
        };
    };
     return #ok "updated record";
    }else{
      D.print("index out of outbounds");
      return  #err "failed to update record";
    };
    
    
    };
}
