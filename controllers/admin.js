const Product = require('../models/product')
const Driver = require('../models/driver')
const Ambulance = require('../models/ambulance')
const { ObjectId } = require('mongodb')

exports.getAddProduct = (req, res, next) => {
  //   next() // allows the req to continue to the next middleware in line
  // res.sendFile(path.join(rootDir, 'views', 'add-product.html'))
  res.render('admin/edit-product', {
    pageTitle: 'Add Product',
    path: '/admin/add-product',
    editing: false,
  })
}



exports.getAddDriver = (req, res, next) => {
  res.render('admin/edit-driver', {
    pageTitle: 'Add Driver',
    path: '/admin/add-driver',
    editing: false,
  })
}

exports.postAddDriver = (req, res, next) => {
  const { name, imageUrl, description, phone } = req.body
  const driver = new Driver(
    name,
    imageUrl,
    description,
    phone,
    null
    // req.user._id
  )
  driver
    .save()
    .then((result) => {
      console.log('Created Driver')
      // res.redirect('/admin/drivers')
    })
    .catch((e) => {
      console.log(e)
    })
  // res.redirect('/')
}

