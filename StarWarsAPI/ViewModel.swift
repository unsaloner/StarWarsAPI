//
//  ViewModel.swift
//  StarWarsAPI
//
//  Created by Unsal Oner on 4.02.2023.
//

import Foundation

class ViewModel {
    
    func fetchPeople(completion: @escaping (People?) -> Void){
        
        let url = URL(string: "https://swapi.dev/api/people/")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil{
                print(error?.localizedDescription ?? "Error!!")
            }
            if let data = data {
                do{
                    let decodedData = try JSONDecoder().decode(People.self, from: data)
                    completion(decodedData)
                }catch let error {
                    print(error)
                    completion(nil)
                }
                
            }
            
        }.resume()
    }
}

struct ListViewModel {
    
    let person: Result
    
    init(person: Result) {
        self.person = person
    }
    var name : String {
        return self.person.name
    }
    
    var height : String {
        return self.person.height
    }
    var birthYear: String {
        return self.person.birthYear
    }
    var gender : Gender {
        return self.person.gender
    }
    
}

