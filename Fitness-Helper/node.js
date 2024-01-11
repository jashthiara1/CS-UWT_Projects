// Jasharn Thiara
// Assignment 3
// TCSS 460
// Rest service

// import required module 
var express = require("express");
const cors = require('cors');
var app = express();
app.use(cors());

// define bmi route and use formula to calculate users bmi
app.get("/bmi", function (req, res) {

    // get height and weight from our query 
    const height = parseFloat(req.query.height);
    const weight = parseFloat(req.query.weight);

    // calculate body mass idnex 
    const bmi = 703 * weight / (height * height);

    res.json({ bmi: bmi });
});

// define body fat route and use formula to calculate users body fat
app.get("/bodyfat", function (req, res) {

    // for debugging
    console.log(req.query);

    // get necessary parameters
    const waist = parseFloat(req.query.waist);
    const neck = parseFloat(req.query.neck);
    const height = parseFloat(req.query.height);

    // calculate body fat percent
    bodyfat = Math.abs((86.010 * Math.log10(waist-neck))-(70.041 * Math.log10(height))+36.76);

    console.log(bodyfat)

    res.json({bodyfat: bodyfat});
});

// define ideal weight route and use forumale to calculate ideal weight for the user
app.get("/idealweight", function (req, res) {

    // get necessary paramters
    const desiredBMI = parseFloat(req.query.desiredBMI);
    const height = parseFloat(req.query.height);

    // calculate
    idealWt = (desiredBMI * 5) + (4 * (height-60));

    console.log(idealWt);

    res.json({idealWt: idealWt});
});

// define calories burned route that takes the activity value and calculates calories burned based on how many minutes the user worked out for
app.get("/caloriesburned", function (req, res) {

    const value = parseFloat(req.query.value);
    const minutes = parseFloat(req.query.minutes);

    cals = value * minutes;

    res.json({cals:cals});
});



// start the server listening for requests
app.listen(3000, 
    function () { 
        console.log("Server is running at http://localhost:3000/");
    }
);