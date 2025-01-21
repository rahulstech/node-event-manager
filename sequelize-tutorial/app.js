const { sequelize, User } = require('./models/index');

(async () => {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');

        await sequelize.sync();
        console.log('Database has been synced.');

        // Create a user
        const user = await User.create({
            username: 'iamrahul',
            email: 'emailme.rahul@gmail.com',
        });

        console.log('New user:', user.toJSON());
    } catch (error) {
        console.error('Error:', error);
    }
})();
