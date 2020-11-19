#include <NTPClient.h> //necessary header files
#include <WiFi.h>
#include <WiFiUdp.h>
#include <FirebaseESP32.h>

// defining the firebase authentication info and wifi login
#define FIREBASE_HOST "team15-wildfire-test.firebaseio.com"
#define FIREBASE_AUTH "P7adK8risk2kaw5Q6rcEr46EYdDMCGTU0DO7zcaF"
#define WIFI_SSID "Poussay"
#define WIFI_PASSWORD "about.059.pulse"

WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP);

//initializing strings to be embedded in the firebase
String Node1 = "Node 1";
String Node2 = "Node 2";
String Node3 = "Node 3";

String formattedDate;
String dayStamp;
String timeStamp;

String CO;
String temp;
String smoke;

String CO2;
String temp2;
String smoke2;

String CO3;
String temp3;
String smoke3;

//Define FirebaseESP32 data object
FirebaseData firebaseData;

FirebaseJson json;

//SoftwareSerial BOWDS(34, 35);

void printResult(FirebaseData &data);

//intializing variables for the iteration when being embedded
String iString = "0";
int iInt = 0;

void setup()
{

  Serial.begin(115200); //setting baud rates
  Serial2.begin(9600);
  
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD); //connecting to wifi with defined password and id 
  Serial.print("Connecting to Wi-Fi");
  delay(5000);
  while (WiFi.status() != WL_CONNECTED) //if wifi is not conencted
  {
    ESP.restart(); //then restart to try again
    delay(5000); //wait to let it try to connect
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH); //connect to firebase 
  Firebase.reconnectWiFi(true);

  Firebase.setReadTimeout(firebaseData, 1000 * 60); //set read timeout
  Firebase.setwriteSizeLimit(firebaseData, "tiny");

  timeClient.begin(); //begin timeclient to get timestamp
  timeClient.setTimeOffset(-21600); //set offset to get central time

  delay(25000); //delay to let microcontroller configure to not get empty strings
  
}

void loop() {
  while(!timeClient.update()) { //if time client is not updated
    timeClient.forceUpdate(); //force it to update to most recent time
  }
  
  formattedDate = timeClient.getFormattedDate(); //get timeclient information 

  int current; //declaring variables for serial readin
  String currentChar;
 
    while(Serial2.available() > 0) { //while there is information to read from UART
      current = Serial2.read(); //read in one character in ASCII
      //data embedds by nodeidentifier ('a', 'b', 'c') 
      //'a' indicates node 1
      //'b' indicates node 2
      //'c' indicates node 3
      //then 'C' to indicate CO sensor reading
      //then the CO sensor string from float value
      //then 'T' to indicate Temperature reading
      //then the Temperature sensor string from float value
      //then 'S' to indicate the smoke reading
      // then the smoke string from float value
      //then a letter 'Z' to indicate the end of one nodes values
      if (current == 97) { //if equals 'a', which is ASCI 97
        current = Serial2.read(); //read in next value;
      if (current == 67) { // if equals 'C'
         current = Serial2.read(); //read next value
         while (current != 84) { //while not T to indicate the start of next sensor reading
          if (current == 46) { // if equals ASCI 46, which is '.'
          CO += "."; //then add a period to the string 
         } else {
          current -= 48; //else subtract by 48 to go from ASCI to decimal
          currentChar = String(current); //convert the char to a string
          CO += currentChar; //then apend that value to the end of the CO string
         } current = Serial2.read(); //read in the next value
      } 
      } if (current == 84) { //if equal to 'T'
        current = Serial2.read();  //read in next character
      while (current != 83) { //while does not equal 'S' to indicate start of smoke reading
        if (current == 46) { //if 46 append a '.'
          temp += ".";
         } else {
          current -= 48; //else go from ASCII to decimal and append to temp string
          currentChar = String(current);
          temp += currentChar;
         } current = Serial2.read(); //read in next value
      } 
      } if (current == 83) { //if equal to 'S'
        current = Serial2.read(); // read in next value
      while (current != 90) { //z is the end symbol, so while not end of sensor data for node 1
          if (current == 46) { //append a '.' if 46
          smoke += ".";
         } else { //else convert to decimal and append to smoke string
          current -= 48;
          currentChar = String(current);
          smoke += currentChar;
         } current = Serial2.read(); //read next variable
      }
    }
    } current = Serial2.read(); //read next varaible 
    
    
    
    if (current == 98) { // if equal to 'b' to indicate node 2
        current = Serial2.read(); //then repeats the same code as above but for string 2 for node 2
      if (current == 67) {
         current = Serial2.read();
         while (current != 84) {
          if (current == 46) {
          CO2 += ".";
         } else {
          current -= 48;
          currentChar = String(current);
          CO2 += currentChar;
         } current = Serial2.read();
      } 
      } if (current == 84) {
        current = Serial2.read();
      while (current != 83) {
        if (current == 46) {
          temp2 += ".";
         } else {
          current -= 48;
          currentChar = String(current);
          temp2 += currentChar;
         } current = Serial2.read();
      } 
      } if (current == 83) {
        current = Serial2.read();
      while (current != 90) { //z is the end symbol
          if (current == 46) {
          smoke2 += ".";
         } else {
          current -= 48;
          currentChar = String(current);
          smoke2 += currentChar;
         } current = Serial2.read();
      }
    } 
    } current = Serial2.read();
    
    if (current == 99) { //if equal to 'c' to indicate node 3
        current = Serial2.read();//then a repeat of the same code by adding to the third set of strings for node 3
      if (current == 67) {
         current = Serial2.read();
         while (current != 84) {
          if (current == 46) {
          CO3 += ".";
         } else {
          current -= 48;
          currentChar = String(current);
          CO3 += currentChar;
         } current = Serial2.read();
      } 
      } if (current == 84) {
        current = Serial2.read();
      while (current != 83) {
        if (current == 46) {
          temp3 += ".";
         } else {
          current -= 48;
          currentChar = String(current);
          temp3 += currentChar;
         } current = Serial2.read();
      } 
      } if (current == 83) {
        current = Serial2.read();
      while (current != 90) { //z is the end symbol
          if (current == 46) {
          smoke3 += ".";
         } else {
          current -= 48;
          currentChar = String(current);
          smoke3 += currentChar;
         } current = Serial2.read();
      }
    } 
    }
    }

  //node1
  Firebase.setString(firebaseData, "datasets/" + iString + "/co", CO); //push CO string to firebase
  Firebase.setString(firebaseData, "datasets/" + iString + "/nodepos", Node1); //push node identifier string to firebase
  Firebase.setString(firebaseData, "datasets/" + iString + "/smoke", smoke); //push smoke string to firebase
  Firebase.setString(firebaseData, "datasets/" + iString + "/temp", temp); //push temperature string to firebase
  Firebase.setString(firebaseData, "datasets/" + iString + "/time", formattedDate); //push formattedDate string to firebase

  //iterate iterator up by 1 so we confirm that the databse stays in chronological order
  iInt =  iString.toInt();
  iInt = iInt + 1;
  iString = String(iInt);

  //do 2 times again for node2 and node1

  //node2
  Firebase.setString(firebaseData, "datasets/" + iString + "/co", CO2);
  Firebase.setString(firebaseData, "datasets/" + iString + "/nodepos", Node2);
  Firebase.setString(firebaseData, "datasets/" + iString + "/smoke", smoke2);
  Firebase.setString(firebaseData, "datasets/" + iString + "/temp", temp2);
  Firebase.setString(firebaseData, "datasets/" + iString + "/time", formattedDate);

  iInt =  iString.toInt();
  iInt = iInt + 1;
  iString = String(iInt);

  //node3
  Firebase.setString(firebaseData, "datasets/" + iString + "/co", CO3);
  Firebase.setString(firebaseData, "datasets/" + iString + "/nodepos", Node3);
  Firebase.setString(firebaseData, "datasets/" + iString + "/smoke", smoke3);
  Firebase.setString(firebaseData, "datasets/" + iString + "/temp", temp3);
  Firebase.setString(firebaseData, "datasets/" + iString + "/time", formattedDate);
  
  
  iInt =  iString.toInt();
  iInt = iInt + 1;
  iString = String(iInt);

  //clearing all strings to write over in loop
  CO.clear();
  temp.clear();
  smoke.clear();
  
  CO2.clear();
  temp2.clear();
  smoke2.clear();

  CO3.clear();
  temp3.clear();
  smoke3.clear();
  
  
  delay(5000); //waiting 5 seconds
}
