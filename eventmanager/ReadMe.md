## About EventManager
 
EventManager keeps record of events and guests for each events. Event has event id, title, description, 
start date time, end date time, organizer, venu and status: PENDING, RUNNING, FINISHED, CANCELED. Each event has its own list of guest.
Guest list has guest id, first name, last name, age, sex, photo, is present, enter date time, exit date time.
For data storage json files are used. Each event data with guest list is stoted in a seperate json file. 

### Features:
1. get all events: returns list of event with id, title, organizer, venu and status
2. filter event by keyward matches title and status: returns list of event with id, title, organizer, venu and status
3. get event details by event id: returns the event if found
4. create new event: return created event
5. update event: title, description, status, start and end date time
6. get event guest list: returns id, full name, photo, sex
7. add guest: returns created guest 
8. update guest: firstname, lastname, photo, is present, sex, age, enter and exit date time
9. delete guest by id
10. search guest by keyword matched first or last name

## API

| HTTP Method | Path | Request Type | Response Type | Description |
|---|:---:|:---|:---:|:---|
|1. **GET**|`/api/v1/events`||`application/json`| returns list of all events|
|2. **GET**|`/api/v1/events/filter?k=***&status=***&venu=***&organizer=***`||`application/json`| filters the events by given query parameters and returns a list of matched events |
|3. **GET**|`/api/v1/events/:eventId`||`application/json`| retuns the event by `eventId` if found |
|4. **POST**|`/api/v1/events`|`multipart/form-data`|`application/json`| creates new post and returns the newly created event |
|5. **PUT**|`/api/v1/events/:eventId`|`multipart/form-data`|`application/json`| updates an event by id `eventId` and returns the updated event |
|6. **GET**|`/api/v1/events/:eventId/guests`||`application/json`| returns list of all guests for the event with  id`eventId`|
|7. **POST**|`/api/v1/events/:eventId/guests`|`multipart/form-data`|`application/json`| add a new guest and the newly created guest |
|8. **PUT**|`/api/v1/guests/:guestId`|`multipart/form-data`|`application/json`| updated the guest by `guestId` and returns the updated guest |
|9. **DELETE**|`/api/v1/guests/:guestId`||`application/json`| deletes the guest by `guestId` |
|10. **GET**|`/api/v1/events/:eventId/guests/search?k=***`||`application/json`| searchs guests that contain the key word in first name and/or last and returns a list of matched guests for the event with id `eventId` |

### Sample Response

1. `/api/v1/events`
    
    ```json
    {
        "code": 200,
        "message": "event created",
        "data": [
            {
                "id": 1,
                "title": "event1",
                "organizer": "organizer1",
                "venu": "venu1",
                "status": "COMPLETE"
            },
            {
                "id": 2,
                "title": "event2",
                "organizer": "organizer2",
                "venu": "venu2",
                "status": "CANCELED"
            },
            {
                "id": 3,
                "title": "event3",
                "organizer": "organizer1",
                "venu": "venu3",
                "status": "PENDING"
            },
        ]
    }
    ```

2. `/api/v1/events/filter?k=***&status=***&venu=***&organizer=***`

    ```json
    {
        "code": 200,
        "message": "successful",
        "data": [
            {
                "id": 1,
                "title": "event1",
                "organizer": "organizer1",
                "venu": "venu1",
                "status": "COMPLETE"
            },
            {
                "id": 2,
                "title": "event2",
                "organizer": "organizer2",
                "venu": "venu2",
                "status": "CANCELED"
            },
            {
                "id": 3,
                "title": "event3",
                "organizer": "organizer1",
                "venu": "venu3",
                "status": "PENDING"
            },
        ]
    }
    ```

3. `/api/v1/events/:eventId`
    
    on successful
    
    ```json
    {
        "code": 200,
        "message": "successful",
        "data": {
            "id": 1,
            "title": "event1",
            "description": "this is the description of event1",
            "organizer": "organizer1",
            "venu": "venu2",
            "start": "2023-05-15 14:30",
            "end": "2023-05-15 16:00",
            "status": "CANCELED"
        }
    }
    ```

    on not found
    
    ```json
    {
        "code": 404,
        "message": "no event found <eventId>",
    }
    ```

4. `/api/v1/events`

    ```json
    {
        "code": 200,
        "message": "successful",
        "data": {
            "id": 1,
            "title": "event1",
            "description": "this is the description of event1",
            "organizer": "organizer1",
            "venu": "venu2",
            "start": "2023-05-15 14:30",
            "end": "2023-05-15 16:00",
            "status": "CANCELED"
        }
    }
    ```

5. `/api/v1/events/:eventId`

    ```json
    {
        "code": 200,
        "message": "event updated",
        "data": {
            "id": 1,
            "title": "event1",
            "description": "this is the description of event1",
            "organizer": "organizer1",
            "venu": "venu2",
            "start": "2023-05-15 14:30",
            "end": "2023-05-15 16:00",
            "status": "CANCELED"
        }
    }
    ```

6. `/api/v1/events/:eventId/guests`

    when event with id `eventId` exists
    ```json
    {
        "code": 200,
        "message": "successful",
        "data": {
            "event": {
                "id": 1,
                "title": "event1",
                "description": "this is the description of event1",
                "organizer": "organizer1",
                "venu": "venu2",
                "start": "2023-05-15 14:30",
                "end": "2023-05-15 16:00",
                "status": "CANCELED"
            },
            "guests": [
                {
                    "id": 1,
                    "eventId": 1,
                    "firstname": "person1 fn",
                    "lastname": "person1 ln",
                    "age": 34,
                    "sex": "MALE",
                    "guest_image_path": "/path/to/guest/image/image.ext",
                    "is_present": "NOTSET",
                    "enter": "2023-05-15 14:46",
                    "exit": "2023-05-15 15:55"
                },
                {
                    "id": 2,
                    "eventId": 1,
                    "firstname": "person2 fn",
                    "lastname": "person2 ln",
                    "age": 28,
                    "sex": "FEMALE",
                    "guest_image_path": "/path/to/guest/image/image.ext",
                    "is_present": "NOTSET",
                    "enter": "2023-05-15 14:15",
                    "exit": "2023-05-15 16:15"
                },
            ],
        }
    }
    ```

    when event with id `eventId` does not exist
    ```json
    {
        "code": 404,
        "message": "no event found with id <eventId>"
    }
    ```

7. `/api/v1/events/:eventId/guests`

    when event with id `eventId` is found and saved successfully
    ```json
    {
        "code": 200,
        "message": "guest added",
        "data": {
            "id": 1,
            "eventId": 1,
            "firstname": "person1 fn",
            "lastname": "person1 ln",
            "age": 34,
            "sex": "MALE",
            "guest_image_path": "/path/to/guest/image/image.ext",
            "is_present": "NOTSET",
            "enter": "2023-05-15 14:46",
            "exit": "2023-05-15 15:55"
        }
    }
    ```

    when event with id `eventId` is found and saved successfully
    ```json
    {
        "code": 404,
        "message": "no event found with id <eventId>",
    }
    ```

    
8. `/api/v1/guests/:guestId`

    on successful

     ```json
    {
        "code": 200,
        "message": "guest updated",
        "data": {
            "id": 1,
            "eventId": 1,
            "firstname": "person1 fn",
            "lastname": "person1 ln",
            "age": 34,
            "sex": "MALE",
            "guest_image_path": "/path/to/guest/image/image.ext",
            "is_present": "NOTSET",
            "enter": "2023-05-15 14:46",
            "exit": "2023-05-15 15:55"
        }
    }
    ```

    on not found

     ```json
    {
        "code": 404,
        "message": "no guest found with id <gurestId>",
    }
    ```

9. `/api/v1/guests/:guestId`

    on successful
    ```json
    {
        "code": 200,
        "message": "guest removed"
    }
    ```

    on not found
     ```json
    {
        "code": 404,
        "message": "no guest found with id <gurestId>",
    }
    ```

10. `/api/v1/events/:eventId/guests/search?k=***`

    when event with id `eventId` exists
    ```json
    {
        "code": 200,
        "message": "successful",
        "data": {
            "event": {
                "id": 1,
                "title": "event1",
                "description": "this is the description of event1",
                "organizer": "organizer1",
                "venu": "venu2",
                "start": "2023-05-15 14:30",
                "end": "2023-05-15 16:00",
                "status": "CANCELED"
            },
            "guests": [
                {
                    "id": 1,
                    "eventId": 1,
                    "firstname": "person1 fn",
                    "lastname": "person1 ln",
                    "age": 34,
                    "sex": "MALE",
                    "guest_image_path": "/path/to/guest/image/image.ext",
                    "is_present": "NOTSET",
                    "enter": "2023-05-15 14:46",
                    "exit": "2023-05-15 15:55"
                },
                {
                    "id": 2,
                    "eventId": 1,
                    "firstname": "person2 fn",
                    "lastname": "person2 ln",
                    "age": 28,
                    "sex": "FEMALE",
                    "guest_image_path": "/path/to/guest/image/image.ext",
                    "is_present": "NOTSET",
                    "enter": "2023-05-15 14:15",
                    "exit": "2023-05-15 16:15"
                },
            ],
        }
    }
    ```

    when event with id `eventId` does not exist
    ```json
    {
        "code": 404,
        "message": "no event found with id <eventId>"
    }
    ```
