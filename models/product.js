const mongodb = require('mongodb')
const getDb = require('../utils/db').getDb
class Product {
  constructor(title, imageUrl, description, price, id, userId) {
    this.title = title
    this.price = price
    this.description = description
    this.imageUrl = imageUrl
    this._id = id ? new mongodb.ObjectId(id) : null
    this.userId = userId
  }
  save() {
    const db = getDb()
    let dbOp
    if (this._id) {
      // update the product
      dbOp = db
        .collection('products')
        .updateOne({ _id: this._id }, { $set: this })
    } else {
      dbOp = db.collection('products').insertOne(this)
    }
    return dbOp
      .then((result) => console.log(result))
      .catch((e) => {
        console.log(e)
      })
  }
  static fetchAll() {
    const db = getDb()
    return db
      .collection('products')
      .find()
      .toArray()
      .then((products) => {
        return products
      })
      .catch((e) => {
        console.log(e)
      })
  }

  static findById(prodId) {
    const db = getDb()
    return db
      .collection('products')
      .find({ _id: mongodb.ObjectId(prodId) })
      .next()
      .then((product) => {
        console.log(product)
        return product
      })
      .catch((e) => {
        console.log(e)
      })
  }

  static deleteById(prodId) {
    const db = getDb()
    return db
      .collection('products')
      .deleteOne({ _id: new mongodb.ObjectId(prodId) })
      .then((result) => {
        console.log('delete')
      })
      .catch((err) => {
        console.log(err)
      })
  }
}

module.exports = Product

// // const products = []
// const fs = require('fs')
// const path = require('path')
// const rootDir = require('../utils/path')

// const Cart = require('./cart')

// const p = path.join(rootDir, 'data', 'products.json') // save information as json in the data folder
// const getProductsFromFile = (cb) => {
//   fs.readFile(p, (err, fileContent) => {
//     if (err) {
//       return cb([])
//     }
//     return cb(JSON.parse(fileContent))
//   })
//   // return products
// }

// module.exports = class Product {
//   constructor(id, title, imageUrl, description, price) {
//     this.id = id
//     this.title = title
//     this.imageUrl = imageUrl
//     this.description = description
//     this.price = price
//   }

//   save() {
//     getProductsFromFile((products) => {
//       if (this.id) {
//         const existingProductIndex = products.findIndex(
//           (prod) => prod.id === this.id
//         )
//         const updatedProducts = [...products]
//         updatedProducts[existingProductIndex] = this
//         fs.writeFile(p, JSON.stringify(updatedProducts), (err) => {
//           console.log(err)
//         })
//       } else {
//         this.id = Math.random().toString()
//         products.push(this)
//         fs.writeFile(p, JSON.stringify(products), (err) => {
//           console.log(err)
//         })
//       }
//     })
//     // products.push(this)
//     // const p = path.join(rootDir, 'data', 'products.json') // save information as json in the data folder
//     // fs.readFile(p, (err, fileContent) => {
//     //   let products = []
//     //   if (!err) {
//     //     products = JSON.parse(fileContent)
//     //   }
//     //   products.push(this)
//     //   fs.writeFile(p, JSON.stringify(products), (err) => {
//     //     console.log(err)
//     //   })
//     // })
//   }

//   static fetchAll(cb) {
//     getProductsFromFile(cb)
//   }

//   static findById(id, cb) {
//     getProductsFromFile((products) => {
//       const product = products.find((p) => p.id === id)
//       cb(product)
//     })
//   }

//   static deleteById(id) {
//     getProductsFromFile((products) => {
//       const product = products.find((prod) => prod.id === id)
//       const updatedProducts = products.filter((prod) => prod.id !== id)
//       fs.writeFile(p, JSON.stringify(updatedProducts), (err) => {
//         if (!err) {
//           Cart.deleteProduct(id, product.price)
//         }
//       })
//     })
//   }
// }
