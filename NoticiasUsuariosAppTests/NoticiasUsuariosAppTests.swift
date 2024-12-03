//
//  NoticiasUsuariosAppTests.swift
//  NoticiasUsuariosAppTests
//
//  Created by Facundo Hernández on 01/12/2024.
//

import XCTest
@testable import NoticiasUsuariosApp

final class ModeloTests: XCTestCase {

    func testInicializacionNoticia() {
        let noticia = Noticia(
            id: 1,
            slug: "lorem-ipsum",
            title: "Título de Prueba",
            content: "Contenido de Prueba",
            image: "https://via.placeholder.com/150",
            status: "published",
            category: "lorem",
            publishedAt: "2023-12-02",
            updatedAt: "14/03/2023 17:22:20",
            userId: 1
        )
        
        XCTAssertEqual(noticia.id, 1)
        XCTAssertEqual(noticia.slug, "lorem-ipsum")
        XCTAssertEqual(noticia.title, "Título de Prueba")
        XCTAssertEqual(noticia.content, "Contenido de Prueba")
        XCTAssertEqual(noticia.image, "https://via.placeholder.com/150")
        XCTAssertEqual(noticia.status, "published")
        XCTAssertEqual(noticia.category, "lorem")
        XCTAssertEqual(noticia.publishedAt, "2023-12-02")
        XCTAssertEqual(noticia.updatedAt, "14/03/2023 17:22:20")
        XCTAssertEqual(noticia.userId, 1)
    }

    func testInicializacionUsuario() {
        let direccion = Direccion(
            street: "123 Main Street",
            suite: "Apt. 4",
            city: "Anytown",
            zipcode: "12345",
            geo: Coordenadas(lat: "42.1234", lng: "-71.2345")
        )
        
        let login = Login(
            uuid: "1a0eed01-9430-4d68-901f-c0d4c1c3bf22",
            username: "johndoe",
            password: "jsonplaceholder.org",
            md5: "c1328472c5794a25723600f71c1b4586",
            sha1: "35544a31cc19bd6520af116554873167117f4d94",
            registered: "2023-01-10T10:03:20.022Z"
        )
        
        let empresa = Empresa(
            name: "ABC Company",
            catchPhrase: "Innovative solutions for all your needs",
            bs: "Marketing"
        )
        
        let usuario = Usuario(
            id: 1,
            firstname: "John",
            lastname: "Doe",
            email: "johndoe@example.com",
            birthDate: "1973-01-22",
            login: login,
            address: direccion,
            phone: "(555) 555-1234",
            website: "www.johndoe.com",
            company: empresa
        )
        
        XCTAssertEqual(usuario.id, 1)
        XCTAssertEqual(usuario.firstname, "John")
        XCTAssertEqual(usuario.lastname, "Doe")
        XCTAssertEqual(usuario.email, "johndoe@example.com")
        XCTAssertEqual(usuario.birthDate, "1973-01-22")
        XCTAssertEqual(usuario.login.uuid, "1a0eed01-9430-4d68-901f-c0d4c1c3bf22")
        XCTAssertEqual(usuario.address.street, "123 Main Street")
        XCTAssertEqual(usuario.address.geo.lat, "42.1234")
        XCTAssertEqual(usuario.company.name, "ABC Company")
    }
}
