const express = require('express');

// setup express
const app = express();

// setup body parser middleware to conver to JSON and handle URL encoded forms
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
  extended: false
}));


app.listen(3000, () => console.log('Server listening on port 3000!'));;
