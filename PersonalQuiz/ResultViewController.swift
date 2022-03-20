//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Алексей Синяговский on 15.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var resultAnimalLabel: UILabel!
    @IBOutlet weak var descriptionAnimalLabel: UILabel!
    
    // MARK: - Private properties
    var answers: [Answer]!
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    // MARK: - Private Methods
    private func updateResult() {
        
        /*
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
         */
        
        /*
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
         */
        
        /*
         for animal in animals {
         frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
         }
         
         let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
         guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
         */
        
        // Решение в одну строку:
        let mostFrequencyAnimal = Dictionary(grouping: answers) { $0.animal }
            .sorted { $0.value.count > $1.value.count }
            .first?.key
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: Animal?) {
        resultAnimalLabel.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        descriptionAnimalLabel.text = animal?.definition ?? ""
    }
}
