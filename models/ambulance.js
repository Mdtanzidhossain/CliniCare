const mongodb = require('mongodb')
const getDb = require('../utils/db').getDb

class Ambulance {
  constructor(name, imageUrl, description, phone, id) {
    this.name = name
    this.imageUrl = imageUrl
    this.description = description
    this.phone = phone
    this._id = id ? new mongodb.ObjectId(id) : null
  }
  
}