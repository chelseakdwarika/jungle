describe('Jungle Rails', () => {

  before(() => {
    cy.visit('/');
  })
  
  it("There are products on the home page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are two products on the home page", () => {
        cy.get(".products article").should("have.length", 2);
  });

});