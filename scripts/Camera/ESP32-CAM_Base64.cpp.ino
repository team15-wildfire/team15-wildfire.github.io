//https://github.com/mobizt/Firebase-ESP32 //firebase library
//https://github.com/fustyles/Arduino/tree/master/ESP32-CAM_Firebase //camera library
//copyright information for the github information that I got the library header files from 

const char* ssid = "Poussay"; //wifi id name
const char* password = "about.059.pulse"; //wifi password

String FIREBASE_HOST = "team15-wildfire-test.firebaseio.com"; //firebase website name
String FIREBASE_AUTH = "P7adK8risk2kaw5Q6rcEr46EYdDMCGTU0DO7zcaF"; //firebase secret authentication code

#include "FirebaseESP32.h"
FirebaseData firebaseData;

#include <WiFi.h>
#include "soc/soc.h"
#include "soc/rtc_cntl_reg.h"
#include "Base64.h" //necesarry header files included
#include "esp_camera.h"

//defining pins for the ESP32 camera
#define PWDN_GPIO_NUM     32
#define RESET_GPIO_NUM    -1
#define XCLK_GPIO_NUM      0
#define SIOD_GPIO_NUM     26
#define SIOC_GPIO_NUM     27

#define Y9_GPIO_NUM       35
#define Y8_GPIO_NUM       34
#define Y7_GPIO_NUM       39
#define Y6_GPIO_NUM       36
#define Y5_GPIO_NUM       21
#define Y4_GPIO_NUM       19
#define Y3_GPIO_NUM       18
#define Y2_GPIO_NUM        5
#define VSYNC_GPIO_NUM    25
#define HREF_GPIO_NUM     23
#define PCLK_GPIO_NUM     22

int iInt = 0; //intializing iterator for when embedding into the firebase to ensure it embedds in chronological order 
String iString = "0";

void setup() { 
  WRITE_PERI_REG(RTC_CNTL_BROWN_OUT_REG, 0);
    
  Serial.begin(115200); //setting baud rate
  
  WiFi.begin(ssid, password); //connecting to wifi with id and password

  delay(5000); //wait 5 seconds 
  while (WiFi.status() != WL_CONNECTED) //if not connected to wifi
   {
     ESP.restart(); //then restart the ESP32
     delay(5000); //wait 5 seconds
   }
  //configure all of the pins via the header files
  camera_config_t config;
  config.ledc_channel = LEDC_CHANNEL_0;
  config.ledc_timer = LEDC_TIMER_0;
  config.pin_d0 = Y2_GPIO_NUM;
  config.pin_d1 = Y3_GPIO_NUM;
  config.pin_d2 = Y4_GPIO_NUM;
  config.pin_d3 = Y5_GPIO_NUM;
  config.pin_d4 = Y6_GPIO_NUM;
  config.pin_d5 = Y7_GPIO_NUM;
  config.pin_d6 = Y8_GPIO_NUM;
  config.pin_d7 = Y9_GPIO_NUM;
  config.pin_xclk = XCLK_GPIO_NUM;
  config.pin_pclk = PCLK_GPIO_NUM;
  config.pin_vsync = VSYNC_GPIO_NUM;
  config.pin_href = HREF_GPIO_NUM;
  config.pin_sscb_sda = SIOD_GPIO_NUM;
  config.pin_sscb_scl = SIOC_GPIO_NUM;
  config.pin_pwdn = PWDN_GPIO_NUM;
  config.pin_reset = RESET_GPIO_NUM;
  config.xclk_freq_hz = 20000000;
  config.pixel_format = PIXFORMAT_JPEG;
 
  config.frame_size = FRAMESIZE_UXGA; //set frame size to UXVGA
  config.jpeg_quality = 1;  //set quality to 1 in order to get the highest quality
  config.fb_count = 2; 
  
  esp_err_t err = esp_camera_init(&config); 
}
 
void loop() { 
  sensor_t * s = esp_camera_sensor_get(); //get the image
  s->set_framesize(s, FRAMESIZE_QQVGA);  // set framesize to QQVGA 
 
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH); //connect to firebase with the defined id and code

  String jsonData = Photo2Base64(); //convert the photo to base64 in order to embedd into the firebase
  String photoPath = "datasets/" + iString + "/image"; //set the photopat for how it will embedd into the firebase

  Firebase.setString(firebaseData, photoPath, jsonData)// push the base64 string of the photo to the firebase

   iInt =  iString.toInt(); //iterate up by 1 for embedding into the firebase
   iInt = iInt + 1;
   iString = String(iInt);
   
for (int p = 0; p < 14; p++) { //send zeros for image for all datasets in firebase that do not have a picture
   Firebase.setString(firebaseData, "datasets/" + iString + "/image", "0"); 
   iInt =  iString.toInt();
   iInt = iInt + 1;
   iString = String(iInt);
}
  delay(5000); // wait 5 seconds
}

String Photo2Base64() { //photo to base 64 function code 
    camera_fb_t * fb = NULL;
    fb = esp_camera_fb_get();  
    if(!fb) {
      Serial.println("Camera capture failed");
      return "";
    }
  
    String imageFile = "data:image/jpeg;base64,";
    char *input = (char *)fb->buf;
    char output[base64_enc_len(3)];
    for (int i=0;i<fb->len;i++) {
      base64_encode(output, (input++), 3);
      if (i%3==0) imageFile += urlencode(String(output));
    }

    esp_camera_fb_return(fb);
    
    return imageFile;
}

//https://github.com/zenmanenergy/ESP8266-Arduino-Examples/
String urlencode(String str) //encoding the url 
{
    String encodedString="";
    char c;
    char code0;
    char code1;
    char code2;
    for (int i =0; i < str.length(); i++){
      c=str.charAt(i);
      if (c == ' '){
        encodedString+= '+';
      } else if (isalnum(c)){
        encodedString+=c;
      } else{
        code1=(c & 0xf)+'0';
        if ((c & 0xf) >9){
            code1=(c & 0xf) - 10 + 'A';
        }
        c=(c>>4)&0xf;
        code0=c+'0';
        if (c > 9){
            code0=c - 10 + 'A';
        }
        code2='\0';
        encodedString+='%';
        encodedString+=code0;
        encodedString+=code1;
        //encodedString+=code2;
      }
      yield();
    }
    return encodedString;
}
