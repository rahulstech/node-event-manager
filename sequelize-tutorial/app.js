const { sequelize, User, Post } = require('./models/index');

/**
 * Different methods are provided below to add a post to user.
 * In the first method createPost() method creates post assigns the foreign key implicitly
 * In the second and third methods i have to create the post first setting the foreign ket explicityly,
 * then setUser on post or addPost on user
 */

// this is the recommended way, because setting the foreign key is done implicitly
async function addPost_FirstMethod(user, post) {
    await user.createPost(post)
}

// this is the second way, where i have to set the foreign key explicitly
async function addPost_SecondMethod(user, post) {
    const postModel = await Post.create({
        ...post,
        UserId: user.id
    })

    await postModel.setUser(user)
}

async function printAllPosts(user) {
    const posts = await user.getPosts() // returns an array

    for (const post of posts) {
        const userOfPost = await post.getUser()

        // two different ways of getting field value of a modle is shown below
        // 1. instance.fieldName
        // 2. instance.get('fieldName')
        console.log("=========================================================================================")
        console.log('Post: ', post.toJSON(), ` and user: ${userOfPost.username} and ${userOfPost.get('email')}`)
    }
}

// this is the third way, here i also have to set the foreign key explicitly
async function addPost_ThirdMethod(user, post) {
    const postModel = await Post.create({
        ...post,
        UserId: user.id
    })

    await user.addPost(postModel)
}


async function addTag(post, tag) {
    
}

(async () => {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');

        await sequelize.sync({ alter: true });
        console.log('Database has been synced.');

        const user = await User.create({ username: 'iamjohn', email:'iamjohn@gmail.com' })

        console.log('User:', user.toJSON())

        // adding 3 posts in 3 different ways

        await addPost_FirstMethod(user, { 
            title:'My first Post', 
            content: 'This is my first post. hope you will like it.',
            unknownField: 'This field will be ignored'
        })

        await addPost_SecondMethod(user,  { 
            title: 'My Second Post',
            content: 'Most of you liked my first post. So, i get encouraged and writing this second post.'
        })

        await addPost_ThirdMethod(user,  { 
            title: 'My Third Post',
            content: 'Ok let\'s continue writing the third post.'
        })

        // printing all posts 

        printAllPosts(user)
        
    } catch (error) {
        console.error('Error:', error);
    }
})();
