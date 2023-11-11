//
//  RecipeView2.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import SwiftUI

struct RecipeView2: View {
    @State var recipe: Entry
    @State var uiImage: UIImage?
    let imageHelper = ImageHelper()
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("Highlightcolor"))
                .cornerRadius(10)
            
            VStack(){
                Button("Show image"){
                    Task{
                   await loadSymbol()
                    }
                }
                if let image = uiImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .onAppear {
                                        withAnimation(.easeIn(duration: 2.0)) {
                                            // Animation code here
                                        }
                                    }
                } 
                
                Form{
                    Section("Information"){
                        Text("Title: " + (recipe.title ))
                                .font(.caption)
                        Text("Time to make: " + String(recipe.readyInMinutes ))
                                .font(.caption)
                        Text("Servings: " + String(recipe.servings ))
                                .font(.caption)
                        HStack{
                        Text("Price: " + String(recipe.pricePerServing ))
                                .font(.caption)
                            Spacer()
                            Text("Cheap: " + check(entry:recipe.cheap ))
                                    .font(.caption)
                        }
                    }
                
        
                    Section("Dietary Info"){
                        HStack{
                        Text("Vegetarian: " + check(entry: recipe.vegetarian))
                                .font(.caption)
                            Spacer()
                        Text("Vegan: " + check(entry:recipe.vegan ))
                                .font(.caption)
                        }
                        HStack{
                        Text("Gluten Free:" + check(entry:recipe.glutenFree ))
                                .font(.caption)
                            Spacer()
                        Text("Dairy Free: " + check(entry:recipe.dairyFree ))
                                .font(.caption)
                        }
                    }
                        
                Section("Instructions"){
                    Text((recipe.instructions))
                            .font(.caption)
                }
               
            }
                
            }
            
           
        }
        }
    
    func check(entry: Bool)-> String{
        if(entry==true){
            return "✅"
        }
        else{
            return "🚫"
        }
    }
    func loadSymbol() async{
        do {
            uiImage = try await imageHelper.fetchImage(url: recipe.image)
        } catch { print(error) }
        
    }
}

        

/*struct RecipeView2_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView2()
    }
}*/
