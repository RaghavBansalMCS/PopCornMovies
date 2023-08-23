//
//  PopcornTests.swift
//  PopCornMoviesTests
//
//  Created by Consultant on 8/23/23.
//

import XCTest
@testable import PopCornMovies

final class PopcornTests: XCTestCase {

    var fakeManager = FakeMovieManager()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        fakeManager.getMovies(urlString: "TestAPI")
        
        XCTAssertNotNil(fakeManager)
        
        let movie = fakeManager.movies.first
        print(fakeManager.movies)

        
      
        XCTAssertNotEqual(movie?.titleWithLanguage, "Elemental(en)")
        XCTAssertNotEqual(movie?.overview, "In a city where fire, water, land and air residents live together, a fiery young woman and a go-with-the-flow guy will discover something elemental: how much they have in common.")
        XCTAssertNotEqual(movie?.release_date, "2023-06-14")
        XCTAssertNotEqual(movie?.vote_average, 7.8)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    

}
