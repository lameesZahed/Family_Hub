class SosModel{

  Map<String,List<String>> Emergency_List = { //icon,description,number
    "Ambulance":["assets/Icons/SOS/Ambulance.svg","Medical Emergencies","0xFFDC2626","123"],
    "Police":["assets/Icons/SOS/Police.svg","Emergency / Assistance","0xFF1D4ED8","122"],
    "Fire":["assets/Icons/SOS/Fire.svg","Fire Emergencies","0xFFEA580C","180"],
  };

  Map<String,List<String>> Utility_Emergencies = { //icon,number
    "Gas Emergency":["assets/Icons/SOS/Gas.svg","0xFFEA580C","129"],
    "Electricity":["assets/Icons/SOS/Electricity.svg","0xFFCA8A04","121"],
    "water Emergency":["assets/Icons/SOS/Water.svg","0xFF2563EB","125"],
  };

  Map<String,List<String>> Road_Transport = {  //icon,number
    "Highway Road Rescue":["assets/Icons/SOS/Road.svg","0xFF16A34A","0121110000"],
    "Traffic Police":["assets/Icons/SOS/Traffic.svg","0xFF475569","128"],
  };

  Map<String,List<String>> Social_Government = { //icon,number
    "Child Helpline":["assets/Icons/SOS/Child.svg","0xFFDB2777","16000"],
    "Anti-Harassment":["assets/Icons/SOS/Haeassment.svg","0xFF4F46E5","15115"],
    "Cabinet Crisis":["assets/Icons/SOS/Cabinet.svg","0xFF475569","16528"]
  };

}