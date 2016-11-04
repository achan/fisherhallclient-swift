//
//  FisherHallClient.swift
//  FisherHallClient
//
//  Created by Amos Chan on 2016-11-03.
//  Copyright © 2016 Amos Chan. All rights reserved.
//

import Foundation
import Spine

class FisherHallClient {
	private let baseURL = URL(string: "https://mcac.church/api/v1")!
	private let _spine: Spine;

	var spine: Spine {
		return _spine;
	}

	init() {
		_spine = Spine(baseURL: baseURL)
		_spine.registerResource(GroupResource.self)
	}
}
