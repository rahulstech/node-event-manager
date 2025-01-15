/**
 * Learnings:
 * 
 * 1. use of multer array(): accept multiple files with same field name by multer.array(filedname [, maxFilesCount])
 * 
 * 2. file filtering: filter the incomming files with fileFilter method. this method is called before saving the file in server.
 * 
 * 3. use of multer fields(): accept multile files witch different field names by 
 *    multer.fields([ { fieldname1 [, maxFileCount ]}, {fieldname2 [,maxFileCount] }]). use this when there are files for different purposes.
 * 
 * 4. handler router error in express: to handle error in express i can add a custom middleware
 * 
 * 5. set limit: during multer creation, i can set limit object. limit object has 'fiels' property to set max number of files accepted in request.
 *    other important properties are
 *    parts: max number of file and non-file fields together
 *    fileds: max number of non-file fields
 *    fileSize: max file size in byes for each file
 */

const multer = require('multer')
const express = require('express')
const path = require('node:path')

const upload_dir = path.resolve(__dirname, 'uploads')

const server = express()

// multiple files with same field name

const multerForGallery = multer({ 
    dest: upload_dir,
    fileFilter: ( req, file, cb) => {
        // allow image files with type image/jpeg or extention jpg or jpeg only

        /** 
         * NOTE:
         * cb = callback(error: Error, allowFile: boolean) : if I pass a new Error as the first argument of cb
         * then multer will throw it and whole upload will fail. so pass null as first argument and true or false
         * to the 2nd argument for accepted or rejected respectively
         */
        const { originalname, mimetype } = file
        const ext = path.extname(originalname || '') // ext name starts with period (.)
        if (!mimetype || !ext) {
            console.log(`'${originalname}' is rejected: mimetype='${mimetype}' ext='${ext}'`)
            cb(null, false)
            return
        }
        const extLower = ext.toLowerCase()
        const mimetypeLower = mimetype.toLowerCase()
        if (mimetypeLower === 'image/jpeg' || extLower === '.jpg' || extLower === '.jpeg') {
            // it is a jpeg type image file
            cb(null, true)
        }
        else {
            // it is not a jepg type image file
            console.log(`'${originalname}' is rejected: mimetype='${mimetype}' ext='${ext}'`)
            cb(null, false)
        }
    },
})

const mwGallery = multerForGallery.array('album')

server.post('/gallery', mwGallery, (req, res) => {
    const files = req.files
    const accepted = files ? files.map(e => e.originalname) : [] 
    console.log('info of accepted files ', accepted)

    res.status(200).json({ accepted })
})

// multiple files with different field names

const multerForProfile = multer({
    dest: upload_dir,
    limits: { 
        files: 2, // max 2 files are accepted
    }
})

/**
 * The endpoint allow two types of file upload, named:
 * 1. profile_image
 * 2. cover_image
 * exatly 1 for each type of image. the maxCount property ensures it.
 * 
 * when more than maxCount files for the field is uploaded then multer throw a MulterError with error code
 */
const mwProfile = multerForProfile.fields([
    { name: 'profile_image', maxCount: 1 }, 
    { name: 'cover_image', maxCount: 1 }
])

server.post('/profile', mwProfile, (req, res) => {

    const accepted = {}

    if (req.files) {
        /**
         * res.files is an object containing each file fieldname as property. each of these properties are array or undefined 
         */

        const { profile_image, cover_image } = req.files
        if (profile_image && profile_image.length > 0) {
            const { originalname } = profile_image[0] 
            accepted['profile_image'] = originalname
        }
    
        if (cover_image && cover_image.length > 0) {
            const { originalname } = cover_image[0]
            accepted['cover_image'] = originalname
        }
    }

    console.log('files: ', req.files)
    console.log('accepted: ', accepted)

    res.status(200).json({ accepted })

})

// express way to handle error in any route: here added a middleware
// NOTE: that this middleware handle any error upto this point.
// i.e. errors in /gallery as well as /profile

// Observation: max profile_image = 1 and max cover_image = 1. therefore, if i upload 2 or more profile_image
// multer throws LIMIT_UNEXPECTED_FILE insted of LIMIT_FILE_COUNT. when it will throw LIMIT_FILE_COUNT?
// no in case when using multer.fields(). with fields() it may throw LIMIT_FILE_COUNT if 'limit.files' is set during
//  multer creation.

server.use((err, req, res, next) => {
    console.log(err)
    if (err instanceof multer.MulterError) {
        switch(err.code) {
            case 'LIMIT_UNEXPECTED_FILE': {
                res.status(400).send('Can not accept some of the files')
            }
            break
            case 'LIMIT_FILE_COUNT': {
                res.status(400).send('Too many fiels uploaded')
            }
        }
    }
    else {
        res.status(500).send(err.message)
    }
})

server.listen(3000, () => console.log('server listening at 3000'))