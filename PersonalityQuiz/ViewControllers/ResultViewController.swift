//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответствии с этим животным
    // 4. Избавиться от кнопки возврата на предыдущий экран
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answerChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        resultShow()
    }
    
    func countResult() -> Animal{
        var resultCount: [Animal: Int] = [.dog: 0, .cat: 0, .turtle: 0, .rabbit: 0]
        var animalValueCount = 0
        var count = 0
        var resultAnimal: Animal = .dog
        for answer in answerChosen {
            let weightValue: Int
            if count == 0 {
                weightValue = 6
            } else if count == (answerChosen.count - 1) {
                weightValue = 7
            } else {
                weightValue = 5
            }
            
            if let currentValue = resultCount[answer.animal] {
                resultCount[answer.animal] = weightValue + currentValue
            }
            count += 1
        }
        
        for animal in resultCount {
            if animalValueCount < animal.value {
                resultAnimal = animal.key
                animalValueCount = animal.value
            }
        }

        return resultAnimal
    }
    
    func resultShow() {
        let animal = countResult()
        titleLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
}
