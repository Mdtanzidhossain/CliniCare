const http = require('http')
const path = require('path')
const bodyParser = require('body-parser')
const express = require('express')
const app = express()

const mongoConnect = require('./utils/db').mongoConnect
const User = require('./models/user')

const { send404 } = require('./controllers/404')

app.set('view engine', 'ejs')
app.set('views', 'views') // where to find pug templates

app.use(bodyParser.urlencoded({ extended: false })) // middleware
app.use(express.static(path.join(__dirname, 'public'))) // to make css work

const adminRoutes = require('./routes/admin')
const shopRoutes = require('./routes/shop')

app.use((req, res, next) => {
  User.findById('627f21beef93e88002e26b49')
    .then((user) => {
      req.user = new User(user.name, user.email, user.cart, user._id)
      next()
    })
    .catch((err) => console.log(err))
})

app.use('/admin', adminRoutes)
app.use(shopRoutes)
app.use(send404)

mongoConnect(() => {
  app.listen(3200)
})

// const { requestHandler } = require('./routes')
// const server = http.createServer(app)

// app.listen(3200)
