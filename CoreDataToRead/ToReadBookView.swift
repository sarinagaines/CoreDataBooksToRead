//
//  ToReadBookView.swift
//  CoreDataToRead
//
//  Created by Sarina Gaines on 4/24/20.
//  Copyright © 2020 Sarina Gaines. All rights reserved.
//

import SwiftUI

struct ToReadBookView: View {
    var title:String = ""
    var createdAt: String = ""
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(title).font(.headline)
                Text(createdAt).font(.caption)
                
            }
        }
    }
}

struct ToReadBookView_Previews: PreviewProvider {
    static var previews: some View {
        ToReadBookView(title: "Awesome Book", createdAt: "Today")
    }
}
