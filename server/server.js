import config from './../config/config'
import app from './express'
import mongoose from 'mongoose'

// Connection URL
mongoose.Promise = global.Promise
mongoose.connect(config.mongoUri, { useNewUrlParser: true, useCreateIndex: true, useUnifiedTopology: true, useFindAndModify: false })
mongoose.connection.on('error', (err) => {
  console.error('MongoDB connection error:', err)
  throw new Error(`unable to connect to database: ${config.mongoUri}`)
})

mongoose.connection.once('open', () => {
  console.log('MongoDB connected successfully')
})

app.listen(config.port, (err) => {
  if (err) {
    console.log(err)
  }
  console.info('Server started on port %s.', config.port)
<<<<<<< HEAD
})
=======
})
>>>>>>> 6dd87d4 (wait before mongo)
