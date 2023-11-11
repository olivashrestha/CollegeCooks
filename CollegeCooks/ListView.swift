//
//  ListView.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var entriesVM: EntriesVM
    @State private var addPresenting = false
    @State private var alert = false
    
    @AppStorage("Preference") var preference = false
    @AppStorage("Autosave") var autosave = false
    @AppStorage("textColor") var textColor: Color = Color.black
    
    
    var body: some View {
        ZStack{
            Color("Backgroundcolor").ignoresSafeArea()
       NavigationView {
            List {
                ForEach(entriesVM.entrys) { item in
                    NavigationLink {
                        RecipeView2(recipe: item)
                    } label: {
                        VStack{
                            Text(item.title).font(.caption).fontWeight(.medium)
                            
                           
                            HStack{
                                if(autosave==true){
                            Text("Price: $" + String(item.pricePerServing)).font(.caption)
                                if(item.cheap==true){Text ("💲")}
                                }
                            }
                            
                            
                            
                            HStack{
                                if(preference==true){
                            HStack{
                            Text("🚫")
                            if(item.vegetarian==true){Text("🍖")}
                            if(item.vegan==true){Text("🧀")}
                            }
                                Spacer()
                            HStack{
                                Text("🚫")
                            if(item.dairyFree==true){Text("🐮")}
                            if(item.glutenFree==true){Text("🥖")}
                            }
                                }
                        }
                            
                            
                        }.foregroundColor(textColor)
                    }
                }.onMove(perform: entriesVM.move)
                    .onDelete(perform: entriesVM.remove)
                    }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        alert=true
                    }, label: {
                        Label("Delete all", systemImage: "xmark.bin")
                    })
                    .alert(isPresented: $alert){
                        Alert(title: Text("Delete all items"),
                            message:  Text("the items cannot be retrived once it has been deleted"),
                                    primaryButton:
                                        .default(Text("Cancel")
                                        ),
                              secondaryButton:
                                        .destructive(
                                        Text("Ok"),
                                        action: deleteallItems
                                    )
                        )
                }
                }
        } .navigationTitle("Recipes to try")
       }
              
        }
    }
    
    


    private func deleteallItems() {
        entriesVM.removeall()
}
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
