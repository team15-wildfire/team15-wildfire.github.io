
var firebaseConfig = {
  apiKey: "AIzaSyCSf68r57bQOzB2NyRCQg6pm2fPjgRdj_U",
  authDomain: "team15-wildfire-test.firebaseapp.com",
  databaseURL: "https://team15-wildfire-test.firebaseio.com",
  projectId: "team15-wildfire-test",
  storageBucket: "team15-wildfire-test.appspot.com",
  messagingSenderId: "227586916308",
  appId: "1:227586916308:web:c7525b7bd868c9835ee041"
};
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);

  function sendEmail(Body,To) {
      Email.send({
        Host : "smtp.mailtrap.io",
        Username : "e5b5aa05a65ff1",
        Password : "8698802fd201d8",
        To : 'Testuser@emailcom',
        From : "j.r.ary@tamu.edu",
        Subject : "BOWDS Fire alarm! URGENT!",
        Body : Body
      })
      .then(function(message){
        alert("mail sent successfully")
        
      });
  }
// Reference to the datasets object in your Firebase database
var datasets = firebase.database().ref("datasets");
var datasetsCheck = firebase.database().ref("datasets");


// Save a new dataset to the database, using the input in the form
var submitdataset = function () {

  // Get input values from each of the form elements
  var nodepos = $("#talknodepos").val();
  var time = $("#talktime").val();
  var temp = $("#talktemp").val();
  var co = $("#talkco").val();
  var smoke = $("#talksmoke").val();
  var image = $("#talkimage").val();

  // Push a new dataset to the database using those values
  datasets.push({
    "nodepos": nodepos,
    "time": time,
    "temp": temp,
    "co": co,
    "smoke": smoke,
    "image": image
  });
};




datasets.once("value").then(function(snapshot) {
snapshot.forEach(function(childSnapshot){
  // Get the dataset data from the most recent snapshot of data
  // added to the datasets list in Firebase
  
  let myHeading = document.querySelector('h2');
  childdataset = childSnapshot.val();
  var node_pos_val = childSnapshot.val().nodepos
  var time_val = childSnapshot.val().time
  var temp_val = childSnapshot.val().temp
  var co_val = childSnapshot.val().co
  var smoke_val = childSnapshot.val().smoke
  var image_val = childSnapshot.val().image
  if(image_val == 0){
    image_val = "https://static.wikia.nocookie.net/open-source-objects/images/e/e1/Black_Square_Asset.png/revision/latest?cb=20190430182133";
  }
  if(temp_val>120 && co_val>1500){
    myHeading.innerHTML='Alarm at node ' + node_pos_val +' at time ' + time_val;
    
  }
  
  else {}
  // Update the HTML to display the dataset text
   $("#nodepos").append("<p>" + node_pos_val + "</p><br>")
  $("#time").append("<p>" + time_val + "</p><br>")
  $("#temp").append("<p>" + temp_val + "</p><br>")
  $("#co").append("<p>" + co_val + "</p><br>")
  $("#smoke").append("<p>" + smoke_val + "</p><br>")
  $("#image").append("<img src=" + image_val + "></img><br>")
});
});

datasetsCheck.limitToLast(1).on('child_added', function(childSnapshot) {
  var node_pos_val_check = childSnapshot.val().nodepos
  var time_val_check = childSnapshot.val().time
  var temp_val_check = childSnapshot.val().temp
  var co_val_check = childSnapshot.val().co
  var smoke_val_check = childSnapshot.val().smoke
  if(temp_val_check>120 && co_val_check>1500){
    Body="There is an alarm going off at node "+node_pos_val_check+" at time "+time_val_check+" with temperature "+temp_val_check+" (degrees farenheight), gas at a concentration of "+co_val_check+" parts per million"+"and at a smoke concentration of "+smoke_val_check+" parts per million"
   sendEmail(Body);
    
  }
  
  else {}
}); 


// When the window is fully loaded, call this function.
// tells the thing to update when the submit button is pressed, makes it so the user doesn't have to reload the page to get new data
$(window).load(function () {

  // Find the HTML element with the id datasetForm, and when the submit
  // event is triggered on that element, call submitdataset.
  $("#datasetForm").submit(submitdataset);

});
/*let myButton = document.querySelector('button');
let myHeading2 = document.querySelector('h5');

function setUserEmail() {
  let myEmail = prompt('Please enter your email to recieve warning messages.');
  if(!myEmail || myEmail === null) {
    setUserEmail();
  } else {
    localStorage.setItem('email', myEmail);
    myHeading2.innerHTML = 'The email recieving a warning is ' + myEmail;
  }
}

if(!localStorage.getItem('email')) {
  setUserEmail();
} else {
  let storedEmail = localStorage.getItem('email');
  myHeading2.innerHTML = 'The email recieving a warning is ' + storedEmail;
}

myButton.onclick = function() {
  setUserEmail();
} */