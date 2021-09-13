//
//  File.swift
//  Navigation
//
//  Created by Dany on 08.09.2021.
//

import UIKit


struct Post {
  let author: String
  let description: String
  let image: UIImage
  let likes: String
  let views: String
}
let postRick = Post(author: "Rick & morty", description: "Жанр: мультфильм, комедия, фантастика. Режиссёр: Уэсли Арчер, Пит Мишелс. В ролях: Джастин Ройланд, Крис Парнелл, Спенсер Грэммер. В центре сюжета - школьник по имени Морти и его дедушка Рик.", image: #imageLiteral(resourceName: "rick"), likes: "Likes: 1030", views: "Views: 2132")

let postJag = Post(author: "Jaguar Club", description: "aguar XF — люксовый седан бизнес-класса/ спортивный седан, выпускаемый британской автомобилестроительной компанией Jaguar с 2008 года. Является преемником Jaguar S-type.", image: #imageLiteral(resourceName: "jaguar"), likes: "Likes: 230", views: "Views: 2330")


let postVedmak = Post(author: "vedmak.official", description: "«Ведьмак: Кошмар волка» — анимационный фильм о мире «Ведьмака» от компании Netflix, который вышел на экраны 23 августа 2021 года.", image: #imageLiteral(resourceName: "vedmak"), likes: "Likes: 123", views: "Views: 1000")

let postVesti = Post(author: "vesti.rossia", description: "— Если вы имели возможность послушать то, что я говорил недавно в прямом эфире по телевидению, то знаете: я как раз против того, чтобы поднимать пенсионный возраст. И повторяю – пока я президент, это решение не будет принято.", image: #imageLiteral(resourceName: "pukin"), likes: "Likes: -1", views: "Views: 2")

struct Storage {
  static let arrayOfPosts = [postRick,postJag,postVesti,postVedmak]
}
