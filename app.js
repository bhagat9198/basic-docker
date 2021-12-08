const express = require('express');
const app = express();
const PORT = 5000;

app.use('/', (req, res, next) => {
  res.send('hello') 
})

app.listen(PORT, () => {
  console.log(`Connected On ${PORT}`);
})     