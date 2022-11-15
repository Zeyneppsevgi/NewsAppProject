//
//  NewsViewModel.swift
//  NewProject
//
//  Created by Zeynep Sevgi on 14.11.2022.
//

import Foundation

struct NewsTableViewModel {
    let newsList : [News]
    func numberOfRowInsection() -> Int {
        return self.newsList.count
    }
    func newsIndexPath(_ index: Int) -> NewsViewModel {
        let news = self.newsList[index]
        return NewsViewModel(news: news)

    }
    
    
}
extension NewsTableViewModel {
    
}

struct NewsViewModel {
    let news : News
    
    var title : String {
        return self.news.title
    }
    var story : String {
        return self.news.story
    }
}
