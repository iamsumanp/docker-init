const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());

app.get('/', (req, res) => {
  res.json([
    {
      id: 1,
      title: 'Severance',
    },
    {
      id: 2,
      title: 'The BOYS',
    },
  ]);
});

app.listen(9000, () => {
  console.log('Express project is running on port 4000');
});
