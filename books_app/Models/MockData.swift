import Foundation

// MARK: - Authors

extension Author {

    static let mockData: [Author] = [
        Author(
            name: "Khaled Hosseini",
            jobTitle: "Novelist",
            imageURL: "https://covers.openlibrary.org/a/olid/OL1412764A-M.jpg",
            biography: "Khaled Hosseini is an Afghan-American novelist and the author of The Kite Runner and A Thousand Splendid Suns.",
            rating: 4.6,
            category: .novelists
        ),
        Author(
            name: "Mark Manson",
            jobTitle: "Writer",
            imageURL: "https://covers.openlibrary.org/a/olid/OL2964000A-M.jpg",
            biography: "Mark Manson is an American author known for writing about personal development and modern life.",
            rating: 4.1,
            category: .writers
        ),
        Author(
            name: "Dan Brown",
            jobTitle: "Novelist",
            imageURL: "https://covers.openlibrary.org/a/olid/OL39307A-M.jpg",
            biography: "Dan Brown is an American thriller writer best known for The Da Vinci Code and his Robert Langdon novels.",
            rating: 4.0,
            category: .novelists
        ),
        Author(
            name: "George Orwell",
            jobTitle: "Novelist and Journalist",
            imageURL: "https://covers.openlibrary.org/a/olid/OL118077A-M.jpg",
            biography: "George Orwell was an English novelist and journalist best known for Nineteen Eighty-Four and Animal Farm.",
            rating: 4.8,
            category: .journalists
        ),
        Author(
            name: "James Clear",
            jobTitle: "Writer",
            imageURL: "https://covers.openlibrary.org/a/olid/OL7422948A-M.jpg",
            biography: "James Clear is an American author and speaker who writes about habits, decision-making, and continuous improvement.",
            rating: 4.5,
            category: .writers
        ),
        Author(
            name: "Paulo Coelho",
            jobTitle: "Novelist",
            imageURL: "https://covers.openlibrary.org/a/olid/OL66700A-M.jpg",
            biography: "Paulo Coelho is a Brazilian novelist whose internationally known works include The Alchemist.",
            rating: 4.3,
            category: .novelists
        ),
    ]
}

// MARK: - Vendors

extension Vendor {

    static let mockData: [Vendor] = [
        Vendor(
            title: "Wattpad",
            logoURL: "https://www.google.com/s2/favicons?domain=wattpad.com&sz=128",
            rating: 4.5,
            category: .poems
        ),
        Vendor(
            title: "Kuromi",
            logoURL: "https://www.google.com/s2/favicons?domain=sanrio.com&sz=128",
            rating: 4.8,
            category: .stationery
        ),
        Vendor(
            title: "Crane & Co",
            logoURL: "https://www.google.com/s2/favicons?domain=crane.com&sz=128",
            rating: 4.2,
            category: .stationery
        ),
        Vendor(
            title: "GoDaddy",
            logoURL: "https://www.google.com/s2/favicons?domain=godaddy.com&sz=128",
            rating: 4.1,
            category: .other
        ),
        Vendor(
            title: "Warehouse",
            logoURL: "https://www.google.com/s2/favicons?domain=warehouse.co.nz&sz=128",
            rating: 4.4,
            category: .stationery
        ),
        Vendor(
            title: "Peppa Pig",
            logoURL: "https://www.google.com/s2/favicons?domain=peppapig.com&sz=128",
            rating: 4.3,
            category: .other
        ),
        Vendor(
            title: "JSTOR",
            logoURL: "https://www.google.com/s2/favicons?domain=jstor.org&sz=128",
            rating: 4.6,
            category: .books
        ),
        Vendor(
            title: "Peloton",
            logoURL: "https://www.google.com/s2/favicons?domain=onepeloton.com&sz=128",
            rating: 4.4,
            category: .other
        ),
        Vendor(
            title: "Haymarket",
            logoURL: "https://www.google.com/s2/favicons?domain=haymarketbooks.org&sz=128",
            rating: 4.7,
            category: .books
        ),
    ]
}

// MARK: - Books

extension Book {

    static let mockData: [Book] = [
        Book(
            title: "The Kite Runner",
            description: "A moving novel about friendship, betrayal, guilt, and redemption set against the changing history of Afghanistan.",
            coverImageURL: "https://covers.openlibrary.org/b/isbn/9781594631931-L.jpg",
            price: 39.99,
            discount: 25,
            rating: 4.6,
            author: Author.mockData[0],
            vendor: Vendor.mockData[0]
        ),
        Book(
            title: "The Subtle Art of Not Giving a F*ck",
            description: "A direct, unconventional look at choosing what matters and accepting the difficult parts of life.",
            coverImageURL: "https://covers.openlibrary.org/b/isbn/9780062457714-L.jpg",
            price: 20.99,
            discount: nil,
            rating: 4.3,
            author: Author.mockData[1],
            vendor: Vendor.mockData[3]
        ),
        Book(
            title: "The Da Vinci Code",
            description: "Robert Langdon follows a trail of symbols and puzzles after a mysterious murder at the Louvre.",
            coverImageURL: "https://covers.openlibrary.org/b/isbn/9780307474278-L.jpg",
            price: 19.99,
            discount: 15,
            rating: 4.5,
            author: Author.mockData[2],
            vendor: Vendor.mockData[6]
        ),
        Book(
            title: "Angels & Demons",
            description: "Robert Langdon races through Rome to stop an ancient brotherhood from destroying the Vatican.",
            coverImageURL: "https://covers.openlibrary.org/b/isbn/9780743493468-L.jpg",
            price: 18.99,
            discount: nil,
            rating: 4.3,
            author: Author.mockData[2],
            vendor: Vendor.mockData[8]
        ),
        Book(
            title: "Inferno",
            description: "Waking up in a Florence hospital with no memory, Langdon must decode a riddle built around Dante's Inferno.",
            coverImageURL: "https://covers.openlibrary.org/b/isbn/9781400079155-L.jpg",
            price: 27.12,
            discount: nil,
            rating: 4.1,
            author: Author.mockData[2],
            vendor: Vendor.mockData[6]
        ),
        Book(
            title: "Origin",
            description: "A futurist's shocking discovery about where we come from sends Langdon on a chase across Spain.",
            coverImageURL: "https://covers.openlibrary.org/b/isbn/9780385514231-L.jpg",
            price: 27.12,
            discount: nil,
            rating: 4.0,
            author: Author.mockData[2],
            vendor: Vendor.mockData[8]
        ),
        Book(
            title: "1984",
            description: "A dystopian novel about surveillance, propaganda, and an oppressive government that seeks to control truth.",
            coverImageURL: "https://covers.openlibrary.org/b/isbn/9780451524935-L.jpg",
            price: 14.99,
            discount: nil,
            rating: 4.7,
            author: Author.mockData[3],
            vendor: Vendor.mockData[8]
        ),
        Book(
            title: "Atomic Habits",
            description: "A practical guide to building good habits and making small, consistent improvements over time.",
            coverImageURL: "https://covers.openlibrary.org/b/isbn/9780735211292-L.jpg",
            price: 24.99,
            discount: 10,
            rating: 4.8,
            author: Author.mockData[4],
            vendor: Vendor.mockData[4]
        ),
        Book(
            title: "The Alchemist",
            description: "A young shepherd travels in search of a treasure and learns about purpose, courage, and following his dreams.",
            coverImageURL: "https://covers.openlibrary.org/b/isbn/9780061122415-L.jpg",
            price: 17.99,
            discount: nil,
            rating: 4.4,
            author: Author.mockData[5],
            vendor: Vendor.mockData[2]
        ),
    ]
}
