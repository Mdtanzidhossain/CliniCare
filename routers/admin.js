const path = require('path')
const express = require('express')
const router = express.Router()
const rootDir = require('../utils/path')
const {
  getAddProduct,
  getEditProduct,
  postAddProduct,
  getProducts,
  postEditProduct,
  postDeleteProduct,
  postAddDriver,
  getAddDriver,
  postAddAmbulance,
  getAddAmbulance,
} = require('../controllers/admin')
router.get('/add-product', getAddProduct)
router.get('/products', getProducts)
router.post('/add-product', postAddProduct)
router.get('/edit-product/:productId', getEditProduct)
router.post('/edit-product', postEditProduct)
router.post('/delete-product', postDeleteProduct)
router.post('/add-driver', postAddDriver)
router.get('/add-driver', getAddDriver)
router.get('/add-ambulance', getAddAmbulance)
router.post('/add-ambulance', postAddAmbulance)

module.exports = router