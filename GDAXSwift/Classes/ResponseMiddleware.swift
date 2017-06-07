//
//  ResponseMiddleware.swift
//  GDAXSwift
//
//  Created by Anthony on 6/4/17.
//  Copyright © 2017 Anthony Puppo. All rights reserved.
//

internal protocol ResponseMiddleware {
	
	func run(response: inout HTTPURLResponse, data: inout Data?) throws
	
}
