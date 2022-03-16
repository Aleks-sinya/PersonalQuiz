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
    private var currentAnswers: [Answer]!
    private var presentAnswer: () = ()
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        presentAnswer = getAnswer(for: currentAnswers)
        
        resultAnimalLabel.text = getAnimal(for: presentAnswer)
        descriptionAnimalLabel.text = getDescription(for: presentAnswer)
    }
    
    // MARK: - Get Animal
    private func getAnimal(for answer: Dictionary<Animal, Character>.Element) -> String {
        let animal = answer.key.definition
        return String("Вы – \(animal)")
    }
    
    // MARK: - Get Description
    private func getDescription(for answer: Dictionary<Animal, String>.Element) -> String {
        let description = answer.key.definition
        return description
    }
}

    // MARK: - Get Answer

private func getAnswer(for allAnswers: [Answer]) {
    
    var animalsType: [Animal: Int]
    for answer in allAnswers {
        animalsType[answer.animal]? += 1
    }
    guard animalsType.sorted(by: {$0.1 < $1.1 }).first != nil else { return }
}
