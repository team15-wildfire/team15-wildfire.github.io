This code takes a picture from the OV2640, then encodes the picture in base 64, and creates a url. The firebase cannot embed Jpeg files directly but can embed a link to a picture. This URL is then pushed into the firebase.

Here is the link to the source library that I used to configure the camera:
https://github.com/fustyles/Arduino/tree/master/ESP32-CAM_Firebase

Here is a link to the source library I used to connect to firebase:
https://github.com/mobizt/Firebase-ESP32

I largely based off my code from their example starter code. I added and changed lines as I saw fit for our specific application.

Abbigail Brown
