//
//  Joke.swift
//  chucknorris-jokes
//
//  Created by dennys Plettlinger on 13.05.20.
//  Copyright © 2020 dennysplettlinger. All rights reserved.
//

import Foundation

struct JokeResponse : Codable {
    let value: [Joke]
}

struct Joke : Codable {
    let joke: String
}
