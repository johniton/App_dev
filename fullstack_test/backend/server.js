const express = require('express');
const cors = require('cors');
const jwt = require('jsonwebtoken');
// const { PrismaClient } = require('@prisma/client');
const { PrismaClient } = require('./generated/prisma');

const { createClient } = require('@supabase/supabase-js');
require('dotenv').config();

const app = express();
const prisma = new PrismaClient();
const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

app.use(cors());
app.use(express.json());


function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (!token) return res.sendStatus(401);

  try {
    const payload = jwt.decode(token);
    console.log('Decoded JWT:', payload);  // Debugging the JWT payload
    req.user = payload;
    next();
  } catch (err) {
    console.error('Error decoding JWT:', err);  // Log errors for better debugging
    res.sendStatus(403);
  }
}

// CREATE Task
app.post('/tasks', authenticateToken, async (req, res) => {
  const { title } = req.body;
  try {
    const task = await prisma.task.create({
      data: {
        title,
        userId: req.user.sub, // user ID from Supabase JWT
      },
    });
    res.json(task);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// READ Tasks
app.get('/tasks', authenticateToken, async (req, res) => {
  try {
    const tasks = await prisma.task.findMany({
      where: {
        userId: req.user.sub,
      },
    });
    res.json(tasks);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// UPDATE Task
app.put('/tasks/:id', authenticateToken, async (req, res) => {
  const { title } = req.body;
  const { id } = req.params;
  try {
    const task = await prisma.task.update({
      where: { id: Number(id) },
      data: { title },
    });
    res.json(task);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// DELETE Task
app.delete('/tasks/:id', authenticateToken, async (req, res) => {
  const { id } = req.params;
  try {
    await prisma.task.delete({
      where: { id: Number(id) },
    });
    res.json({ message: 'Task deleted' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(3000, () => console.log('Server running on http://localhost:3000'));

