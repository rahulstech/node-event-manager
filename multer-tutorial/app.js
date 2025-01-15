
/**
 * learnings:
 * 1. __dirname and __filename are available when commonjs module type is set in package.json. in ES module these are undefined
 * 
 * 2. process.cwd() vs __dirname: __dirname returns the directory where the current script is saved. process.cwd() returns the directory
 *    from which the current script is run. for example: let the script path /home/user/node-examples/app/index.js. currently i am in /home/user/node-example/
 *    and i run script from here with 'node app/index.js". then __dirname = /home/user/node-example/app/ and process.cwd() = /home/user/node-example.
 *    NOTE: path.resolve('media') will resolve it using process.cwd() but path.resolve(__dirname, 'media') with resolve it using __dirname
 * 
 * 3. cURL fileupoad: in cURL 'fieldname=@/path/to/file/example.ext' will upload the file example.ext.
 *    NOTE: `@` before the pathname of the file, it is important and denotes that this is the path of the file to upload. without it the value is considered as plain text.
 *    example: curl -X POST -F "image=@/home/user/Picture/flowers.jpg" 'http://example.com/upload'
 * 
 * 
 * 
 */
const express = require('express')

const multer = require('multer')

const path = require('node:path')

const multipartmw = multer({ dest: path.resolve(__dirname, './uploads')})

const server = express()

server.post('/upload', multipartmw.single('image'), (req, res) => {
    const { body, file } = req

    console.log('body: ', body)
    console.log('file: ', file)

    res.send('success\n')
})

const port = 3000
server.listen(port, () => console.log(`server listening on port ${port}`))