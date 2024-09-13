describe('Add to Cart Feature', () => {
  beforeEach(() => {
    cy.visit('/');
    cy.intercept('POST', '**/cart').as('addToCart');
  });

  it('should increase cart count by 1 when a product is added to the cart', () => {
    cy.get('.cart-count').should('have.text', '0');
    cy.get('.products article').first().find('.btn').click();
    cy.wait('@addToCart');
    cy.get('.cart-count').should('have.text', '1');
  });

  it('should increase cart count by 1 when a product is added to the cart', () => {
    cy.get('.cart-count').should('have.text', '0');
    cy.get('.products article').first().find('.btn').click();
    cy.wait('@addToCart');
    cy.debug();
    cy.get('.cart-count').should('have.text', '1');
  });
  
});
