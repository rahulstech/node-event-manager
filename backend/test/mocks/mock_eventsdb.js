


const mockEventDB = () => {
    const module_path = '../../src/database/eventsdb.js'
    
    jest.mock(module_path, () => {
        const originalModule = jest.requireActual(module_path)
    
        return {
            ...originalModule,
            
            EventDB: {
                create: function() { return this },
    
                createEvent: jest.fn(),
    
                getAllEvents: jest.fn(),
    
                filterEvents: jest.fn(),
    
                getEventById: jest.fn(),
    
                updateEvent: jest.fn(),
    
                addGuestForEvent: jest.fn(),
    
                getAllGuestsForEvent: jest.fn(),
    
                filterGuestsForEvent: jest.fn(),
    
                updateGuest: jest.fn(),
    
                removeGuest: jest.fn()
            }
        }
    })
}

module.exports = {
    mockEventDB
}