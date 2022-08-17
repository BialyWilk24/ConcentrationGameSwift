//
//  ViewController.swift
//  Concentration
//
//  Created by Максим on 11.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    var touches = 0 {
        didSet{
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    lazy var game = ConcentrationGame(numberOfPairsOfCards: buttonCollection.count + 1 / 2)
    
    
    
    
//    var emojiCollection = ["🦊", "🐰", "🐹", "🐷", "🦐", "🐁", "🐈", "🦢", "🦭", "🐊", "🐺", "🐝"]
    var emojiCollection = ["🦊", "🐰", "🐹", "🐷", "🦐", "🐁", "🐈"]
    
    var emojiDictionary = [Int: String]()
    
    func emojiID(for card: Card) -> String {
        if emojiDictionary[card.ID] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.ID] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.ID] ?? "?"
    }
    
    func updateViewForModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiID(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
            }
        }
    }
    
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewForModel()
        }
    }
    
    
    
    
    
    
}

