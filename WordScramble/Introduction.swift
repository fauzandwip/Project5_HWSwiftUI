//
//  Introduction.swift
//  WordScramble
//
//  Created by Fauzan Dwi Prasetyo on 03/06/23.
//

import SwiftUI

struct Introduction: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        // first content
        List {
            Section("Section 1") {
                Text("Static row 1")
                Text("Static row 2")
            }
            
            Section("Section 2") {
                ForEach(1..<6) {
                    Text("Dynamic row \($0)")
                }
            }
            
            Section("Section 3") {
                Text("Static row 3")
                Text("Static row 4")
                    .font(.headline)
                    .foregroundColor(Color.red)
            }
        }
        
        // second content
        VStack {
            List(people, id: \.self) {
                Text($0)
            }
            
            List {
                Text("Static row")
                
                ForEach(people, id: \.self) {
                    Text($0)
                }
                
                Text("Static row")
            }
        }
        
        // third content
        // load resources from bundle
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                Text(fileContents)
            }
        }
        
        // fourth content
        // string and UITextChecker
        Button("Tap") {
            stringTextChecker()
        }
    }
    
    func stringTextChecker() {
        let string = """
        
        a
        b
        c
        3 B
        
        """
        let letters = string.components(separatedBy: "\n")
//        print(letters)

        if let letter = letters.randomElement() {
//            print(letter)
        }
        
        let trim = string.trimmingCharacters(in: .whitespacesAndNewlines)
        print(trim)
        
        // UITextChecker
        let word = "done"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        if misspelledRange.location == NSNotFound {
            print(misspelledRange)
        }
    }
}


struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Introduction()
    }
}
