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
        
        fetchData()
    }
    
    
    func fetchData(){
        DispatchQueue.global(qos: .background).async {
            let jsonUrlString = "http://api.icndb.com/jokes"
            let url = URL(string: jsonUrlString)!
                    
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                                    
                let responseJsonObject = try! JSONDecoder().decode(JokeResponse.self, from: data)
                self.jokes = responseJsonObject.value
                
                DispatchQueue.main.async {
                    self.jokesTableView.reloadData()
                }
            }
            task.resume()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let jokeCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
        let joke = self.jokes[indexPath.row]
        
        jokeCell.textLabel?.text = joke.joke
        
        return jokeCell
           
       }
}

