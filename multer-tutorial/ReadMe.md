## Multer Tutorial

Multer is a node package to handle `multipart/form-data` request body. Multer can handle request body with files and text fields. 
Multer stores the parsed form data inside the `req` object with following prperties:
1. **`file`** contains the details of the file when only a file is uploaded 
2. **`files`** contains the details of all the files uploaded
3. **`body`** contains details other than file

`file` is an object containing the following details:

|Name | Type | Description |
|---|---|---|
|`fieldname`| String | file field name in the form
|`path` | String | the complete path or url where the uploaded file saved
|`originalname` | String | the name of the uploaded file
|`size`| Number | size of file in bytes |
| `destination` | String | storage directory path or url
| `filename` | String | name of the file by which the file will be saved
| `mimetype` | String | content-type header specified value for the file 
