
/**
 * Learnings:
 * 
 * 1. use of multer array(): accept multiple files with same field name by multer.array(filedname [, maxFilesCount])
 * 
 * 2. file filtering: filter the incomming files with fileFilter method. this method is called before saving the file in server.
 */
const multer = require('multer')
const express = require('express')
const path = require('node:path')

const mwGallery = multer({ 
    dest: path.resolve(__dirname, 'uploads'),
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

const server = express()

server.post('/gallery', mwGallery.array('album'), (req, res) => {
    const files = req.files
    const accepted = files ? files.map(e => e.originalname) : [] 
    console.log('info of accepted files ', accepted)

    res.status(200).json({ accepted })
})

server.listen(3000, () => console.log('server listening at 3000'))