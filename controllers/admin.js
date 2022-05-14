const Product = require('../models/product')
const Driver = require('../models/driver')
const Ambulance = require('../models/ambulance')
const { ObjectId } = require('mongodb')



exports.postAddProduct = (req, res, next) => {
  const { title, imageUrl, price, description } = req.body
  const product = new Product(
    title,
    imageUrl,
    description,
    price,
    null,
    req.user._id
  )
  product
    .save()
    .then((result) => {
      console.log('Created Product')
      res.redirect('/admin/products')
    })
    .catch((e) => {
      console.log(e)
    })
  // res.redirect('/')
}



exports.getProducts = (req, res, next) => {
  Product.fetchAll()
    .then((products) => {
      res.render('admin/products', {
        prods: products,
        pageTitle: 'Admin Products',
        path: '/admin/products',
      })
    })
    .catch((e) => console.log(e))
}

exports.getEditProduct = (req, res, next) => {
  const editMode = req.query.edit
  if (!editMode) {
    return res.redirect('/')
  }
  const productID = req.params.productId
  Product.findById(productID)
    .then((product) => {
      if (!product) {
        return res.redirect('/')
      }
      res.render('admin/edit-product', {
        pageTitle: 'Edit Product',
        path: '/admin/edit-product',
        editing: editMode,
        product: product,
      })
    })
    .catch((e) => {
      console.log(e)
    })
}

exports.postEditProduct = (req, res, next) => {
  const productID = req.body.productId
  const updatedTitle = req.body.title
  const updatedPrice = req.body.price
  const updatedImageUrl = req.body.imageUrl
  const updatedDesc = req.body.description
  const product = new Product(
    updatedTitle,
    updatedImageUrl,
    updatedDesc,
    updatedPrice,
    productID
  )
  product
    .save()
    .then((result) => {
      console.log('Updated Product')
      res.redirect('/admin/products')
    })
    .catch((e) => console.log(e))
}

exports.postDeleteProduct = (req, res, next) => {
  const productID = req.body.productId
  Product.deleteById(productID)
    .then(() => {
      console.log('Product Deleted')
      res.redirect('/admin/products')
    })
    .catch((err) => {
      console.log(err)
    })
}
