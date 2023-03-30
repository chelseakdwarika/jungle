describe('Add to Cart', () => {

  beforeEach(() => {
    cy.visit('/');
  });

  it('There are 2 products on the page', () => {
    cy.get(".products article").should("have.length", 2);
  });

  it('Add to cart button increase Cart by 1', () => {
    cy.get("form.button_to").first().submit();
    cy.get(".nav-item.end-0").should('include.text', "My Cart (1)");
  });

});