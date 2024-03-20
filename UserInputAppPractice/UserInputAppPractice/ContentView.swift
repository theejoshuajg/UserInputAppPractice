import SwiftUI

struct ContentView: View {
    @State private var enteredText: String = ""
    @State private var selectedColorIndex: Int = 0
    
    let colors: [Color] = [.black, .red, .green, .blue]
    let colorNames = ["Black", "Red", "Green", "Blue"]
    
    var body: some View {
        VStack {
            TextField("Enter text here", text: $enteredText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker("Text Color", selection: $selectedColorIndex) {
                ForEach(0..<colors.count) { index in
                    Text(self.colorNames[index])
                        .foregroundColor(self.colors[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Text("You entered:")
                .foregroundColor(colors[selectedColorIndex])
                .padding()
            
            Text(enteredText)
                .foregroundColor(colors[selectedColorIndex])
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
