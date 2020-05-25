//
//  ViewController.swift
//  chucknorris-jokes
//
//  Created by dennys Plettlinger on 13.05.20.
//  Copyright © 2020 dennysplettlinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var jokesTableView: UITableView!
    
    var jokes = [Joke]()

    override func viewDidLoad() {
        super.viewDidLoad()
        jokesTableView.dataSource = self
        jokesTableView.delegate = self
        
        //Funktionaufruf
    }
    
    
    func fetchData(){
        //API-Call hier
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let jokeCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
        let joke = self.jokes[indexPath.row]
        
        DispatchQueue.main.async {
            jokeCell.textLabel?.text = joke.joke
        }
        
        return jokeCell
           
       }
}

