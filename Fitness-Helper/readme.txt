Jasharn Thiraa
TCSS 460
Professor Al-Masri
7/23/2023
Assignment 3


When you first open up the website you will arrive to the home page which has a niec picture and a card explaining the functionalities of the website. After clicking the button you will be redirected to the functioning website and also at the information tab. At this point the user should enter their information that will allow all the rest service function to work. After the user has submitted their information, they may choose out of BMI, bodyfat, idealweight, calories burned. A good input of data that works is age:20, gender:male, height:70, weight:160. 

As the user clicks submit, the information will be sent to the route /BMI and the results will be ready when the user enters the tab. For body fat percentage, additional information of the waist size and neck size is required for the calculations. When the user hits the button the rest service at /bodyfat handles the calculations and returns the appropriate JSON data. I know testers will not want to measure to test this, a good input is waist: 20, neck: 10. 

With the iedal weight tab, the user can enter their desired BMI and this information will be sent to the /idealweight rest service which will calculate the results and return the json to be displayed. I normally use 20 for my inputs. 

The final section is calories burned which lets the user pick a number of choices (running, walking, biking, or yoga). Only one option can be chosen so far. The information sent to the /caloriesburned route is the users activity (which contains the value of intensity/min for the activity) and the minutes they did this for. 

Many of these tabs will only have 2 cards on them until a button is clicked to add on the results card for the specific tab they are on. I spent a good amount of time on adding links and other resources the user can use to gain more information about each topic. The way I run the back end is opening the node.js file and clicking terminal-> new terminal -> and then entering node node.js

This will run the server.Overall, this assignment was difficult but definitely a good experience and the best website I have made so far (in my opinion).

Github Address: https://github.com/Jthiara/Assignment3-tcss460.git

(also I was not able to add node_modules in the git since it exceeded the input of 100 files on github, but it should work fine without it as well).