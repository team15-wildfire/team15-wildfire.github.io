

// Your web app's Firebase configuration
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

var dataset = firebase.database().ref("dataset");

// write new dataset to database

 var submitDataset = function () {

  // Get input values from each of the form elements
  var nodepos = $("#talknodepos").val();
  var time = $("#talktime").val();
  var temp = $("#talktemp").val();
  var co = $("#talkco").val();

  // Push a new dataset to the database using those values
  dataset.push({
    "nodepos": nodepos,
    "time": time,
    "temp": temp,
    "co": co
  });
};

// Get the single most recent dataset from the database and
// update the table with its values. This is called every time the child_added
// event is triggered on the datasets Firebase reference, which means
// that this will update EVEN IF you don't refresh the page. Magic.
dataset.limitToLast(1).on('child_added', function(childSnapshot) {
  // Get the dataset data from the most recent snapshot of data
  // added to the datasets list in Firebase
  dataset = childSnapshot.val();

  // Update the HTML to display the dataset text
  $("#nodepos").html(dataset.nodepos)
  $("#time").html(dataset.time)
  $("#temp").html(dataset.temp)
  $("#co").html(dataset.co)

  
});

// When the window is fully loaded, call this function.
// Note: because I am attaching an event listener to a particular HTML element
// in this function, I can't do that until the HTML element in question has
// been loaded. Otherwise, I'm attaching our listener to nothing, and no code
// will run when the submit button is clicked.
$(window).load(function () {

  // Find the HTML element with the id datasetForm, and when the submit
  // event is triggered on that element, call submitDataset.
  $("#datasetForm").submit(submitDataset);

});
