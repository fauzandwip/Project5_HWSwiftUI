//
//  ContentView.swift
//  WordScramble
//
//  Created by Fauzan Dwi Prasetyo on 05/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var userWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(userWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
        }
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWordsContents = try? String(contentsOf: startWordsURL) {
                let allWords = startWordsContents.components(separatedBy: "\n")
                
                rootWord = allWords.randomElement() ?? "silkworm"
                
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        withAnimation {
            userWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
}

struct ContentViews_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
