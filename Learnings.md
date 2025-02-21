## Learning From EventManager

### Libraries And Frameworks

1. **Express.js:** for handling http request and response
2. **Multer:** for parsing request body
3. **Moment.js:** for parsing and formatting date time string and date time comparison
4. **Winston:** for efficient and organized logging
5. **Joi:** or validation
6. **Jest:** for unit testing

### Change Log

1. Initially i implemented:
        - all routes in `app.js`
        - `eventroutes.js` and `guestroutes.js` containing request handlers and middlewares for event and guest respectively
        - `multer` for processing `multipart` request body
        - `eventdb.js` for storing event guest data. initially data are stored in a maps only.

2. The initial prototype working fine. But there was a problem. These are:
        - data was stored in memory. so, it lost when server app is shutdown
        - when there was any error i could not understand at which stage the error occurred first
        - since no input validation is done therefore server stores event non accepted data

    To resolve the above problems i modified my app and implemented the following features:
        - data is stored in json file. when server starts it reads the json content and whenever any changes are made then it is written to the json immediately. this solved the data lost problem.
        - i used `Winston` logger to log every steps like where i am currently, which data i have received, which data i am sending, the error message etc. in a structured manner. `Winston` allow multiple transports feature which helpes to decide where to show or store the log messages. i configured `Winston` to show log messages in `console` when in `development` environment and in a `log` file when in `production` environment. to identify in which environment i an currently working i used `NODE_ENV` parameter in `.env` file. thus the problem of tracking the error is solved.
        - using `Joi` i created schemas for input data like which is required, what should be the data type, which set of values a field can take only etc. then used this schemas i validated the request body. when validated successfully then i proceed to save the data. thus i ensure that stored data are completely valid and consistent.

3. Even after the second upgrade i found that i am doing lot of duplicate thing. like:
        - some event db operations are copied multiple places.
        - project is divided in multiple parts. each part doing its own task. but if any part contains any bug then it produces unknown result. so, i have to fix the bug and and start form begining.

    To address these issues i did:
        - created a seperete data service classes. it is an abstraction layer over event database. i created `EventDataService` and `GuestDataService`. These services contain method that perform a perticular task only which may contain one or more db operations. whenever i need to do that task i can simply use that service method. it solved the problem of coping db operations multiple time
        - i wrote unit tests for methods. i tests methods for different inputs to ensure that perticular method is working as intended. i used `Jest` for unit testing. when all unit tests pass i ensure that all parts are functional and if any error arise then that not for malfunctioning method.

4. At this stage the project modular. Still the seperation of concern is not implemented properly. For example: the service class are implemented as middlewares. Therefore the service methods performing its own task as well as handling the request. Ideally service classes are not intended to handle request related logics. To address the issue project is restructured in 3 layers

        **services:** provides methods to perform a piece of task like validating input or performing a db operation etc.
        **controllers:** provides methods to tasks for a perticular endpoint. for example: there are seperate controller methods for performing each event CRUD operation. controller methods may use one or more service methods
        **routers:** installs the middlewares and controllers for a specific endpoint

    Also introduced `catchRequestHandlerAsync` method and `AppError` class.
        - AppError wraps each error and provides error message, http status code, a flag `isOperational` and stack. isOperational `true`, default value, means i don't need to stop the server after the error; like in case *404*, *400* etc. isOperational `false` means i need to stop the server after this error. 
        - now i can write async request handlers with out any `try...catch` and wrap it in catchRequestHandlerAsync.`catchRequestHandlerAsync` catches any uncaught error implecitly. if the caught error is an AppError then it pass the error to express error handler. if the caught error not an AppError instance then it wraps it in a AppError with `isOperation` set to `false` and pass to express handler. 
    
    