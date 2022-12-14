//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Jorge Azurduy on 9/20/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @AppStorage("lineCount") var lineCount :Int = 1
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    // MARK: - FUNCTIONS
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        //dump(notes)
        do {
            // 1 Convert the notes array t odata ussing JSONENCODER
            let data = try JSONEncoder().encode(notes)
            
            // 2 CREAT new url t osave the file using get DocumentDirectoroy
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            // 3 Write the data to othe given URL
            try data.write(to: url)
            
        } catch {
            print("Saving data has failed.")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                // 1 Get the notes url path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                
                // 2 create a new property for the data
                let data = try Data(contentsOf: url)
                
                // 3 Decode data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print("Error parsing notes")
            }
        }
        
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note", text: $text)
                
                Button(action: {
                    // 1 Only run add button when the text is not empty
                    guard text.isEmpty == false else { return }
                    
                    // 2 create a new note  item and initialize it with a text value
                    let newNote = Note(id: UUID(), text: text)
                    
                    // 3 add the new note to the array
                    notes.append(newNote)
                    
                    // 4 make teh text field  empty
                    text = ""
                    
                    // 5 save new note
                    save()
                    
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold, design: .rounded))
                })
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                //.buttonStyle(BorderedButtonStyle(tint: .accentColor))
            } // HStack
            Spacer()
            
            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { index in
                        NavigationLink(destination: {
                            DetailView(note: notes[index], count: notes.count, index: index)
                        }, label: {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[index].text)
                                    .foregroundColor(.white)
                                    .lineLimit(lineCount)
                                    .padding(.leading, 5)
                            }
                        })
                    } // ForEach
                    .onDelete(perform: delete)
                } // List
                .padding(.vertical)
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .padding(25)
                
                    .opacity(0.25)
                Spacer()
            }
            
        } //VStack
        .navigationTitle("Notes")
        .onAppear(perform: {
            load()
        })
        
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
