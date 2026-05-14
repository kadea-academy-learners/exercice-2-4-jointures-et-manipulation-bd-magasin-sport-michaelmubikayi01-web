1/ SELECT 
    p.nom_produit, 
    vi.nom_ville, 
    ve.date_vente, 
    ve.quantite_vendue
FROM ventes ve
INNER JOIN produits p 
    ON ve.id_produit = p.id_produit
INNER JOIN magasins m 
    ON ve.id_magasin = m.id_magasin
INNER JOIN villes vi 
    ON m.id_ville = vi.id_ville;


2/SELECT 
    p.nom_produit, 
    p.prix, 
    ve.quantite_vendue
FROM ventes ve
INNER JOIN produits p 
    ON ve.id_produit = p.id_produit
INNER JOIN magasins m 
    ON ve.id_magasin = m.id_magasin
INNER JOIN villes vi 
    ON m.id_ville = vi.id_ville
WHERE vi.nom_ville IN ('Goma', 'Bukavu');


3/SELECT 
    p.nom_produit, 
    SUM(ve.quantite_vendue) AS total_quantite
FROM ventes ve
INNER JOIN produits p ON ve.id_produit = p.id_produit
INNER JOIN categories c ON p.id_categorie = c.id_categorie
INNER JOIN magasins m ON ve.id_magasin = m.id_magasin
INNER JOIN villes vi ON m.id_ville = vi.id_ville
WHERE vi.nom_ville = 'Lubumbashi' 
  AND c.nom_categorie = 'Running'
GROUP BY p.nom_produit
ORDER BY total_quantite DESC;

4/SELECT 
    m.nom_magasin, 
    vi.nom_ville, 
    SUM(p.prix * ve.quantite_vendue) AS chiffre_affaires_total
FROM ventes ve
INNER JOIN produits p 
    ON ve.id_produit = p.id_produit
INNER JOIN magasins m 
    ON ve.id_magasin = m.id_magasin
INNER JOIN villes vi 
    ON m.id_ville = vi.id_ville
GROUP BY m.nom_magasin, vi.nom_ville
ORDER BY chiffre_affaires_total DESC
LIMIT 1;

5/ SELECT DISTINCT 
    vi.nom_ville, 
    c.nom_categorie
FROM villes vi
INNER JOIN magasins m 
    ON vi.id_ville = m.id_ville
INNER JOIN ventes ve 
    ON m.id_magasin = ve.id_magasin
INNER JOIN produits p 
    ON ve.id_produit = p.id_produit
INNER JOIN categories c 
    ON p.id_categorie = c.id_categorie
ORDER BY vi.nom_ville, c.nom_categorie;
