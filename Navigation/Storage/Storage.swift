//
//  File.swift
//  Navigation
//
//  Created by Dany on 08.09.2021.
//

import UIKit
import iOSIntPackage

public struct Post {
   public let author: String
   public let description: String
   public let image: UIImage
   public let likes: String
   public let views: String
}

public struct Profile {
   public var avatarImage: UIImage
}
public struct ProfileStorage {
   public static let photoss = [Profile(avatarImage: #imageLiteral(resourceName: "Lion"))]
}
public struct Photo {
   public let label: String
   public let image: UIImage
   public let image2: UIImage
   public let image3: UIImage
   public let image4: UIImage
}

public struct CollectionPhoto {
  public  let image: UIImage
}

public struct SectionPosts {
   public let photos:[Photo]
   public let posts:[Post]
    
}
public struct PhotoSection {
    public let imageCollect:[CollectionPhoto]
}
let imageProccess = ImageProcessor()

public struct PhotoStorage {
   public static let photoModel = [
        PhotoSection(imageCollect: [
            CollectionPhoto(image: #imageLiteral(resourceName: "4")),
            CollectionPhoto(image: #imageLiteral(resourceName: "3")),
            CollectionPhoto(image: #imageLiteral(resourceName: "1")),
            CollectionPhoto(image: #imageLiteral(resourceName: "2")),
            CollectionPhoto(image: #imageLiteral(resourceName: "rick")),
            CollectionPhoto(image: #imageLiteral(resourceName: "Lion")),
            CollectionPhoto(image: #imageLiteral(resourceName: "jaguar")),
            CollectionPhoto(image: #imageLiteral(resourceName: "vedmak")),
            CollectionPhoto(image: #imageLiteral(resourceName: "2-1")),
            CollectionPhoto(image: #imageLiteral(resourceName: "3-1")),
            CollectionPhoto(image: #imageLiteral(resourceName: "4-1")),
            CollectionPhoto(image: #imageLiteral(resourceName: "8")),
            CollectionPhoto(image: #imageLiteral(resourceName: "9")),
            CollectionPhoto(image: #imageLiteral(resourceName: "10")),
            CollectionPhoto(image: #imageLiteral(resourceName: "12")),
            CollectionPhoto(image: #imageLiteral(resourceName: "7")),
            CollectionPhoto(image: #imageLiteral(resourceName: "11")),
            CollectionPhoto(image: #imageLiteral(resourceName: "5")),
            CollectionPhoto(image: #imageLiteral(resourceName: "13")),
            CollectionPhoto(image: #imageLiteral(resourceName: "6")),
            CollectionPhoto(image: #imageLiteral(resourceName: "14")),
            CollectionPhoto(image: #imageLiteral(resourceName: "15")),
            CollectionPhoto(image: #imageLiteral(resourceName: "16"))
        ])
    ]
}
let storage = Storage.tableModel

public struct Storage {
 public   static let tableModel = [
        SectionPosts(photos: [
            Photo(label: "Photos", image: #imageLiteral(resourceName: "4"), image2: #imageLiteral(resourceName: "3"), image3: #imageLiteral(resourceName: "1"), image4: #imageLiteral(resourceName: "2"))
        ],
        posts: [
            Post(author: "Rick & morty", description: "Жанр: мультфильм, комедия, фантастика. Режиссёр: Уэсли Арчер, Пит Мишелс. В ролях: Джастин Ройланд, Крис Парнелл, Спенсер Грэммер. В центре сюжета - школьник по имени Морти и его дедушка Рик.", image: #imageLiteral(resourceName: "rick"), likes: "Likes: 1030", views: "Views: 2132"),
            Post(author: "Jaguar Club", description: "aguar XF — люксовый седан бизнес-класса/ спортивный седан, выпускаемый британской автомобилестроительной компанией Jaguar с 2008 года. Является преемником Jaguar S-type.", image: #imageLiteral(resourceName: "jaguar"), likes: "Likes: 230", views: "Views: 2330"),
            Post(author: "vedmak.official", description: "«Ведьмак: Кошмар волка» — анимационный фильм о мире «Ведьмака» от компании Netflix, который вышел на экраны 23 августа 2021 года.", image: #imageLiteral(resourceName: "vedmak"), likes: "Likes: 123", views: "Views: 1000"),
            Post(author: "vesti.rossia", description: "— Если вы имели возможность послушать то, что я говорил недавно в прямом эфире по телевидению, то знаете: я как раз против того, чтобы поднимать пенсионный возраст. И повторяю – пока я президент, это решение не будет принято.", image: #imageLiteral(resourceName: "pukin"), likes: "Likes: -1", views: "Views: 2")
        ])
    ]
}

