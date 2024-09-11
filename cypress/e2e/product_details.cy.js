describe('Product Details Navigation', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('should navigate to the product detail page when clicking on a product', () => {
    cy.get('.products article').first().find('a').click();
    cy.url().should('include', '/products/');
    cy.get('h1').should('be.visible');
  });
});
