// Playground - noun: a place where people can play

import UIKit

struct Hotel {
    //Information about hotel room
}

struct HotelBooking {
    static func getHotelNameForDates(to: NSDate, from: NSDate) -> [Hotel]? {
        let hotels = [Hotel]()
        //logic to get hotels
        return hotels
    }
    
    static func bookHotel(hotel: Hotel) {
        // logic to reserve hotel room
    }
}


struct Flight {
    //Information about flights
}

struct FlightBooking {
    static func getFlightNameForDates(to: NSDate, from: NSDate) -> [Flight]? {
        let flights = [Flight]()
        //logic to get flights
        return flights
    }
    
    static func bookFlight(fight: Flight) {
        // logic to reserve flight
    }
}


struct RentalCar {
    //Information about rental cars
}

struct RentalCarBooking {
    static func getRentalCarNameForDates(to: NSDate, from: NSDate) -> [RentalCar]? {
        let cars = [RentalCar]()
        //logic to get flights
        return cars
    }
    
    static func bookRentalCar(rentalCar: RentalCar) {
        // logic to reserve rental car
    }
}


class TravelFacade {
    
    var hotels: [Hotel]?
    var flights: [Flight]?
    var cars: [RentalCar]?
    
    init(to: NSDate, from: NSDate) {
        hotels = HotelBooking.getHotelNameForDates(to, from: from)
        flights = FlightBooking.getFlightNameForDates(to, from: from)
        cars = RentalCarBooking.getRentalCarNameForDates(to, from: from)
    }
    
    func bookTrip(hotel: Hotel, flight: Flight, rentalCar: RentalCar) {
        HotelBooking.bookHotel(hotel)
        FlightBooking.bookFlight(flight)
        RentalCarBooking.bookRentalCar(rentalCar)
    }
}

