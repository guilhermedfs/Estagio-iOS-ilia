//
//  Desafio_3_CII_3_Tests.swift
//  Desafio 3(CII-3)Tests
//
//  Created by Guilherme Silva on 25/11/21.
//

import XCTest
@testable import Desafio_3_CII_3_

class Desafio_3_CII_3_Tests: XCTestCase {
    
    // Tests if the URL image is set
    func testSetURLImageLink(){
        let data = MoviesAPI()
        
        let result = data.setImageLink(url: "h5UzYZquMwO9FVn15R2eK2itmHu.jpg")
        XCTAssertEqual(result, "https://image.tmdb.org/t/p/w342/h5UzYZquMwO9FVn15R2eK2itmHu.jpg")
    }
    
    // Tests if the date is formatted correctely
    func testDateFormatter() {
        let getDateData = MoviesAPI()
        
        let result = getDateData.formatDate(date: "2002-10-01")
        XCTAssertEqual(result, "01/10/2002")
    }
    
    // Tests if the image is load correctely
    func testLoadImage() {
        let getImageData = MoviesAPI()
        
        let expect = expectation(description: "test loading image")
        getImageData.loadImage(url: "h5UzYZquMwO9FVn15R2eK2itmHu.jpg") { (data, error)  in
            XCTAssertNotNil(data)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 2)
    }
    
    // Tests if the data is being fetched
    func testFetchData() {
        let getData = MoviesAPI()
        
        let expectData = expectation(description: "Test loading data")
        getData.fetchData { (error) in
            XCTAssertNil(error)
            expectData.fulfill()
        }
        wait(for: [expectData], timeout: 5)
    }
    
    // Tests if data is being selected properly
    func testSelectColor() {
        let selectData = MoviesAPI()
        
        let result = selectData.setTextColor(average: 5.0)
        XCTAssertEqual(result, #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    }
}
