//
//  RecipeView.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import SwiftUI
enum URLError: Error {
    case BadURL, BadData
}

struct RecipeView: View {
    @State var recipe: Profile?
    @State var uiImage: UIImage?
  
var body: some View {
ZStack{
    Rectangle()
        .foregroundColor(Color("Highlightcolor"))
        .cornerRadius(10).padding()
    VStack(){
        if let image = uiImage {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .animation(.interactiveSpring(), value: uiImage)
                .padding()
        } else {
            Image("photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.2)
                .padding()
        }
        
        Form{
            Section("Information"){
                Text("Title: " + (recipe?.recipes[0].title ?? ""))
                        .font(.caption)
                Text("Time to make: " + String(recipe?.recipes[0].readyInMinutes ?? 1))
                        .font(.caption)
                Text("Servings: " + String(recipe?.recipes[0].servings ?? 1))
                        .font(.caption)
                HStack{
                Text("Price: " + String(recipe?.recipes[0].pricePerServing ?? 1.0))
                        .font(.caption)
                Spacer()
                    Text("Cheap: " + check(entry:recipe?.recipes[0].cheap ?? false ))
                        .font(.caption)
            }.padding()
            }.padding()
        
    
            /*Section("Ingredients"){
                for item in recipe?.recipes[0].extendedIngredients{
                    HStack{
                        Text(item.id)
                        Text(item.name)
            }
                }
            }*/
            Section("Dietary Info"){
                HStack{
                    Text("Vegetarian: " + check(entry: recipe?.recipes[0].vegetarian ?? false))
                        .font(.caption)
                    Spacer()
                    Text("Vegan: " + check(entry:recipe?.recipes[0].vegan ?? false ))
                        .font(.caption)
                }.padding()
                HStack{
                    Text("Gluten Free:" + check(entry:recipe?.recipes[0].glutenFree ?? false))
                        .font(.caption)
                    Spacer()
                    Text("Dairy Free: " + check(entry:recipe?.recipes[0].dairyFree ?? false))
                        .font(.caption)
                }.padding()
            }.padding()
                
        Section("Instructions"){
            Text((recipe?.recipes[0].instructions ?? ""))
                    .font(.caption)
        }.padding()
       
    }.padding()
        
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
}


struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
