//
//  Models.swift
//  FishStore
//
//  Created by May06 on 5/10/26.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    var name: String
    var categoryId: UUID
    var price: Double
    var imageName: String
    var description: String
    var stock: Int
}

struct ProductCategory: Identifiable {
    let id = UUID()
    var name: String
    var iconName: String
}

struct CartItem: Identifiable {
    let id = UUID()
    var product: Product
    var quantity: Int
}

enum OrderStatus: String, CaseIterable {
    case pending = "Chờ xử lý"
    case preparing = "Đang chuẩn bị"
    case shipping = "Đang giao"
    case delivered = "Đã giao"
    case cancelled = "Đã hủy"
}

struct Order: Identifiable {
    let id = UUID()
    var customerName: String
    var items: [CartItem]
    var orderDate: Date
    var status: OrderStatus
    var shippingFee: Double
}
