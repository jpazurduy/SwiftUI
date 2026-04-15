//
//  CREDO ACADEMY ♥ DESIGN AND CODE
//  SwiftUI • SwiftData • Apple Intelligence • UI/UX Design • Apple AR
//  https://credo.academy
//  Created by Robert Petras
//

import SwiftUI

struct NewMovieFormView: View {
  // MARK: - PROPERTIES

  @Environment(\.modelContext) var modelContext
  @Environment(\.dismiss) var dismiss

  @State private var title: String = ""
  @State private var selectedGenre: Genre = .kids

  // MARK: - FUNCTIONS

  private func addNewMovie() {
    let newMovie = Movie(title: title, genre: selectedGenre)
    modelContext.insert(newMovie)
    title = ""
    selectedGenre = .kids
  }

  var body: some View {
    Form {
      List {
        // MARK: - HEADER
        Text("What to Watch")
          .font(.largeTitle.weight(.black))
          .foregroundStyle(.blue.gradient)
          .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
          .padding(.vertical)

        // MARK: - TITLE
        TextField("Movie Title", text: $title)
          .textFieldStyle(.roundedBorder)
          .font(.largeTitle.weight(.light))

        // MARK: - GENRE
        Picker("Genre", selection: $selectedGenre) {
          ForEach(Genre.allCases) { genre in
            Text(genre.name)
              .tag(genre)
          }
        }

        // MARK: - SAVE BUTTON
        Button {
          if title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            print("Input is invalid")
            return
          } else {
            print("Valid input: \(title) - \(selectedGenre)")
            addNewMovie()
            dismiss()
          }
        } label: {
          Text("Save")
            .font(.title2.weight(.medium))
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.extraLarge)
        .glassEffect(.regular.interactive()) // TODO: - NEW CODE
        .padding(.bottom, 24) // TODO: - NEW CODE
        // .buttonBorderShape(.roundedRectangle) // TODO: - DELETE
        .disabled(title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)

        // MARK: - CANCEL BUTTON
        Button {
          dismiss()
        } label: {
          Text("Close")
            .frame(maxWidth: .infinity)
        }

      } //: LIST
      .listRowSeparator(.hidden)
    } //: FORM
  }
}

#Preview {
  NewMovieFormView()
}
