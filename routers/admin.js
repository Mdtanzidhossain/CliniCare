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