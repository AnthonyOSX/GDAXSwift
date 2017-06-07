//
//  GDAXProductTrade.swift
//  GDAXSwift
//
//  Created by Anthony on 6/4/17.
//  Copyright © 2017 Anthony Puppo. All rights reserved.
//

public struct GDAXProductTrade: JSONInitializable {
	
	let time: Date
	let tradeID: Int
	let price: Double
	let size: Double
	let side: Side
	
	public enum Side: String {
		
		case buy, sell
		
	}
	
	internal init(json: Any) throws {
		var jsonData: Data?
		
		if let json = json as? Data {
			jsonData = json
		} else {
			jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
		}
		
		guard let json = jsonData?.json else {
			throw GDAXError.invalidResponseData
		}
		
		guard let time = (json["time"] as? String)?.dateFromISO8601 else {
			throw GDAXError.responseParsingFailure("time")
		}
		
		guard let tradeID = json["trade_id"] as? Int else {
			throw GDAXError.responseParsingFailure("trade_id")
		}
		
		guard let price = Double(json["price"] as? String ?? "") else {
			throw GDAXError.responseParsingFailure("price")
		}
		
		guard let size = Double(json["size"] as? String ?? "") else {
			throw GDAXError.responseParsingFailure("size")
		}
		
		guard let side = Side(rawValue: json["side"] as? String ?? "") else {
			throw GDAXError.responseParsingFailure("side")
		}
		
		self.time = time
		self.tradeID = tradeID
		self.price = price
		self.size = size
		self.side = side
	}
	
}
