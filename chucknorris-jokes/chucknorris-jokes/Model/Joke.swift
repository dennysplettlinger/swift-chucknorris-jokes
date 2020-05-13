//
//  Joke.swift
//  chucknorris-jokes
//
//  Created by dennys Plettlinger on 13.05.20.
//  Copyright © 2020 dennysplettlinger. All rights reserved.
//

import Foundation

struct JokeResponse : Decodable {
    let type: String
    let value: [Joke]
}

struct Joke : Decodable {
    let joke: String
}
