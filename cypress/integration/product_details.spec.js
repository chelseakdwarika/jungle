describe('Product details', () => {

  it("navigates to appropriate product detail page", () => {
    cy.visit('http://localhost:3000/');
    cy.get(".products article").first().click();
    //product page loads successfully
    cy.url().should('include', '/products');
  });

});