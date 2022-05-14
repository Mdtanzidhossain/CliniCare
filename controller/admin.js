const Ambulance = require('../models/ambulance')
const { ObjectId } = require('mongodb')

exports.getAddAmbulance = (req, res, next) => {
    res.render('admin/edit-driver', {
      pageTitle: 'Add Driver',
      path: '/admin/add-driver',
      editing: false,
    })
  }

  exports.postAddAmbulance = (req, res, next) => {
    const { name, imageUrl, description, phone } = req.body
    const driver = new Driver(
      name,
      imageUrl,
      description,
      phone,
      null
      // req.user._id
    )
    ambulance
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