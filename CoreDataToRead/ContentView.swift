//
//  ContentView.swift
//  CoreDataToRead
//
//  Created by Sarina Gaines on 4/24/20.
//  Copyright © 2020 Sarina Gaines. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectcontext
    
    @FetchRequest(fetchRequest: ToReadBook.getAllToReadBooks()) var toReadBooks:FetchedResults<ToReadBook>
    
    @State private var newToReadBook = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("What's next?")){
                    HStack{
                        TextField("New book", text: self.$newToReadBook)
                        Button(action: {
                            
                            let toReadBook = ToReadBook(context: self.managedObjectcontext)
                            toReadBook.title = self.newToReadBook
                            toReadBook.createdAt = Date()
                            
                            do{
                                try self.managedObjectcontext.save()
                                
                            }catch{
                                print(error)
                            }
                            
                            self.newToReadBook = ""
                            
                            
                        }) {
                            Image(systemName: "plus.square.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                            
                        }
                    }
                    
                }.font(.headline).foregroundColor(.green)
                
                Section(header: Text("To Read")){
                    ForEach(self.toReadBooks){toReadBook in
                    ToReadBookView(title: toReadBook.title!, createdAt: "\(toReadBook.createdAt!)")
                    
                    }.onDelete{indexSet in
                        let deleteItem = self.toReadBooks[indexSet.first!]
                        self.managedObjectcontext.delete(deleteItem)
                        do{
                            try self.managedObjectcontext.save()
                        }catch{
                            print(error)
                        }
                    }
                    
                    
                }.foregroundColor(.blue)
            }
            .navigationBarTitle(Text("Books I Want To Read")
            .foregroundColor(Color.green))
        
                    
            .navigationBarItems(trailing: EditButton())
             
            
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
