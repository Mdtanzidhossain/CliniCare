const Product = require('../models/product')
// const Cart = require('../models/cart')

exports.getProducts = (req, res, next) => {
  // console.log(products)
  // res.sendFile(path.join(rootDir, 'views', 'shop.html'))
  Product.fetchAll()
    .then((products) => {
      res.render('shop/product-list', {
        prods: products,
        pageTitle: 'All Products',
        path: '/products',
      })
    })
    .catch((e) => {
      console.log(e)
    })
}

exports.getIndex = (req, res, next) => {
  Product.fetchAll()
    .then((products) => {
      res.render('shop/index', {
        prods: products,
        pageTitle: 'Shop',
        path: '/',
      })
    })
    .catch((e) => {
      console.log(e)
    })
}

exports.getProduct = (req, res, next) => {
  const productId = req.params.productId
  Product.findById(productId)
    .then((product) => {
      res.render('shop/product-detail', {
        product,
        pageTitle: product.title,
        path: '/products',
      })
    })
    .catch((e) => console.log(e))
}

exports.getCart = (req, res, next) => {
  req.user.getCart().then((cartProducts) => {
    res.render('shop/cart', {
      path: '/cart',
      pageTitle: 'Your Cart',
      products: cartProducts,
    })
  })
}

exports.postCart = (req, res, next) => {
  const productId = req.body.productId
  Product.findById(productId)
    .then((product) => {
      return req.user.addToCart(product)
    })
    .then((result) => {
      console.log(result)
      res.redirect('/cart')
    })
}

exports.postCartDeleteProduct = (req, res, next) => {
  const prodId = req.body.productId
  Product.findById(prodId)
    .then((product) => {
      return req.user.addToCart(product)
    })
    .then((result) => {
      console.log(result)
    })
}

exports.getCheckOut = (req, res, next) => {
  res.render('shop/checkout', {
    path: '/checkout',
    pageTitle: 'CheckOut',
  })
}

exports.getOrders = (req, res, next) => {
  res.render('shop/orders', {
    path: '/orders',
    pageTitle: 'Your Orders',
  })
}
