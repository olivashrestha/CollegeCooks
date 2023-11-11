//
//  SearchView.swift
//  CollegeCooks
//
//  Created by Shrestha, Oliva on 12/12/22.
//

import SwiftUI

struct SearchView: View {
   @EnvironmentObject var entriesVM: EntriesVM
   
    
    @AppStorage("cuisine") var cuisine = CuisineType.all
    @AppStorage("type") var type = TypeType.anything
    @AppStorage("maxReadyTime") var maxreadytime = 0
    @AppStorage("keyword") var keyword = ""
    
  
    @State private var showProgress: Bool = false
    @State private var title = ""
    @State private var image = ""
    @State private var recipe: Profile?
    @State private var alert = false
    @State private var uiImage: UIImage?
   
    @State private var showactionsheet = false
    @State private var a = false
    @State private var b = ""

  
    
    let recipeHelper = RecipeHelper()
    let imageHelper = ImageHelper()
    
    var body: some View {
        ZStack{
            Color("Backgroundcolor").ignoresSafeArea()
            
        VStack {
            if showProgress == true {
                Spacer()
                ProgressView()
                Spacer()
            } else {
                NavigationView{
                    VStack{
                    Text("New Recipe")
                        .padding()
                        
                    Spacer()
                        VStack{
                            if let image = uiImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill).border(.white, width: 6)
                                    .onAppear {
                                                    withAnimation(.linear(duration: 1.0)) {
                                                        // Animation code here
                                                    }
                                                }
                            } else {
                                Image("photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .opacity(0.2)
                            }
                            Text(title).padding()
                           
                        }
                        Spacer()
                        Button("See More") {
                            a=true
                        }.disabled(b.isEmpty).foregroundColor(.accentColor)
                        NavigationLink("", destination : RecipeView(recipe: recipe, uiImage: uiImage), isActive: $a)
                        
                        Spacer()
                        
                        Text("Find a recipe").padding().font(.title).foregroundColor(Color("Highlightcolor")).onTapGesture {
                            showactionsheet = true
                        }
            
                        .alert(isPresented: $showactionsheet){
                            Alert(title: Text("Save this before getting new one"),
                                message:  Text("the items cannot be retrived once it's gone"),
                                        primaryButton:
                                            .default(Text("Save"),
                                                     action: onyes),
                                  secondaryButton:
                                            .destructive(
                                            Text("Don't Save"),
                                            action: onno)
                            )
                    }
                        
                    
                        Spacer()
                    }.toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: { alert = true}, label:{
                                Label("Selection", systemImage: "square.and.pencil")
                            })
                    }
                    }
                    }.sheet(isPresented: $alert) {
                        SelectionView()
                    }
                }
                
                Spacer()
            }
        }
    }
    
    private func onyes() {
        entriesVM.add(title: recipe?.recipes[0].title ?? "", time: recipe?.recipes[0].readyInMinutes ?? 1, servings: recipe?.recipes[0].servings ?? 1, image: image , ins: recipe?.recipes[0].instructions ?? "", veg: recipe?.recipes[0].vegetarian ?? false, vegan: recipe?.recipes[0].vegan ?? false, gluten: recipe?.recipes[0].glutenFree ?? false, dairy: recipe?.recipes[0].dairyFree ?? false, cheap: recipe?.recipes[0].cheap ?? false, price: recipe?.recipes[0].pricePerServing ?? 1.0)
        showProgress = true
        Task{
        recipe = nil
        await loadSymbol()
        showProgress = false
            b="a"
           // showactionsheet = true
        }
    
    }
        
    private func onno() {
        showProgress = true
        Task{
        recipe = nil
        await loadSymbol()
        showProgress = false
            b="a"
           // showactionsheet = true
        }
    }
    
    func loadSymbol() async {
        do {
           
            recipe = try await recipeHelper.fetch(cuisine: cuisine.title(),type:type.value(),word:keyword,time: String(maxreadytime))
            title = recipe?.recipes[0].title ?? "none"
            image = recipe?.recipes[0].image ?? ""
            uiImage = try await imageHelper.fetchImage(url: image)
        } catch { print(error) }
        
      
        
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
