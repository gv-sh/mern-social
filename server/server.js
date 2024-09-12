import config from './../config/config'
import app from './express'
import mongoose from 'mongoose'

const connectWithRetry = () => {
  console.log('MongoDB connection with retry')
  mongoose.connect(config.mongoUri, { useNewUrlParser: true, useCreateIndex: true, useUnifiedTopology: true, useFindAndModify: false })
    .then(() => {
      console.log('MongoDB is connected')
      app.listen(config.port, (err) => {
        if (err) {
          console.log(err)
        }
        console.info('Server started on port %s.', config.port)
      })
    })
    .catch(err => {
      console.log('MongoDB connection unsuccessful, retry after 5 seconds.', err)
      setTimeout(connectWithRetry, 5000)
    })
}

connectWithRetry()
