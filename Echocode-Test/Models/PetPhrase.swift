//
//  PetPhrase.swift
//  Echocode-Test
//
//  Created by Іван Джулинський on 09.02.2025.
//

import Foundation

struct PetPhrases {
    
    // MARK: - Common Phrases
    static let common = [
        "I'm hungry, feed me!",
        "What are you doing, human?",
        "Give me attention now!",
        "Let's go outside!",
        "I need a nap.",
        "This is my spot!",
        "Where have you been?",
        "Play with me!",
        "I like this food!",
        "Pet me more!",
        "I'm the boss here!",
        "Let me out!",
        "I smell something tasty!",
        "Look at me, I'm adorable!",
        "Let's explore!",
        "I'm so happy right now!",
        "Tell me a story!",
        "Let's cuddle!",
        "I want to run around!",
        "Listen to me!",
        "I have so much energy!",
        "Let's have fun!",
        "Watch me do something cool!"
    ]
    
    // MARK: - Pet Specific Phrases
    static let dog = [
        "Can we go for a walk?",
        "I'll protect you!",
        "Ball! Ball! Ball!",
        "Let's play fetch!",
        "You're my best friend!",
        "I love car rides!"
    ]
    
    static let cat = [
        "Your laptop is my bed now",
        "I knocked something over",
        "The food bowl is half empty",
        "3 AM is playtime",
        "This box is mine now",
        "Why is the door closed?"
    ]
    
    // MARK: - Methods
    static func getRandomPhrase(for pet: Pet) -> String {
        let specificPhrases = pet == .dog ? dog : cat
        let allPhrases = common + specificPhrases
        return allPhrases.randomElement() ?? "Something went wrong! Please, try again."
    }
}
