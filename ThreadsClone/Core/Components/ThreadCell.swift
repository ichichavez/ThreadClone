//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-15.
//

import SwiftUI
import Firebase

struct ThreadCell: View {
    let thread: Thread
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12){                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4){
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                                
                        }
                    }
                    
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16){
                        
                        Button{
                            
                        }
                        label: {
                            Image(systemName: "heart")
                                
                        }
                        
                        Button{
                            
                        }
                        label: {
                            Image(systemName: "bubble.right")
                                
                        }
                        Button{
                            
                        }
                        label: {
                            Image(systemName: "arrow.rectanglepath")
                                
                        }
                        
                        Button{
                            
                        }
                        label: {
                            Image(systemName: "paperplane")
                                
                        }
                    }
                    .tint(.black)
                    .padding(.vertical, 8)
                }
                
                
                
            }
            Divider()
            
        }
        .padding()
    }
}

#Preview {
    ThreadCell(thread: Thread(ownerUid: "123", caption: "This is a test thread", timestamp: Timestamp(), likes: 0 ))
}
