//
//  BasicTypesFromJSON.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2015-02-17.
//  Copyright (c) 2015 hearst. All rights reserved.
//

import Foundation
import XCTest
import ObjectMapper
import Nimble

class BasicTypesTestsFromJSON: XCTestCase {

	let mapper = Mapper<BasicTypes>()
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
	// MARK: Test mapping to JSON and back (basic types: Bool, Int, Double, Float, String)
	
	func testMappingBoolFromJSON(){
		var value: Bool = true
		let JSONString = "{\"bool\" : \(value), \"boolOpt\" : \(value), \"boolImp\" : \(value)}"
		
		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.bool).to(equal(value))
		expect(mappedObject?.boolOptional).to(equal(value))
		expect(mappedObject?.boolImplicityUnwrapped).to(equal(value))
	}
	
	func testMappingIntFromJSON(){
		var value: Int = 11
		let JSONString = "{\"int\" : \(value), \"intOpt\" : \(value), \"intImp\" : \(value)}"
		
		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.int).to(equal(value))
		expect(mappedObject?.intOptional).to(equal(value))
		expect(mappedObject?.intImplicityUnwrapped).to(equal(value))
	}
	
	func testMappingDoubleFromJSON(){
		var value: Double = 11
		let JSONString = "{\"double\" : \(value), \"doubleOpt\" : \(value), \"doubleImp\" : \(value)}"

		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.double).to(equal(value))
		expect(mappedObject?.doubleOptional).to(equal(value))
		expect(mappedObject?.doubleImplicityUnwrapped).to(equal(value))
	}
	
	func testMappingFloatFromJSON(){
		var value: Float = 11
		let JSONString = "{\"float\" : \(value), \"floatOpt\" : \(value), \"floatImp\" : \(value)}"
		
		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.float).to(equal(value))
		expect(mappedObject?.floatOptional).to(equal(value))
		expect(mappedObject?.floatImplicityUnwrapped).to(equal(value))
	}
	
	func testMappingStringFromJSON(){
		var value: String = "STRINGNGNGG"
		let JSONString = "{\"string\" : \"\(value)\", \"stringOpt\" : \"\(value)\", \"stringImp\" : \"\(value)\"}"

		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.string).to(equal(value))
		expect(mappedObject?.stringOptional).to(equal(value))
		expect(mappedObject?.stringImplicityUnwrapped).to(equal(value))
	}
	
	func testMappingAnyObjectFromJSON(){
		var value1 = "STRING"
		var value2: Int = 1234
		var value3: Double = 11.11
		let JSONString = "{\"anyObject\" : \"\(value1)\", \"anyObjectOpt\" : \(value2), \"anyObjectImp\" : \(value3)}"
		
		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.anyObject as? String).to(equal(value1))
		expect(mappedObject?.anyObjectOptional as? Int).to(equal(value2))
		expect(mappedObject?.anyObjectImplicitlyUnwrapped as? Double).to(equal(value3))
	}
	
	// MARK: Test mapping Arrays to JSON and back (with basic types in them Bool, Int, Double, Float, String)
	
	func testMappingBoolArrayFromJSON(){
		var value: Bool = true
		let JSONString = "{\"arrayBool\" : [\(value)], \"arrayBoolOpt\" : [\(value)], \"arrayBoolImp\" : [\(value)] }"

		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.arrayBool.first).to(equal(value))
		expect(mappedObject?.arrayBoolImplicityUnwrapped.first).to(equal(value))
		expect(mappedObject?.arrayBoolOptional?.first).to(equal(value))
	}
	
	func testMappingIntArrayFromJSON(){
		var value: Int = 1
		let JSONString = "{\"arrayInt\" : [\(value)], \"arrayIntOpt\" : [\(value)], \"arrayIntImp\" : [\(value)] }"

		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.arrayInt.first).to(equal(value))
		expect(mappedObject?.arrayIntImplicityUnwrapped.first).to(equal(value))
		expect(mappedObject?.arrayIntOptional?.first).to(equal(value))
	}
	
	func testMappingDoubleArrayFromJSON(){
		var value: Double = 1.0
		let JSONString = "{\"arrayDouble\" : [\(value)], \"arrayDoubleOpt\" : [\(value)], \"arrayDoubleImp\" : [\(value)] }"

		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.arrayDouble.first).to(equal(value))
		expect(mappedObject?.arrayDoubleImplicityUnwrapped.first).to(equal(value))
		expect(mappedObject?.arrayDoubleOptional?.first).to(equal(value))
	}
	
	func testMappingFloatArrayFromJSON(){
		var value: Float = 1.001
		let JSONString = "{\"arrayFloat\" : [\(value)], \"arrayFloatOpt\" : [\(value)], \"arrayFloatImp\" : [\(value)] }"
		
		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.arrayFloat.first).to(equal(value))
		expect(mappedObject?.arrayFloatImplicityUnwrapped.first).to(equal(value))
		expect(mappedObject?.arrayFloatOptional?.first).to(equal(value))
	}
	
	func testMappingStringArrayFromJSON(){
		var value: String = "Stringgggg"
		let JSONString = "{\"arrayString\" : [\"\(value)\"], \"arrayStringOpt\" : [\"\(value)\"], \"arrayStringImp\" : [\"\(value)\"] }"
		
		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.arrayString.first).to(equal(value))
		expect(mappedObject?.arrayStringImplicityUnwrapped.first).to(equal(value))
		expect(mappedObject?.arrayStringOptional?.first).to(equal(value))
	}
	
	func testMappingAnyObjectArrayFromJSON(){
		var value1 = "STRING"
		var value2: Int = 1234
		var value3: Double = 11.11
		let JSONString = "{\"arrayAnyObject\" : [\"\(value1)\"], \"arrayAnyObjectOpt\" : [\(value2)], \"arratAnyObjectImp\" : [\(value3)] }"
		
		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.arrayAnyObject.first as? String).to(equal(value1))
		expect(mappedObject?.arrayAnyObjectOptional?.first as? Int).to(equal(value2))
		expect(mappedObject?.arrayAnyObjectImplicitlyUnwrapped.first as? Double).to(equal(value3))
	}
	
	// MARK: Test mapping Dictionaries to JSON and back (with basic types in them Bool, Int, Double, Float, String)
	
	func testMappingBoolDictionaryFromJSON(){
		var key = "key"
		var value: Bool = true
		let JSONString = "{\"dictBool\" : { \"\(key)\" : \(value)}, \"dictBoolOpt\" : { \"\(key)\" : \(value)}, \"dictBoolImp\" : { \"\(key)\" : \(value)} }"
		
		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.dictBoolOptional?[key]).to(equal(value))
		expect(mappedObject?.dictBoolImplicityUnwrapped[key]).to(equal(value))
		expect(mappedObject?.dictBool[key]).to(equal(value))
	}
	
	func testMappingIntDictionaryFromJSON(){
		var key = "key"
		var value: Int = 11
		let JSONString = "{\"dictInt\" : { \"\(key)\" : \(value)}, \"dictIntOpt\" : { \"\(key)\" : \(value)}, \"dictIntImp\" : { \"\(key)\" : \(value)} }"
		
		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.dictIntOptional?[key]).to(equal(value))
		expect(mappedObject?.dictIntImplicityUnwrapped[key]).to(equal(value))
		expect(mappedObject?.dictInt[key]).to(equal(value))
	}
	
	func testMappingDoubleDictionaryFromJSON(){
		var key = "key"
		var value: Double = 11
		let JSONString = "{\"dictDouble\" : { \"\(key)\" : \(value)}, \"dictDoubleOpt\" : { \"\(key)\" : \(value)}, \"dictDoubleImp\" : { \"\(key)\" : \(value)} }"
		
		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.dictDoubleOptional?[key]).to(equal(value))
		expect(mappedObject?.dictDoubleImplicityUnwrapped[key]).to(equal(value))
		expect(mappedObject?.dictDouble[key]).to(equal(value))
	}
	
	func testMappingFloatDictionaryFromJSON(){
		var key = "key"
		var value: Float = 111.1
		let JSONString = "{\"dictFloat\" : { \"\(key)\" : \(value)}, \"dictFloatOpt\" : { \"\(key)\" : \(value)}, \"dictFloatImp\" : { \"\(key)\" : \(value)} }"

		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.dictFloat[key]).to(equal(value))
		expect(mappedObject?.dictFloatOptional?[key]).to(equal(value))
		expect(mappedObject?.dictFloatImplicityUnwrapped[key]).to(equal(value))
	}
	
	func testMappingStringDictionaryFromJSON(){
		var key = "key"
		var value = "value"
		let JSONString = "{\"dictString\" : { \"\(key)\" : \"\(value)\"}, \"dictStringOpt\" : { \"\(key)\" : \"\(value)\"}, \"dictStringImp\" : { \"\(key)\" : \"\(value)\"} }"
		
		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.dictString[key]).to(equal(value))
		expect(mappedObject?.dictStringOptional?[key]).to(equal(value))
		expect(mappedObject?.dictStringImplicityUnwrapped[key]).to(equal(value))
	}
	
	func testMappingAnyObjectDictionaryFromJSON(){
		var key = "key"
		var value1 = "STRING"
		var value2: Int = 1234
		var value3: Double = 11.11
		let JSONString = "{\"dictAnyObject\" : { \"\(key)\" : \"\(value1)\"}, \"dictAnyObjectOpt\" : { \"\(key)\" : \(value2)}, \"dictAnyObjectImp\" : { \"\(key)\" : \(value3)} }"
		
		var mappedObject = mapper.map(JSONString)

		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.dictAnyObject[key] as? String).to(equal(value1))
		expect(mappedObject?.dictAnyObjectOptional?[key] as? Int).to(equal(value2))
		expect(mappedObject?.dictAnyObjectImplicitlyUnwrapped[key] as? Double).to(equal(value3))
	}

	func testMappingIntEnumFromJSON(){
		var key = "key"
		var value: BasicTypes.EnumInt = .Another
		let JSONString = "{\"enumInt\" : \(value), \"enumIntOpt\" : \(value), \"enumIntImp\" : \(value) }"

		var mappedObject = mapper.map(JSONString)
		expect(mappedObject).notTo(beNil())
		expect(mappedObject?.enumInt).to(equal(value))
		expect(mappedObject?.enumIntOptional).to(equal(value))
		expect(mappedObject?.enumIntImplicityUnwrapped).to(equal(value))
	}
	
	func testObjectModelOptionalDictionnaryOfPrimitives() {
		let JSON: [String: [String: AnyObject]] = ["dictStringString":["string": "string"], "dictStringBool":["string": false], "dictStringInt":["string": 1], "dictStringDouble":["string": 1.1], "dictStringFloat":["string": 1.2]]
		
		let mapper = Mapper<TestCollectionOfPrimitives>()
		let testSet: TestCollectionOfPrimitives! = mapper.map(JSON)
		expect(testSet).notTo(beNil())

		expect(testSet.dictStringString).notTo(beEmpty())
		expect(testSet.dictStringInt).notTo(beEmpty())
		expect(testSet.dictStringBool).notTo(beEmpty())
		expect(testSet.dictStringDouble).notTo(beEmpty())
		expect(testSet.dictStringFloat).notTo(beEmpty())
	}
}
