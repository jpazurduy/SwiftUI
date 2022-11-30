//
//  ContentView.swift
//  Devote
//
//  Created by Jorge Azurduy on 9/6/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State var task: String = ""
    @State private var showNewTaskItem: Bool = false
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    // MARK: - FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)], animation: .default)
    private var items: FetchedResults<Item>

    // MARK: - FUNCTIONS
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - MAIN VIEW
                VStack {
                    // MARK: - HEADER
                    HStack(spacing: 10) {
                   
                        // TITLE
                       Text("Devote")
                           .font(.system(.largeTitle, design: .rounded))
                           .fontWeight(.heavy)
                           .padding(.leading, 4)
                       
                        Spacer()
                        
                       // EDTIT BUTTON
                       EditButton()
                           .font(.system(size: 16, weight: .semibold, design: .rounded))
                           .padding(.horizontal, 10)
                           .frame(minWidth: 70, minHeight: 24)
                           .background(
                               Capsule().stroke(Color.white, lineWidth: 2)
                           )
                       
                       // APPEARANCE BUTTON
                       Button(action: {
                           isDarkMode.toggle()
                           playSound(sound: "sound-tap", type: "mp3")
                           feedback.notificationOccurred(.success)
                       }, label: {
                           Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
                               .resizable()
                               .scaledToFit()
                               .frame(width: 24, height: 24, alignment: .center)
                               .font(.system(.title, design: .rounded))
                       })
                    } // HStack
                    .padding()
                    .foregroundColor(.white)
                    
                    Spacer(minLength: 80)
                    
                    // MARK: - NEW TASK BUTTON
                    Button(action: {
                        showNewTaskItem = true
                        playSound(sound: "sound-ding", type: "mp3")
                        feedback.notificationOccurred(.success)
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                        Text("New Task")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    })
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .leading, endPoint: .trailing)
                            .clipShape(Capsule())
                    )
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0, y: 4)
                    
                    // MARK: - TASKS
                    List {
                        ForEach(items) { item in
//                            NavigationLink {
//                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                            } label: {
//                                VStack(alignment: .leading){
//                                    Text(item.task ?? "Coco")
//                                        .font(.headline)
//                                        .fontWeight(.bold)
//
//                                    Text(item.timestamp!, formatter: itemFormatter)
//                                        .font(.footnote)
//                                        .foregroundColor(.gray)
//                                }
//                            }
                           ListRowItemView(item: item)
                        }
                        .onDelete(perform: deleteItems)
                    } // List
                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: .yellow, radius: 12, x: 0, y: 0)
                    .padding(.vertical)
                    .frame(maxWidth: 640)
                } // VStack
                .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)
                .transition(.move(edge: .bottom))
                .animation(.easeOut(duration: 0.5))
                
                // MARK: - NEW TASK ITEM
                if showNewTaskItem {
                    BlankView(
                        backgroundColor: isDarkMode ? .black : .gray,       backgroundOpacity: isDarkMode ? 0.3 : 0.5)
                        .onTapGesture {
                            withAnimation() {
                                showNewTaskItem = false
                            }
                        }
                    
                    NewTaskItemView(isShowing: $showNewTaskItem)
                } else {
                    
                }
            }// ZStack
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .navigationTitle("Daily Tasks")
            .navigationBarHidden(true)
            .background(
                BackgroundImageView()
                    .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)
            )
            .background(
                backgroundGradient.ignoresSafeArea(.all)
            )
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
    }

    
}


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

        }
    }
}
