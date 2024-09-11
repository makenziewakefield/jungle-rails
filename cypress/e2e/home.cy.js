describe('Home Page', () => {
  it('visits the Jungle app homepage', () => {
    cy.visit('/');
  });

  it("There is 2 products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });
});

