
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

// Reference to the datasets object in your Firebase database
var datasets = firebase.database().ref("datasets");


// Save a new dataset to the database, using the input in the form
var submitdataset = function () {

  // Get input values from each of the form elements
  var nodepos = $("#talknodepos").val();
  var time = $("#talktime").val();
  var temp = $("#talktemp").val();
  var co = $("#talkco").val();

  // Push a new dataset to the database using those values
  datasets.push({
    "nodepos": nodepos,
    "time": time,
    "temp": temp,
	"co": co
  });
};



// Get the single most recent dataset from the database and append it to the already shown data
datasets.once("value").then(function(snapshot) {
snapshot.forEach(function(childSnapshot){
  // Get the dataset data from the most recent snapshot of data
  // added to the datasets list in Firebase
  childdataset = childSnapshot.val();
  var node_pos_val = childSnapshot.val().nodepos
  var time_val = childSnapshot.val().time
  var temp_val = childSnapshot.val().temp
  var co_val = childSnapshot.val().co
  // Update the HTML to display the dataset text
   $("#nodepos").append("<p>" + node_pos_val + "</p><br>")
  $("#time").append("<p>" + temp_val + "</p><br>")
  $("#temp").append("<p>" + time_val + "</p><br>")
  $("#co").append("<p>" + co_val + "</p><br>") 

});
});
// When the window is fully loaded, call this function.
// tells the thing to update when the submit button is pressed, makes it so the user doesn't have to reload the page to get new data
$(window).load(function () {

  // Find the HTML element with the id datasetForm, and when the submit
  // event is triggered on that element, call submitdataset.
  $("#datasetForm").submit(submitdataset);

});