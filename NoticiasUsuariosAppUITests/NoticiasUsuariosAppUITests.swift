//
//  NoticiasUsuariosAppUITests.swift
//  NoticiasUsuariosAppUITests
//
//  Created by Facundo Hernández on 01/12/2024.
//

import XCTest

import XCTest

final class NoticiasUsuariosAppUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testNavegacionEntreSecciones() {
    
        app.tabBars.buttons["Usuarios"].tap()
        XCTAssertTrue(app.staticTexts["Usuarios"].exists)

        app.tabBars.buttons["Noticias"].tap()
        XCTAssertTrue(app.staticTexts["Noticias"].exists)
    }

    func testBusquedaDeUsuarios() {
        
        app.tabBars.buttons["Usuarios"].tap()

        let searchField = app.textFields["BuscarUsuarios"]
        XCTAssertTrue(searchField.exists, "El campo de búsqueda de usuarios no existe.")
        searchField.tap()
        searchField.typeText("John")

        XCTAssertTrue(app.staticTexts["John Doe"].exists, "No se encontró el usuario John Doe.")
    }

    func testBusquedaDeNoticias() {

        app.tabBars.buttons["Noticias"].tap()
        let searchField = app.textFields["BuscarNoticias"]
        XCTAssertTrue(searchField.exists, "El campo de búsqueda de noticias no existe.")
        searchField.tap()
        searchField.typeText("Lorem")

        XCTAssertTrue(app.staticTexts["Lorem ipsum dolor sit amet, consectetur adipiscing elit."].exists, "No se encontró la noticia Lorem ipsum.")
    }

}

