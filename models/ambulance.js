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

  save() {
    const db = getDb()
    let dbOp
    if (this._id) {
      dbOp = db
        .collection('ambulance')
        .updateOne({ _id: this._id }, { $set: this })
    } else {
      dbOp = db.collection('ambulance').insertOne(this)
    }
    return dbOp
      .then((result) => {
        console.log(result)
      })
      .catch((err) => {
        console.log(err)
      })
  }
}

module.exports = Ambulance
