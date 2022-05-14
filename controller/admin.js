const Ambulance = require('../models/ambulance')
const { ObjectId } = require('mongodb')

exports.getAddAmbulance = (req, res, next) => {
    res.render('admin/edit-driver', {
      pageTitle: 'Add Driver',
      path: '/admin/add-driver',
      editing: false,
    })
  }
