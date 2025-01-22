## Sequelize

### I am building

A blog post database in sqlite3 and sequelize orm. It has User, Post, and Tag models.

- **User** has id, username, and email. Username must be unique. Id is UUID auto-generated. Table name is **tbl_users**.
- **Post** has id, title, and content. Title is required for each post and must be up to 200 characters long. Id is UUID and auto-generated. Table name is **tbl_posts**.
- **Tag** has only name. It is required and unique and must be between 1 and 30 characters. Table name is **tbl_tags**.
- A user can have zero or multiple posts and each post belongs to one user.
- A post can have multiple tags and a tag can be used in multiple posts. Hence, Post and Tag have a **many-to-many** relation.
- I can search for a user by keyword matching the username, excluding the user who is searching.
- I can list all posts of a user **lazily**, *20* posts at a time. The posts list includes post id, title, and the first 120 characters from content as **short_content**.
- I can check a post by id. It provides post id, title, content, tags, and creator name.
- I can also list posts by tags lazily, 20 posts at a time. It will contain post id, post title, creator id, and creator name.
- I can update username and email. **Note** updated username must be unique.
- I can update post title and content.
- I can add and remove tags from post.
- I can delete a post by id.

### I am learning:

- [x] Creating and connecting to sqlite database
- [x] Creating models
- [x] Creating a new row in table
- [ ] Simple query using where
- [ ] Query to get selected columns
- [ ] Query with complex where
- [ ] Update specific column
- [x] One to many association
- [x] Many to many association
- [ ] Delete using where
