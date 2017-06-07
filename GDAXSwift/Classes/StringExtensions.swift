//
//  StringExtensions.swift
//  GDAXSwift
//
//  Created by Anthony on 6/4/17.
//  Copyright © 2017 Anthony Puppo. All rights reserved.
//

internal extension String {
	
	internal var dateFromISO8601: Date? {
		return Formatter.iso8601.date(from: self)
	}
	
}
